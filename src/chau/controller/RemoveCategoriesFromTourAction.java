package chau.controller;

import chau.dao.TourDAO;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;

public class RemoveCategoriesFromTourAction extends ActionSupport {
    String tourId;
    int categoryId;

    public void setTourId(String tourId) {
        this.tourId = tourId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    @Override
    public String execute() throws Exception {
        TourDAO dao = new TourDAO();
        return dao.removeCategoryFromTour(tourId, categoryId) ? Action.SUCCESS : Action.ERROR;
    }
}
