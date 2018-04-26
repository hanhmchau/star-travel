package chau.controller;

import chau.dao.TourDAO;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;

public class RemoveDateFromTourAction extends ActionSupport {
    private String tourDateId;

    public void setTourDateId(String tourDateId) {
        this.tourDateId = tourDateId;
    }

    @Override
    public String execute() throws Exception {
        TourDAO dao = new TourDAO();
        if (dao.getTourDateOrderItemCount(tourDateId) > 0) {
            return Action.ERROR;
        }
        if (dao.removeStartDatesFromTour(tourDateId)) {
            return Action.SUCCESS;
        } else {
            return Action.ERROR;
        }
    }
}
