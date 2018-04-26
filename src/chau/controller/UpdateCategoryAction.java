package chau.controller;

import chau.dao.CategoryDAO;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;

public class UpdateCategoryAction extends ActionSupport {
    private int id;
    private String name;

    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String execute() throws Exception {
        CategoryDAO dao = new CategoryDAO();
        return dao.updateCategory(id, name) ? Action.SUCCESS : Action.ERROR;
    }
}
