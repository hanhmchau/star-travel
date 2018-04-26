package chau.dto;

import java.io.Serializable;

public class Pagination implements Serializable {
    private int page;
    private int pages;
    private int perpage;
    private int total;
    private String sort;
    private String field;

    public int getPage() {
        return page;
    }

    public int getPages() {
        return pages;
    }

    public int getPerpage() {
        return perpage;
    }

    public int getTotal() {
        return total;
    }

    public String getSort() {
        return sort;
    }

    public String getField() {
        return field;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public void setPages(int pages) {
        this.pages = pages;
    }

    public void setPerpage(int perpage) {
        this.perpage = perpage;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public void setSort(String sort) {
        this.sort = sort;
    }

    public void setField(String field) {
        this.field = field;
    }
}
