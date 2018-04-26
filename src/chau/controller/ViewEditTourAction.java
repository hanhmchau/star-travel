package chau.controller;

import chau.dao.CategoryDAO;
import chau.dao.TourDAO;
import chau.dto.CategoryDTO;
import chau.dto.TourDTO;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;

import java.util.Date;
import java.util.Set;
import java.util.stream.Collectors;

public class ViewEditTourAction extends ActionSupport{

    private String titleUrl;
    private TourDTO tourDTO;
    private Set<Integer> categoryIds;
    private Set<CategoryDTO> categories;
    private Date today;

    public void setTitleUrl(String titleUrl) {
        this.titleUrl = titleUrl;
    }

    public TourDTO getTourDTO() {
        return tourDTO;
    }

    public Set<Integer> getCategoryIds() {
        return categoryIds;
    }

    public Set<CategoryDTO> getCategories() {
        return categories;
    }

    public Date getToday() {
        return new Date();
    }

    @Override
    public String execute() throws Exception {
        TourDAO dao = new TourDAO();
        categories = (new CategoryDAO()).getAllCategories();
        tourDTO = dao.getTourByTitleUrl(titleUrl);
        if (tourDTO != null) {
            categoryIds = (tourDTO.getCategories().stream().map(categoryDTO -> categoryDTO.getId()).collect(Collectors.toSet()));
            return Action.SUCCESS;
        } else {
            return Action.NONE;
        }
    }
}
