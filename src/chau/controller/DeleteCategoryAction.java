package chau.controller;

import chau.dao.CategoryDAO;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;

public class DeleteCategoryAction extends ActionSupport {
    private int id;

    public void setId(int id) {
        this.id = id;
    }

    @Override
    public String execute() throws Exception {
        CategoryDAO dao = new CategoryDAO();
        return dao.removeCategory(id) ? Action.SUCCESS : Action.ERROR;
    }
}
