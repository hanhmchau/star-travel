package chau.controller;

import chau.dao.UserDAO;
import chau.dto.UserDTO;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;

public class ViewSettingsPageAction extends ActionSupport {

    private String userId;
    private UserDTO user;

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public UserDTO getUser() {
        return user;
    }

    @Override
    public String execute() throws Exception {
        UserDAO dao = new UserDAO();
        user = (new UserDAO()).findUserById(userId);
        return user != null ? Action.SUCCESS : Action.NONE;
    }
}
