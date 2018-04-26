package chau.controller;

import chau.dao.CategoryDAO;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;

public class CreateNewCategoryAction extends ActionSupport {
    private String name;

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String execute() throws Exception {
        CategoryDAO dao = new CategoryDAO();
        return dao.createCategory(name) ? Action.SUCCESS : Action.ERROR;
    }
}
