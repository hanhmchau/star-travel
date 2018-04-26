package chau.controller;

import chau.dao.TourDAO;
import chau.dto.CategoryDTO;
import chau.dto.TourDTO;
import chau.utils.MyUtils;
import com.opensymphony.xwork2.ActionSupport;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class SearchTourAction extends ActionSupport {

    private String phrase;
    private Date fromDate, toDate;
    private double minPrice, maxPrice;
    private List<Integer> categories;
    private int sort;
    private int page;
    private int perPage;
    private List<TourDTO> tours;
    private int total;

    public List<TourDTO> getTours() {
        return tours;
    }

    public void setPhrase(String phrase) {
        this.phrase = phrase;
    }

    public void setFromDate(Date fromDate) {
        this.fromDate = fromDate;
    }

    public void setToDate(Date toDate) {
        this.toDate = toDate;
    }

    public void setMinPrice(double minPrice) {
        this.minPrice = minPrice;
    }

    public void setMaxPrice(double maxPrice) {
        this.maxPrice = maxPrice;
    }

    public void setCategories(List<Integer> categories) {
        this.categories = categories;
    }

    public void setSort(int sort) {
        this.sort = sort;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public void setPerPage(int perPage) {
        this.perPage = perPage;
    }

    public int getTotal() {
        return total;
    }

    @Override
    public String execute() throws Exception {
        TourDAO dao = new TourDAO();
        if (phrase == null) phrase = "";
        if (fromDate == null) fromDate = MyUtils.getDate(LocalDate.now().plusDays(1));
        if (toDate == null) toDate = MyUtils.getDate(31, 12, LocalDate.now().getYear() + 5);
        if (categories == null) {
            categories = new ArrayList<>();
        }
        tours = dao.getToursByConditions(phrase, fromDate, toDate, minPrice, maxPrice, categories, sort, page, perPage);
        total = dao.countToursByConditions(phrase, fromDate, toDate, minPrice, maxPrice, categories);
        return super.execute();
    }
}
