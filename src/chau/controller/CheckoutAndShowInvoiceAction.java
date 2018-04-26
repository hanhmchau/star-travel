package chau.controller;

import chau.dao.OrderDAO;
import chau.dto.Cart;
import chau.dto.UserDTO;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import java.util.Map;

public class CheckoutAndShowInvoiceAction extends ActionSupport {

    private String address;
    private String phone;
    private Cart invoicedCart;

    public void setAddress(String address) {
        this.address = address;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public String getPhone() {
        return phone;
    }

    public Cart getInvoicedCart() {
        return invoicedCart;
    }

    @Override
    public String execute() throws Exception {
        Map<String, Object> session = ActionContext.getContext().getSession();
        invoicedCart = (Cart) session.get("CART");
        if (invoicedCart == null || invoicedCart.getContents().isEmpty()) {
            return Action.NONE;
        }
        UserDTO user = (UserDTO) session.get("USER");
        user.setAddress(address);
        user.setPhone(phone);
        OrderDAO dao = new OrderDAO();
        if (dao.checkoutCart(invoicedCart, user)) {
            session.remove("CART");
            return Action.SUCCESS;
        } else {
            return Action.ERROR;
        }
    }
}
