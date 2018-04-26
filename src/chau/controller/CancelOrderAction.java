package chau.controller;

import chau.dao.OrderDAO;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;

public class CancelOrderAction extends ActionSupport {

    private String id;

    public void setId(String id) {
        this.id = id;
    }

    @Override
    public String execute() throws Exception {
        OrderDAO dao = new OrderDAO();
        if (!dao.isCancellableOrder(id)) {
            return Action.ERROR;
        }
        return dao.cancelOrder(id) ? Action.SUCCESS : Action.ERROR;
    }
}
