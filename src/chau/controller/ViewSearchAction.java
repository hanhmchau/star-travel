package chau.controller;

import chau.dao.CategoryDAO;
import chau.dao.TourDAO;
import chau.dto.CategoryDTO;
import chau.dto.TourDTO;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;

import java.util.List;
import java.util.Set;

public class ViewSearchAction extends ActionSupport {

    private List<TourDTO> tours;
    private Set<CategoryDTO> categories;
    private int total;
    private int pages;

    public Set<CategoryDTO> getCategories() {
        return categories;
    }

    public List<TourDTO> getTours() {
        return tours;
    }

    public int getTotal() {
        return total;
    }

    public int getPages() {
        return pages;
    }

    @Override
    public String execute() throws Exception {
        CategoryDAO dao = new CategoryDAO();
        TourDAO tourDAO = new TourDAO();
        categories = dao.getAllCategories();
        tours = tourDAO.getAllTours(1, 9);
        total = tourDAO.getTotalTourCount();
        pages = (int) (Math.ceil((double) total / 9));
        return Action.SUCCESS;
    }
}
