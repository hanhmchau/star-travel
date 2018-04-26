package chau.controller;

import chau.dto.Cart;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class RemoveFromCartAction extends ActionSupport{
    private String id;

    public void setId(String id) {
        this.id = id;
    }

    @Override
    public String execute() throws Exception {
        Cart cart = (Cart) ActionContext.getContext().getSession().get("CART");
        return cart.removeItem(id) ? Action.SUCCESS : Action.ERROR;
    }
}
