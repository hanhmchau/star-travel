package chau.controller;

import chau.dao.OrderDAO;
import chau.dao.UserDAO;
import chau.dto.OrderDTO;
import chau.dto.OrderItemDTO;
import chau.dto.UserDTO;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import java.util.List;
import java.util.Map;

public class ViewAllInvoicesPageAction extends ActionSupport {

    private String userId;
    private UserDTO user;
    private List<OrderDTO> orders;
    private int tourBooked;
    private double totalMoney;
    private double maxMoney;

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public UserDTO getUser() {
        return user;
    }

    public int getTourBooked() {
        return tourBooked;
    }

    public double getTotalMoney() {
        return totalMoney;
    }

    public double getMaxMoney() {
        return maxMoney;
    }

    public List<OrderDTO> getOrders() {
        return orders;
    }

    @Override
    public String execute() throws Exception {
        OrderDAO dao = new OrderDAO();
        user = (new UserDAO()).findUserById(userId);
        orders = dao.getAllOrdersByUser(user.getId());
        tourBooked = orders.stream().mapToInt(orderDTO -> orderDTO.getOrderItems().size()).sum();
        totalMoney = orders.stream().mapToDouble(OrderDTO::getTotal).sum();
        maxMoney = orders.stream().mapToDouble(OrderDTO::getTotal).max().orElse(0);
        return Action.SUCCESS;
    }
}
