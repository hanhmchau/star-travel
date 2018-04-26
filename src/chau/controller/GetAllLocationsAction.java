package chau.controller;

import chau.dao.LocationDAO;
import chau.dto.LocationDTO;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;

import java.util.List;

public class GetAllLocationsAction extends ActionSupport {

    List<LocationDTO> data;

    public List<LocationDTO> getData() {
        return data;
    }

    @Override
    public String execute() throws Exception {
        LocationDAO dao = new LocationDAO();
        data = dao.getAllLocations();
        return Action.SUCCESS;
    }
}
