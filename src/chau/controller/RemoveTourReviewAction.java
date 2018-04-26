package chau.controller;

import chau.dao.TourDAO;
import com.opensymphony.xwork2.ActionSupport;

public class RemoveTourReviewAction extends ActionSupport {
    private String id;
    private String tourId;
    private double average;

    public void setId(String id) {
        this.id = id;
    }

    public void setTourId(String tourId) {
        this.tourId = tourId;
    }

    public double getAverage() {
        return average;
    }

    @Override
    public String execute() throws Exception {
        TourDAO dao = new TourDAO();
        boolean result = dao.removeReview(id);
        average = dao.getTourAverage(tourId);
        return super.execute();
    }
}
