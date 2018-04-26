package chau.controller;

import chau.consts.Consts;
import chau.dao.TourDAO;
import chau.dao.UserDAO;
import chau.dto.UserDTO;
import chau.utils.MyUtils;
import com.google.gson.Gson;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.Cookie;

public class SignUpAction extends ActionSupport {
    private static final String FAIL = "fail";
    private String email;
    private String displayName;
    private String password;
    private String address;
    private String phone;
    private String url;

    public String execute() throws Exception {
        UserDAO dao = new UserDAO();
        String id = dao.signUp(displayName, email, password, address, phone);
        if (id != null) {
            UserDTO dto = new UserDTO(id, email, displayName, Consts.ROLE_STATUS.USER.value);
            ActionContext.getContext().getSession().put("USER", dto);
            if (url == null) {
                url = ServletActionContext.getRequest().getContextPath();
            } else if (url.isEmpty()) {
                url = "/";
            }
            return Action.SUCCESS;
        } else {
            return FAIL;
        }
    }

    @Override
    public void validate() {
    }

    public String getUrl() {
        return url;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDisplayName() {
        return displayName;
    }

    public void setDisplayName(String displayName) {
        this.displayName = displayName;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public void setUrl(String url) {
        this.url = url;
    }
}
