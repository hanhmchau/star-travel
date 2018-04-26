package chau.controller;

import chau.dao.TourDAO;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;

public class RemoveTourLocationAction extends ActionSupport {
    private String tourId;
    private String locationId;

    public void setTourId(String tourId) {
        this.tourId = tourId;
    }

    public void setLocationId(String locationId) {
        this.locationId = locationId;
    }

    @Override
    public String execute() throws Exception {
        TourDAO dao = new TourDAO();
        return dao.removeTourLocationAction(tourId, locationId) ? Action.SUCCESS : Action.ERROR;
    }
}
