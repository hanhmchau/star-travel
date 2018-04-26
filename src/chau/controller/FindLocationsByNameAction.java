package chau.controller;

import chau.dao.LocationDAO;
import chau.dto.LocationDTO;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;

import java.util.List;

public class FindLocationsByNameAction extends ActionSupport {
    private String search;
    private List<LocationDTO> results;

    public void setSearch(String search) {
        this.search = search;
    }

    public List<LocationDTO> getResults() {
        return results;
    }

    @Override
    public String execute() throws Exception {
        LocationDAO dao = new LocationDAO();
        results = dao.getLocationsByName(search);
        return Action.SUCCESS;
    }
}
