package chau.controller;

import chau.dao.TourDAO;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;

public class EditTourReviewAction extends ActionSupport {
    private String id;
    private int rating;
    private String comment;
    private String tourId;
    private double average;

    public void setId(String id) {
        this.id = id;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public void setComment(String comment) {
        this.comment = comment;
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
        boolean result = dao.editReview(id, rating, comment);
        average = dao.getTourAverage(tourId);
        return result ? Action.SUCCESS : Action.ERROR;
    }
}
