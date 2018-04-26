package chau.controller;

import chau.dao.TourDAO;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;

public class EditTourItineraryAction extends ActionSupport {

    private String id;
    private String tourId;
    private String title;
    private String content;

    public void setId(String id) {
        this.id = id;
    }

    public void setTourId(String tourId) {
        this.tourId = tourId;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Override
    public String execute() throws Exception {
        TourDAO dao = new TourDAO();
        boolean result = false;
        if (id != null && !id.isEmpty()) {
            result = dao.editTourItineraryItem(id, title, content);
        } else {
            result = dao.addTourItineraryItem(tourId, title, content);
        }
        return result ? Action.SUCCESS : Action.ERROR;
    }
}
