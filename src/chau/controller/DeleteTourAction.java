package chau.controller;

import chau.dao.TourDAO;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;

public class DeleteTourAction extends ActionSupport {
    private String id;

    public void setId(String id) {
        this.id = id;
    }

    @Override
    public String execute() throws Exception {
        TourDAO dao = new TourDAO();
        return dao.removeTour(id) ? Action.SUCCESS : Action.ERROR;
    }
}
