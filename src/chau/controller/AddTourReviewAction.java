package chau.controller;

import chau.dao.TourDAO;
import chau.dto.UserDTO;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import java.util.Map;

public class AddTourReviewAction extends ActionSupport {
    private String tourId;
    private int rating;
    private String comment;
    private String commentId;

    public void setTourId(String tourId) {
        this.tourId = tourId;
    }

    public String getCommentId() {
        return commentId;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    @Override
    public String execute() throws Exception {
        TourDAO dao = new TourDAO();
        Map<String, Object> session = ActionContext.getContext().getSession();
        String userId = ((UserDTO) session.get("USER")).getId();
        commentId = dao.addNewReview(tourId, userId, rating, comment);
        return commentId != null ? Action.SUCCESS : Action.ERROR;
    }
}
