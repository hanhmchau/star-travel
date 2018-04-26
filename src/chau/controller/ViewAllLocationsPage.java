package chau.controller;

import chau.dao.LocationDAO;
import chau.dto.LocationDTO;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;

import java.util.List;

public class ViewAllLocationsPage extends ActionSupport {

    List<LocationDTO> locations;

    public List<LocationDTO> getLocations() {
        return locations;
    }

    @Override
    public String execute() throws Exception {
        LocationDAO dao = new LocationDAO();
        locations = dao.getAllLocations();
        return locations != null ? Action.SUCCESS : Action.ERROR;
    }
}
