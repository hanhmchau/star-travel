package chau.controller;

import chau.dao.LocationDAO;
import chau.dao.TourDAO;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;

public class RemoveImageFromLocationAction extends ActionSupport {

    private String id;

    public void setId(String id) {
        this.id = id;
    }

    @Override
    public String execute() throws Exception {
        LocationDAO dao = new LocationDAO();
        return dao.removeImageFromLocation(id) ? Action.SUCCESS : Action.ERROR;
    }

}
