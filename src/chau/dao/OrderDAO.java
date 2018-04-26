package chau.dao;

import chau.consts.Consts;
import chau.dto.*;
import chau.utils.MyConnection;

import javax.persistence.criteria.Order;
import java.sql.Statement;
import java.time.*;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;

public class OrderDAO extends AbstractDAO {

    public boolean isValidCartItem(CartItem cartItem) throws Exception {
        try {
            TourDAO dao = new TourDAO();
            TourDateDTO tourDateDTO = dao.getTourDateForCartItem(cartItem.getId());
            if (tourDateDTO == null || tourDateDTO.getTour() == null) {
                return false;
            }
            TourDTO tour = tourDateDTO.getTour();
            if (cartItem.getAdultSeat() <= 0 || cartItem.getChildSeat() > cartItem.getAdultSeat()) {
                return false;
            }
            if (tour.getSeatTotal() < cartItem.getAdultSeat() + cartItem.getChildSeat()) {
                return false;
            }
            return true;
        } finally {
            closeConnection();
        }
    }

    private String getNextOrderId() throws Exception {
        String id = null;
        try {
            String sql = "SELECT ISNULL(MAX(CAST(SUBSTRING(id, LEN(?)+1, LEN(id)) AS INT))+1, 0) AS 'nextId' FROM [Order]";
            con = MyConnection.getMyConnection();
            psm = con.prepareStatement(sql);
            psm.setString(1, Consts.PREFIX.ORDER_PREFIX);
            rs = psm.executeQuery();
            if (rs.next()) {
                long nextId = rs.getLong("nextId");
                id = Consts.PREFIX.ORDER_PREFIX + nextId;
            }
        } finally {
            closeConnection();
        }
        return id;
    }

    public boolean checkoutCart(Cart cart, UserDTO user) throws Exception {
        boolean result = false;
        String orderId = getNextOrderId();
        try {
            String sql = "INSERT INTO [Order](id, user_id, date_ordered, address, phone) VALUES(?,?,?,?,?)";
            con = MyConnection.getMyConnection();
            psm = con.prepareStatement(sql);
            psm.setString(1, orderId);
            psm.setString(2, user.getId());
            psm.setDate(3, new java.sql.Date(new Date().getTime()));
            psm.setString(4, user.getAddress());
            psm.setString(5, user.getPhone());
            psm.executeUpdate();
            String orderItemSql = "INSERT INTO [OrderItem](id, order_id, tour_date_id, adult_seat, child_seat, price) " +
                    "VALUES(?,?,?,?,?,?)";
            psm = con.prepareStatement(orderItemSql);
            int i = 0;
            for (CartItem cartItem: cart.getContents()) {
                String thisId = orderId + i;
                psm.setString(1, thisId);
                psm.setString(2, orderId);
                psm.setString(3, cartItem.getTourDateDTO().getId());
                psm.setInt(4, cartItem.getAdultSeat());
                psm.setInt(5, cartItem.getChildSeat());
                psm.setDouble(6, cartItem.getTemporaryTotal());
                psm.addBatch();
                i++;
            }
            psm.executeBatch();
            result = true;
        } finally {
            closeConnection();
        }
        return result;
    }

    public List<OrderDTO> getAllOrdersByUser(String userId) throws Exception {
        List<OrderDTO> list = new ArrayList<>();
        List<String> ids = new ArrayList<>();
        try {
            String sql = "SELECT id FROM [Order] WHERE user_id = ? AND status = ? ORDER BY date_ordered DESC";
            con = MyConnection.getMyConnection();
            psm = con.prepareStatement(sql);
            psm.setString(1, userId);
            psm.setInt(2, Consts.ORDER_STATUS.ACTIVE);
            rs = psm.executeQuery();
            while (rs.next()) {
                String id = rs.getString("id");
                ids.add(id);
            }
            for (String id: ids) {
                OrderDTO order = getOrderById(id);
                if (!order.getOrderItems().isEmpty()) {
                    list.add(order);
                }
            }
        } finally {
            closeConnection();
        }
        return list;
    }

    public OrderDTO getOrderById(String id) throws Exception {
        OrderDTO orderDTO = null;
        UserDAO dao = new UserDAO();
        try {
            String sql = "SELECT user_id, date_ordered, address, phone FROM [Order] WHERE id = ?";
            con = MyConnection.getMyConnection();
            psm = con.prepareStatement(sql);
            psm.setString(1, id);
            rs = psm.executeQuery();
            if (rs.next()) {
                String userId = rs.getString("user_id");
                UserDTO userDTO = dao.findUserById(userId);
                Date date = rs.getDate("date_ordered");
                String address = rs.getString("address");
                String phone = rs.getString("phone");
                orderDTO = new OrderDTO(id, userDTO, date, address, phone);
                orderDTO.setOrderItems(getOrderItemsByOrderId(id));
            }
        } finally {
            closeConnection();
        }
        return orderDTO;
    }

    public List<OrderItemDTO> getOrderItemsByOrderId(String orderId) throws Exception {
        List<OrderItemDTO> list = new ArrayList<>();
        TourDAO dao = new TourDAO();
        try {
            String sql = "SELECT id, tour_date_id, adult_seat - ISNULL((SELECT SUM(adult_seat) FROM [Refund] WHERE order_item_id = o.id), 0) as 'adult_seat', " +
                    "child_seat - ISNULL((SELECT SUM(child_seat) FROM [Refund] WHERE order_item_id = o.id), 0) as 'child_seat', price," +
                    "(SELECT CASE " +
                    "       WHEN DATEDIFF(day, GETDATE(), (SELECT [start_date] FROM [Tour_StartDates] WHERE id = o.tour_date_id)) >= ? " +
                    "           THEN 1 " +
                    "           ELSE 0 " +
                    "           END) as 'cancellable' " +
                    "FROM [OrderItem] o WHERE order_id = ? AND status = ?";
            con = MyConnection.getMyConnection();
            psm = con.prepareStatement(sql);
            psm.setInt(1, Consts.UNCANCELLABLE_WINDOW);
            psm.setString(2, orderId);
            psm.setInt(3, Consts.ORDER_STATUS.ACTIVE);
            rs = psm.executeQuery();
            while (rs.next()) {
                String id = rs.getString("id");
                String tourDateId = rs.getString("tour_date_id");
                TourDateDTO tourDateDTO = dao.getTourDateForCartItem(tourDateId);
                int adultSeat = rs.getInt("adult_seat");
                int childSeat = rs.getInt("child_seat");
                boolean cancellable = rs.getBoolean("cancellable");
                OrderItemDTO orderItemDTO = new OrderItemDTO(id, tourDateDTO, adultSeat, childSeat, 0);
                orderItemDTO.setTourDateDTO(tourDateDTO);
                orderItemDTO.setCancellable(cancellable);
                list.add(orderItemDTO);
            }
            for (OrderItemDTO dto: list) {
                dto.setPrice(getOrderItemTotal(dto.getId()));
                dto.setRefunds(getOrderItemRefunds(dto.getId()));
            }
        } finally {
            closeConnection();
        }
        return list;
    }

    public List<RefundDTO> getOrderItemRefunds(String orderItemId) throws Exception {
        List<RefundDTO> list = new ArrayList<>();
        try {
            String sql = "SELECT id, date_refunded, adult_seat, child_seat, refund_rate FROM [Refund] WHERE order_item_id = ?";
            con = MyConnection.getMyConnection();
            psm = con.prepareStatement(sql);
            psm.setString(1, orderItemId);
            rs = psm.executeQuery();
            while (rs.next()) {
                String id = rs.getString("id");
                Date date = rs.getDate("date_refunded");
                int adultSeat = rs.getInt("adult_seat");
                int childSeat = rs.getInt("child_seat");
                double refundRate = rs.getDouble("refund_rate");
                list.add(new RefundDTO(id, adultSeat, childSeat, refundRate, date));
            }
        } finally {
            closeConnection();
        }
        return list;
    }

    public OrderItemDTO getOrderItemById(String id) throws Exception {
        OrderItemDTO orderItemDTO = null;
        TourDAO dao = new TourDAO();
        try {
            String sql = "SELECT id, tour_date_id, adult_seat, child_seat, price FROM [OrderItem] WHERE id = ?";
            con = MyConnection.getMyConnection();
            psm = con.prepareStatement(sql);
            psm.setString(1, id);
            rs = psm.executeQuery();
            if (rs.next()) {
                String tourDateId = rs.getString("tour_date_id");
                TourDateDTO tourDateDTO = dao.getTourDateForCartItem(tourDateId);
                int adultSeat = rs.getInt("adult_seat");
                int childSeat = rs.getInt("child_seat");
                double price = rs.getDouble("price");
                orderItemDTO = new OrderItemDTO(id, tourDateDTO, adultSeat, childSeat, price);
            }
        } finally {
            closeConnection();
        }
        return orderItemDTO;
    }

    private CancelResult getRefundRate(String orderItemId) throws Exception {
        CancelResult result = new CancelResult();
        OrderItemDTO dto = getOrderItemById(orderItemId);
        java.util.Date date = dto.getTourDateDTO().getDate();
        LocalDate tourDate = ((java.sql.Date) date).toLocalDate();
        LocalDate now = LocalDate.now();
        int dateDiff = ((Long) now.until(tourDate, ChronoUnit.DAYS)).intValue();
        result.dayToTourDate = dateDiff;
        for (Consts.CANCEL_WINDOW window: Consts.CANCEL_WINDOW.values()) {
            if (dateDiff > window.dayToTourDate) {
                result.refundRate = window.refundRate;
                break;
            }
        }
        return result;
    }

    public class CancelResult {
        public boolean result;
        public double refundRate;
        public int dayToTourDate;

        public boolean isResult() {
            return result;
        }

        public double getRefundRate() {
            return refundRate;
        }

        public int getDayToTourDate() {
            return dayToTourDate;
        }
    }

    public CancelResult cancelOrderItem(String orderItemId, int adultSeat, int childSeat) throws Exception {
        CancelResult result = getRefundRate(orderItemId);
        String id = getNextRefundId();
        try {
            String sql = "INSERT INTO [Refund] VALUES(?,?,?,?,?,?)";
            con = MyConnection.getMyConnection();
            psm = con.prepareStatement(sql);
            psm.setString(1, id);
            psm.setString(2, orderItemId);
            psm.setDate(3, new java.sql.Date(new Date().getTime()));
            psm.setInt(4, adultSeat);
            psm.setInt(5, childSeat);
            psm.setDouble(6, result.refundRate);
            result.result = psm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean cancelOrder(String id) throws Exception {
        boolean result;
        try {
            String sql = "UPDATE [Order] SET status = ? WHERE id = ?";
            con = MyConnection.getMyConnection();
            psm = con.prepareStatement(sql);
            psm.setInt(1, Consts.ORDER_STATUS.CANCELLED);
            psm.setString(2, id);
            result = psm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean isCancellableOrder(String id) throws Exception {
        boolean result = false;
        try {
            String sql = "SELECT count(id) FROM [OrderItem] o WHERE status = ? AND order_id = ? AND " +
                    "(SELECT CASE WHEN DATEDIFF(day, GETDATE(), (SELECT [start_date] FROM [Tour_StartDates] WHERE id = o.tour_date_id)) < ? " +
                    "   THEN 1 ELSE 0 END) = 1";
            con = MyConnection.getMyConnection();
            psm = con.prepareStatement(sql);
            psm.setInt(1, Consts.ORDER_STATUS.ACTIVE);
            psm.setString(2, id);
            psm.setInt(3, Consts.UNCANCELLABLE_WINDOW);
            rs = psm.executeQuery();
            if (rs.next()) {
                int count = rs.getInt(1);
                result = (count == 0);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    private String getNextRefundId() throws Exception {
        String id = null;
        try {
            String sql = "SELECT ISNULL(MAX(CAST(SUBSTRING(id, LEN(?)+1, LEN(id)) AS INT))+1, 0) AS 'nextId' FROM [Refund]";
            con = MyConnection.getMyConnection();
            psm = con.prepareStatement(sql);
            psm.setString(1, Consts.PREFIX.REFUND_PREFIX);
            rs = psm.executeQuery();
            if (rs.next()) {
                long nextId = rs.getLong("nextId");
                id = Consts.PREFIX.REFUND_PREFIX + nextId;
            }
        } finally {
            closeConnection();
        }
        return id;
    }

    private String getNextOrderItemId() throws Exception {
        String id = null;
        try {
            String sql = "SELECT ISNULL(MAX(CAST(SUBSTRING(id, LEN(?)+1, LEN(id)) AS INT))+1, 0) AS 'nextId' FROM [OrderItem]";
            con = MyConnection.getMyConnection();
            psm = con.prepareStatement(sql);
            psm.setString(1, Consts.PREFIX.ORDER_PREFIX);
            rs = psm.executeQuery();
            if (rs.next()) {
                long nextId = rs.getLong("nextId");
                id = Consts.PREFIX.ORDER_PREFIX + nextId;
            }
        } finally {
            closeConnection();
        }
        return id;
    }

    public double getOrderItemTotal(String id) throws Exception {
        double total = 0;
        try {
            String sql ="SELECT (adult_seat - ISNULL((SELECT SUM(adult_seat * refund_rate) FROM Refund WHERE order_item_id = oi.id GROUP BY order_item_id), 0)) * " +
                    "(SELECT adult_price FROM Tour WHERE id = (SELECT tour_id FROM Tour_StartDates WHERE id =oi.tour_date_id)) + " +
                    "(child_seat - ISNULL((SELECT SUM(child_seat * refund_rate) FROM Refund WHERE order_item_id = oi.id GROUP BY order_item_id),0)) * " +
                    "(SELECT child_price FROM Tour WHERE id = (SELECT tour_id FROM Tour_StartDates WHERE id =oi.tour_date_id)) " +
                    " FROM OrderItem oi WHERE id = ?";
            con= MyConnection.getMyConnection();
            psm = con.prepareStatement(sql);
            psm.setString(1, id);
            rs = psm.executeQuery();
            if (rs.next()) {
                total = rs.getDouble(1);
            }
        } finally {
            closeConnection();
        }
        return total;
    }
}
