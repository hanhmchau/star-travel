package chau.controller;

import chau.dao.LocationDAO;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;

public class EditLocationAction extends ActionSupport {
    private String id;
    private String name;
    private String description;

    public void setId(String id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String execute() throws Exception {
        LocationDAO dao = new LocationDAO();
        if (!dao.locationExists(id)) {
            return Action.ERROR;
        }

        if (name != null) {
            dao.setLocationName(id, name);
        }

        if (description != null) {
            dao.setDescription(id, description);
        }

        return Action.SUCCESS;
    }
}
