package chau.controller;

import chau.dao.UserDAO;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;

public class SetUserStatusAction extends ActionSupport {
    private String id;
    private int status;

    public void setId(String id) {
        this.id = id;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String execute() throws Exception {
        UserDAO dao = new UserDAO();
        return dao.setUserStatus(id, status != 1) ? Action.SUCCESS : Action.ERROR;
    }
}
