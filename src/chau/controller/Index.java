package chau.controller;

import chau.dao.LocationDAO;
import chau.dao.TourDAO;
import chau.dto.LocationDTO;
import chau.dto.TourDTO;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;

import java.util.List;

public class Index extends ActionSupport {

    private List<TourDTO> tours;

    public List<TourDTO> getTours() {
        return tours;
    }

    private List<LocationDTO> locations;

    public List<LocationDTO> getLocations() {
        return locations;
    }

    @Override
    public String execute() throws Exception {
        TourDAO dao = new TourDAO();
        tours = dao.getAllTours(1, 3);
        locations = (new LocationDAO()).getLocations(1, 9);
        return Action.SUCCESS;
    }
}
