package chau.controller;

import chau.dao.OrderDAO;
import chau.dao.TourDAO;
import chau.dao.UserDAO;
import chau.dto.*;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

public class ViewCheckoutPageAction extends ActionSupport {

    private Cart cart;
    private int removal = 0;
    private String address;
    private String phone;

    public Cart getCart() {
        return cart;
    }

    public int getRemoval() {
        return removal;
    }

    public String getAddress() {
        return address;
    }

    public String getPhone() {
        return phone;
    }

    @Override
    public String execute() throws Exception {
        UserDAO dao = new UserDAO();
        Map<String, Object> session = ActionContext.getContext().getSession();
        UserDTO currentUser = (UserDTO) session.get("USER");
        UserDTO user = dao.findUserById(currentUser.getId());
        phone = user.getPhone();
        address = user.getAddress();

        Cart sessionCart = (Cart) session.get("CART");
        if (sessionCart == null) {
            return Action.NONE;
        }
        cart = new Cart();
        OrderDAO orderDAO = new OrderDAO();
        for (CartItem item: sessionCart.getContents()) {
            if (orderDAO.isValidCartItem(item)) {
                cart.getContents().add(item);
            } else {
                removal++;
            }
        }
        session.put("CART", cart);
        return Action.SUCCESS;
//        return cart.getContents().isEmpty() ? Action.NONE : Action.SUCCESS;
    }
}
