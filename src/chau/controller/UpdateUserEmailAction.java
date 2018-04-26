package chau.controller;

import chau.dao.UserDAO;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;

public class UpdateUserEmailAction extends ActionSupport {
    private String newEmail, confirmPassword, userId;

    public void setNewEmail(String newEmail) {
        this.newEmail = newEmail;
    }

    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    @Override
    public String execute() throws Exception {
        UserDAO dao = new UserDAO();
        return dao.updateEmail(userId, confirmPassword, newEmail) ? Action.SUCCESS : Action.ERROR;

    }
}
