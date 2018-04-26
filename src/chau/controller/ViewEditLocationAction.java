package chau.controller;

import chau.dao.LocationDAO;
import chau.dto.LocationDTO;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;

public class ViewEditLocationAction extends ActionSupport {
    private String titleUrl;
    private LocationDTO locationDTO;

    public void setTitleUrl(String titleUrl) {
        this.titleUrl = titleUrl;
    }

    public LocationDTO getLocationDTO() {
        return locationDTO;
    }

    @Override
    public String execute() throws Exception {
        LocationDAO dao = new LocationDAO();
        locationDTO = dao.getLocationByTitleUrl(titleUrl);
        return locationDTO != null ? Action.SUCCESS : Action.NONE;
    }
}
