package chau.controller;

import chau.dao.TourDAO;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;

import java.util.Date;

public class GetSeatCountAction extends ActionSupport {
    private int seatCount;
    private String tourDateId;

    public int getSeatCount() {
        return seatCount;
    }

    public void setTourDateId(String tourDateId) {
        this.tourDateId = tourDateId;
    }

    @Override
    public String execute() throws Exception {
        TourDAO dao = new TourDAO();
        seatCount = dao.getTotalSeatCountLeft(tourDateId);
        return Action.SUCCESS;
    }
}
