package chau.controller;

import chau.dao.LocationDAO;
import chau.dao.TourDAO;
import chau.dto.LocationDTO;
import chau.dto.TourDTO;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;

import java.util.Date;
import java.util.List;

public class ViewLocationPage extends ActionSupport {

    private String titleUrl;
    private LocationDTO location;
    private List<TourDTO> tours;
    private int total;
    private int pages;
    private Date today;

    public void setTitleUrl(String titleUrl) {
        this.titleUrl = titleUrl;
    }

    public LocationDTO getLocation() {
        return location;
    }

    public List<TourDTO> getTours() {
        return tours;
    }

    public Date getToday() {
        return new Date();
    }

    public int getTotal() {
        return total;
    }

    public int getPages() {
        return pages;
    }

    @Override
    public String execute() throws Exception {
        LocationDAO dao = new LocationDAO();
        location = dao.getLocationByTitleUrl(titleUrl);
        if (location != null) {
            TourDAO tourDAO = new TourDAO();
            tours = tourDAO.getToursByLocation(location.getId(), 1, 9);
            total = tourDAO.countToursByLocation(location.getId());
            pages = (int) Math.ceil((double) total / 9);
        }
        return location != null ? Action.SUCCESS : Action.NONE;
    }
}
