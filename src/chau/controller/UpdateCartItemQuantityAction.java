package chau.controller;

import chau.dao.TourDAO;
import chau.dto.Cart;
import chau.dto.CartItem;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class UpdateCartItemQuantityAction extends ActionSupport {
    private String id;
    private int adultCount;
    private int childCount;

    public void setId(String id) {
        this.id = id;
    }

    public void setAdultCount(int adultCount) {
        this.adultCount = adultCount;
    }

    public void setChildCount(int childCount) {
        this.childCount = childCount;
    }

    @Override
    public String execute() throws Exception {
        Cart cart = (Cart) ActionContext.getContext().getSession().get("CART");
        if (cart == null) {
            return Action.ERROR;
        }
        TourDAO dao = new TourDAO();
        CartItem thisItem = cart.getContents().stream().filter(cartItem -> cartItem.getId().equals(id)).findFirst().get();
        if (thisItem != null) {
            if (dao.getTotalSeatCountLeft(id) >= adultCount + childCount) {
                thisItem.setAdultSeat(adultCount);
                thisItem.setChildSeat(childCount);
                return Action.SUCCESS;
            }
        }
        return Action.ERROR;
    }
}
