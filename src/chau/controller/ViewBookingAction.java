package chau.controller;

import chau.dao.OrderDAO;
import chau.dao.TourDAO;
import chau.dto.*;
import chau.utils.MyUtils;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.interceptor.CookiesAware;

import javax.servlet.http.Cookie;
import java.util.Map;

public class ViewBookingAction extends ActionSupport{
    @Override
    public String execute() throws Exception {
        Cart cart = (Cart) ActionContext.getContext().getSession().get("CART");
        TourDAO dao = new TourDAO();
        if (cart != null) {
            for (CartItem item: cart.getContents()) {
                TourDateDTO dto = dao.getTourDateForCartItem(item.getId());
                if (dto != null) {
                    item.setTourDateDTO(dto);
                } else {
                    cart.removeItem(item);
                }
            }
        }
        ActionContext.getContext().getSession().put("CART", cart);
        return Action.SUCCESS;
    }
}
