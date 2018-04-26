/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package chau.dao;

import chau.consts.Consts;
import chau.utils.MyConnection;
import chau.dto.UserDTO;
import chau.utils.MyUtils;

import java.sql.Connection;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class UserDAO extends AbstractDAO {

    private String getNextUserId() throws Exception {
        String id = null;
        try {
            String sql = "SELECT MAX(CAST(SUBSTRING(id, LEN(?)+1, LEN(id)) AS INT))+1 AS 'nextId' FROM [User]";
            con = MyConnection.getMyConnection();
            psm = con.prepareStatement(sql);
            psm.setString(1, Consts.PREFIX.USER_PREFIX);
            rs = psm.executeQuery();
            if (rs.next()) {
                long nextId = rs.getLong("nextId");
                id = Consts.PREFIX.USER_PREFIX + nextId;
            }
        } finally {
            closeConnection();
        }
        return id;
    }

    public String signUp(String displayName, String email, String password, String address, String phone) throws Exception {
        String id = getNextUserId();
        try {
            String sql = "INSERT INTO [User] (display_name, email, password, salt, status, role, date_registered, address, phone, id) " +
                    "VALUES(?,?,?,?,?,?,?,?,?,?)";
            con = MyConnection.getMyConnection();
            psm = con.prepareStatement(sql);

            email = email.toLowerCase();

            String salt = MyUtils.createRandomSalt();
            String passwordHash = MyUtils.hash(password+salt);
            String lul = MyUtils.hash("12345678"+salt);
            boolean l = lul.equals(passwordHash);
            psm.setString(1, displayName);
            psm.setString(2, email);
            psm.setString(3, passwordHash);
            psm.setString(4, salt);
            psm.setInt(5, Consts.USER_STATUS.ACTIVE.value);
            psm.setInt(6, Consts.ROLE_STATUS.USER.value);
            psm.setDate(7, new java.sql.Date(new Date().getTime()));
            psm.setString(8, address);
            psm.setString(9, phone);
            psm.setString(10, id);
            if (psm.executeUpdate() == 0) {
                id = null;
            }
        } finally {
            closeConnection();
        }
        return id;
    }

    public UserDTO checkLogin(String email, String password) throws Exception {
        UserDTO dto = null;
        try {
            String sql = "SELECT password, salt, id, display_name, role, status FROM [User] WHERE email = ?";
            con = MyConnection.getMyConnection();
            psm = con.prepareStatement(sql);
            psm.setString(1, email.toLowerCase());
            rs = psm.executeQuery();
            if (rs.next()) { //email is UNIQUE KEY
                String passwordHash = rs.getString("password");
                String salt = rs.getString("salt");
                if (MyUtils.hash(password+salt).equals(passwordHash)) { //password correct!
                    String displayName = rs.getString("display_name");
                    int role = rs.getInt("role");
                    String id = rs.getString("id");
                    dto = new UserDTO(id, email, displayName, role);
                    dto.setStatus(rs.getInt("status"));
                }
            }
        } finally {
            closeConnection();
        }
        return dto;
    }

    public UserDTO findUserById(String id) throws Exception {
        UserDTO dto = null;
        try {
            String sql = "SELECT email, display_name, role, date_registered, address, phone FROM [User] WHERE id = ?";
            con = MyConnection.getMyConnection();
            psm = con.prepareStatement(sql);
            psm.setString(1, id);
            rs = psm.executeQuery();
            if (rs.next()) {
                String email = rs.getString("email");
                String displayName = rs.getString("display_name");
                int role = rs.getInt("role");
                String address = rs.getString("address");
                String phone = rs.getString("phone");
                dto = new UserDTO(id, email, displayName, role);
                dto.setAddress(address);
                dto.setPhone(phone);
            }
        } finally {
            closeConnection();
        }
        return dto;
    }

    public boolean updatePassword(String userId, String oldPassword, String newPassword) throws Exception {
        boolean result = false;
        try {
            String sql = "SELECT password, salt FROM [User] WHERE id = ?";
            con = MyConnection.getMyConnection();
            psm = con.prepareStatement(sql);
            psm.setString(1, userId);
            rs = psm.executeQuery();
            if (rs.next()) {
                String passwordHash = rs.getString("password");
                String salt = rs.getString("salt");
                String oldHash = MyUtils.hash(oldPassword + salt);
                if (passwordHash.equals(oldHash)) {
                    String sqlInsert = "UPDATE [User] SET password = ? WHERE id = ?";
                    psm = con.prepareStatement(sqlInsert);
                    psm.setString(1, MyUtils.hash(newPassword + salt));
                    psm.setString(2, userId);
                    result = psm.executeUpdate() > 0;
                }
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean updateEmail(String userId, String oldPassword, String newEmail) throws Exception {
        boolean result = false;
        try {
            String sql = "SELECT password, salt FROM [User] WHERE id = ?";
            con = MyConnection.getMyConnection();
            psm = con.prepareStatement(sql);
            psm.setString(1, userId);
            rs = psm.executeQuery();
            if (rs.next()) {
                String passwordHash = rs.getString("password");
                String salt = rs.getString("salt");
                String oldHash = MyUtils.hash(oldPassword + salt);
                if (passwordHash.equals(oldHash)) {
                    String sqlInsert = "UPDATE [User] SET email = ? WHERE id = ?";
                    psm = con.prepareStatement(sqlInsert);
                    psm.setString(1, newEmail);
                    psm.setString(2, userId);
                    result = psm.executeUpdate() > 0;
                }
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean updateDisplayName(String userId, String displayName) throws Exception {
        boolean result;
        try {
            String sql = "UPDATE [User] SET display_name = ? WHERE id = ?";
            con = MyConnection.getMyConnection();
            psm = con.prepareStatement(sql);
            psm.setString(1, displayName);
            psm.setString(2, userId);
            result = psm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean updateAddress(String userId, String address) throws Exception {
        boolean result;
        try {
            String sql = "UPDATE [User] SET address = ? WHERE id = ?";
            con = MyConnection.getMyConnection();
            psm = con.prepareStatement(sql);
            psm.setString(1, address);
            psm.setString(2, userId);
            result = psm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean updatePhone(String userId, String phone) throws Exception {
        boolean result;
        try {
            String sql = "UPDATE [User] SET phone = ? WHERE id = ?";
            con = MyConnection.getMyConnection();
            psm = con.prepareStatement(sql);
            psm.setString(1, phone);
            psm.setString(2, userId);
            result = psm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return result;
    }


    public List<UserDTO> getAllUsers(int page, int perpage) throws Exception {
        List<UserDTO> list = new ArrayList<>();
        try {
            String sql = "SELECT id, email, display_name, role, date_registered, address, status, phone FROM [User] " +
                    "ORDER BY id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
            con = MyConnection.getMyConnection();
            psm = con.prepareStatement(sql);
            psm.setInt(1, perpage * (page-1));
            psm.setInt(2, perpage);
            rs = psm.executeQuery();
            while (rs.next()) {
                String id = rs.getString("id");
                String email = rs.getString("email");
                String displayName = rs.getString("display_name");
                int role = rs.getInt("role");
                int status = rs.getInt("status");
                String address = rs.getString("address");
                String phone = rs.getString("phone");
                UserDTO dto = new UserDTO(id, email, displayName, role);
                dto.setAddress(address);
                dto.setStatus(status);
                dto.setPhone(phone);
                list.add(dto);
            }
        } finally {
            closeConnection();
        }
        return list;
    }

    public int getTotalUserCount() throws Exception {
        int count = 0;
        try {
            String sql = "SELECT COUNT(id) FROM [User]";
            con = MyConnection.getMyConnection();
            psm = con.prepareStatement(sql);
            rs = psm.executeQuery();
            if (rs.next()) count = rs.getInt(1);
        } finally {
            closeConnection();
        }
        return count;
    }

    public boolean setUserStatus(String id, boolean status) throws Exception {
        boolean result;
        try {
            String sql = "UPDATE [User] SET status = ? WHERE id = ?";
            con = MyConnection.getMyConnection();
            psm = con.prepareStatement(sql);
            psm.setBoolean(1, status);
            psm.setString(2, id);
            result = psm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return result;
    }

    public List<UserDTO> getUsersHighestProfit(int limit) throws Exception {
        List<UserDTO> list = new ArrayList<>();
        try {
            String sql = "SELECT u.id, display_name, total " +
                    "FROM [User] u, " +
                    "(" +
                    "SELECT TOP (?) tabl.userId as 'id', SUM(tabl.total) as 'total' " +
                    "FROM (" +
                    "SELECT temp.id, temp.total, u.id as 'userId', u.display_name " +
                    "FROM " +
                    "( " +
                    "SELECT id, title, title_url, ((SELECT SUM(adult_seat) FROM OrderItem oi WHERE tour_date_id IN (SELECT id FROM Tour_StartDates WHERE tour_id = t.id)) * t.adult_price + " +
                    "(SELECT SUM(child_seat) FROM OrderItem oi WHERE tour_date_id IN (SELECT id FROM Tour_StartDates WHERE tour_id = t.id)) * t.child_price - " +
                    "ISNULL((SELECT SUM((adult_seat) * refund_rate) FROM Refund WHERE order_item_id IN (SELECT id FROM OrderItem WHERE tour_date_id IN (SELECT id FROM Tour_StartDates WHERE tour_id = t.id))), 0) * t.adult_price - " +
                    "ISNULL((SELECT SUM((child_seat) * refund_rate) FROM Refund WHERE order_item_id IN (SELECT id FROM OrderItem WHERE tour_date_id IN (SELECT id FROM Tour_StartDates WHERE tour_id = t.id))), 0) * t.child_price) as 'total' FROM Tour t" +
                    ") temp, [Order] o, [User] u, OrderItem oi " +
                    "WHERE u.id = o.user_id AND oi.order_id = o.id AND oi.tour_date_id IN (SELECT id FROM Tour_StartDates WHERE tour_id = temp.id)) tabl " +
                    "GROUP BY userId " +
                    "ORDER BY total DESC " +
                    ") big_table " +
                    "WHERE big_table.id = u.id ";
            con = MyConnection.getMyConnection();
            psm = con.prepareStatement(sql);
            psm.setInt(1, limit);
            rs = psm.executeQuery();
            while (rs.next()) {
                String id = rs.getString("id");
                String name = rs.getString("display_name");
                double total = rs.getDouble("total");
                UserDTO dto = new UserDTO();
                dto.setId(id);
                dto.setDisplayName(name);
                dto.setTotal(total);
                list.add(dto);
            }
        } finally {
            closeConnection();
        }
        return list;
    }
}
