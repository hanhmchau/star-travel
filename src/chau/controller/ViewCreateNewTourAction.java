package chau.controller;

import chau.dao.CategoryDAO;
import chau.dto.CategoryDTO;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;

import java.util.Set;

public class ViewCreateNewTourAction extends ActionSupport{

    Set<CategoryDTO> categories;

    public Set<CategoryDTO> getCategories() {
        return categories;
    }

    @Override
    public String execute() throws Exception {
        CategoryDAO dao = new CategoryDAO();
        categories = dao.getAllCategories();
        return Action.SUCCESS;
    }
}
