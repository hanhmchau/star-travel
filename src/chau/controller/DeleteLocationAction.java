package chau.controller;

import chau.dao.CategoryDAO;
import chau.dao.LocationDAO;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;

public class DeleteLocationAction extends ActionSupport {
    private String id;

    public void setId(String id) {
        this.id = id;
    }

    @Override
    public String execute() throws Exception {
        LocationDAO dao = new LocationDAO();
        return dao.deleteLocation(id) ? Action.SUCCESS : Action.ERROR;
    }
}
