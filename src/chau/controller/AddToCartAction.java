package chau.controller;

import chau.dao.TourDAO;
import chau.dto.Cart;
import chau.dto.CartItem;
import chau.dto.UserDTO;
import chau.utils.MyUtils;
import com.google.gson.Gson;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.CookieProvider;
import org.apache.struts2.interceptor.CookiesAware;
import org.apache.struts2.interceptor.ServletResponseAware;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

public class AddToCartAction extends ActionSupport {
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
            cart  = new Cart();
        }
        CartItem newItem = new CartItem(id, adultCount, childCount);
        cart.addItem(newItem);
        ActionContext.getContext().getSession().put("CART", cart);
        return Action.SUCCESS;
    }
}
