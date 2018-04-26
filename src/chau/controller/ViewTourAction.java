package chau.controller;

import chau.dao.TourDAO;
import chau.dto.TourDTO;
import chau.dto.UserDTO;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import javax.jms.Session;
import java.util.Date;
import java.util.Map;

public class ViewTourAction extends ActionSupport {
    private String titleUrl;
    private TourDTO tourDTO;
    private Date today;
    private boolean userCanComment;

    public void setTitleUrl(String titleUrl) {
        this.titleUrl = titleUrl;
    }

    public TourDTO getTourDTO() {
        return tourDTO;
    }

    public Date getToday() {
        return new Date();
    }

    public boolean isUserCanComment() {
        return userCanComment;
    }

    @Override
    public String execute() throws Exception {
        Map<String, Object> session = ActionContext.getContext().getSession();
        UserDTO user = (UserDTO) session.get("USER");
        TourDAO dao = new TourDAO();
        tourDTO = dao.getTourByTitleUrl(titleUrl);
        if (user != null) {
            String userId = user.getId();
            userCanComment = dao.canUserCommentOnTour(userId, tourDTO.getId());
        }
        return tourDTO != null ? Action.SUCCESS : Action.NONE;
    }
}
