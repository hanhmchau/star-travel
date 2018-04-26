package chau.controller;

import chau.dao.UserDAO;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;

public class UpdateUserPasswordAction extends ActionSupport {

    private String userId;
    private String oldPassword;
    private String newPassword;

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public void setOldPassword(String oldPassword) {
        this.oldPassword = oldPassword;
    }

    public void setNewPassword(String newPassword) {
        this.newPassword = newPassword;
    }

    @Override
    public String execute() throws Exception {
        UserDAO dao = new UserDAO();
        return dao.updatePassword(userId, oldPassword, newPassword) ? Action.SUCCESS : Action.ERROR;
    }
}
