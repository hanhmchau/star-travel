package chau.controller;

import chau.dao.TourDAO;
import chau.dto.TourDTO;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;

import java.util.List;

public class GetToursByLocation extends ActionSupport {
    private String locationId;
    private int page;
    private int perPage;
    private List<TourDTO> tours;

    public void setLocationId(String locationId) {
        this.locationId = locationId;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public void setPerPage(int perPage) {
        this.perPage = perPage;
    }

    public List<TourDTO> getTours() {
        return tours;
    }

    @Override
    public String execute() throws Exception {
        TourDAO dao = new TourDAO();
        tours = dao.getToursByLocation(locationId, page, perPage);
        return tours != null ? Action.SUCCESS : Action.ERROR;
    }
}
