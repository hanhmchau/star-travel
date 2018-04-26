package chau.controller;

import chau.dao.UserDAO;
import chau.dto.UserDTO;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import java.util.Map;

public class UpdateUserSettingsAction extends ActionSupport {
    private String userId, address, phone, displayName;

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public void setDisplayName(String displayName) {
        this.displayName = displayName;
    }

    @Override
    public String execute() throws Exception {
        UserDAO dao = new UserDAO();
        UserDTO sessionUser = (UserDTO) ActionContext.getContext().getSession().get("USER");

        if (userId == null) {
            return Action.ERROR;
        }
        if (displayName != null) {
            dao.updateDisplayName(userId, displayName);
            if (userId.equals(String.valueOf(sessionUser.getId()))) {
                sessionUser.setDisplayName(displayName);
            }
        }
        if (address != null) {
            dao.updateAddress(userId, address);
        }
        if (phone != null) {
            dao.updatePhone(userId, phone);
        }
        return Action.SUCCESS;
    }
}
