package chau.controller;

import chau.dao.OrderDAO;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;

public class CancelOrderItemAction extends ActionSupport {
    private String id;
    private int adultSeat;
    private int childSeat;
    private double remainingPrice;
    private OrderDAO.CancelResult result;

    public void setId(String id) {
        this.id = id;
    }

    public void setAdultSeat(int adultSeat) {
        this.adultSeat = adultSeat;
    }

    public void setChildSeat(int childSeat) {
        this.childSeat = childSeat;
    }

    public double getRemainingPrice() {
        return remainingPrice;
    }

    public OrderDAO.CancelResult getResult() {
        return result;
    }

    @Override
    public String execute() throws Exception {
        OrderDAO dao = new OrderDAO();
        result = dao.cancelOrderItem(id, adultSeat, childSeat);
        remainingPrice = dao.getOrderItemTotal(id);
        return result.result ? Action.SUCCESS : Action.ERROR;
    }
}
