package chau.controller;

import chau.dao.TourDAO;
import chau.dao.UserDAO;
import chau.dto.Pagination;
import chau.dto.TourDTO;
import chau.dto.UserDTO;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import java.util.ArrayList;
import java.util.List;

public class GetAllUsersAction extends ActionSupport {
    private List<UserDTO> data = new ArrayList<>();
    private Pagination meta;

    public List<UserDTO> getData() {
        return data;
    }

    public Pagination getMeta() {
        return meta;
    }

    @Override
    public String execute() throws Exception {
        int page, perpage;
        try {
            page = Integer.parseInt(ServletActionContext.getRequest().getParameter("pagination[page]"));
            perpage = Integer.parseInt(ServletActionContext.getRequest().getParameter("pagination[perpage]"));
        } catch (NumberFormatException e) {
            page = 1;
            perpage = 10;
        }
        UserDAO dao = new UserDAO();
        data = dao.getAllUsers(page, perpage);
        meta = new Pagination();
        meta.setPage(page);
        meta.setPerpage(perpage);
        meta.setTotal(dao.getTotalUserCount());
        return Action.SUCCESS;
    }

}
