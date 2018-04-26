package chau.controller;

import chau.dao.TourDAO;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;
import freemarker.template.SimpleDate;

import java.text.SimpleDateFormat;
import java.util.Date;

public class AddDateToTourAction extends ActionSupport {
    private String tourId;
    private Date date;
    private String formattedDate;

    public void setTourId(String tourId) {
        this.tourId = tourId;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getFormattedDate() {
        return formattedDate;
    }

    @Override
    public String execute() throws Exception {
        TourDAO dao = new TourDAO();
        formattedDate = new SimpleDateFormat("dd- MM- yyyy").format(date);
        return dao.addStartDatesToTour(tourId, date) ? Action.SUCCESS : Action.ERROR;
    }
}
