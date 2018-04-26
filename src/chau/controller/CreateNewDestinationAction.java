package chau.controller;

import chau.dao.LocationDAO;
import chau.utils.MyUtils;
import com.opensymphony.xwork2.ActionSupport;

public class CreateNewDestinationAction extends ActionSupport {

    private String name;
    private String description;
    private String id;
    private String titleUrl;

    public void setName(String name) {
        this.name = name;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getId() {
        return id;
    }

    public String getTitleUrl() {
        return titleUrl;
    }

    @Override
    public String execute() throws Exception {
        LocationDAO locationDAO = new LocationDAO();
        titleUrl = MyUtils.createLocationTitleUrl(name, 0);
        id = locationDAO.createNewLocation(name, titleUrl, description);
        return super.execute();
    }
}
