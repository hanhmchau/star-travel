package chau.dto;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class OrderDTO implements Serializable {
    private String id;
    private UserDTO userDTO;
    private Date date;
    private List<OrderItemDTO> orderItems;
    private String address;
    private String phone;
    private double total;

    public OrderDTO(String id, UserDTO userDTO, Date date) {
        this.id = id;
        this.userDTO = userDTO;
        this.date = date;
    }

    public OrderDTO(String id, UserDTO userDTO, Date date, String address, String phone) {
        this.id = id;
        this.userDTO = userDTO;
        this.date = date;
        this.address = address;
        this.phone = phone;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public UserDTO getUserDTO() {
        return userDTO;
    }

    public void setUserDTO(UserDTO userDTO) {
        this.userDTO = userDTO;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public List<OrderItemDTO> getOrderItems() {
        return orderItems;
    }

    public void setOrderItems(List<OrderItemDTO> orderItems) {
        this.orderItems = orderItems;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public double getTotal() {
        return orderItems.stream().map(OrderItemDTO::getPrice).reduce((a, b) -> a+b).orElse(0d);
    }
}
