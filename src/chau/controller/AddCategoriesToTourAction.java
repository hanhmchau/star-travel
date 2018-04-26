package chau.controller;

import chau.dao.TourDAO;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;

public class AddCategoriesToTourAction extends ActionSupport {
    private String tourId;
    private int categoryId;

    public void setTourId(String tourId) {
        this.tourId = tourId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    @Override
    public String execute() throws Exception {
        TourDAO dao = new TourDAO();
        return dao.addCategoryToTour(tourId, categoryId) ? Action.SUCCESS : Action.ERROR;
    }
}
