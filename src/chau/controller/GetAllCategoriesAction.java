package chau.controller;

import chau.dao.CategoryDAO;
import chau.dto.CategoryDTO;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;

import java.util.Set;

public class GetAllCategoriesAction extends ActionSupport {
    Set<CategoryDTO> data;

    public Set<CategoryDTO> getData() {
        return data;
    }

    @Override
    public String execute() throws Exception {
        CategoryDAO dao = new CategoryDAO();
        data = dao.getAllCategories();
        return Action.SUCCESS;
    }
}
