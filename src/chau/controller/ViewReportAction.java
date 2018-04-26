package chau.controller;

import chau.consts.Consts;
import chau.dao.LocationDAO;
import chau.dao.TourDAO;
import chau.dao.UserDAO;
import chau.dto.LocationDTO;
import chau.dto.TourDTO;
import chau.dto.UserDTO;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;

import java.util.List;

public class ViewReportAction extends ActionSupport {

    private List<TourDTO> mostBoughtTours;
    private List<TourDTO> mostProfitTours;
    private List<LocationDTO> mostProfitLocations;
    private List<UserDTO> mostBoughtUsers;

    public List<TourDTO> getMostBoughtTours() {
        return mostBoughtTours;
    }

    public List<TourDTO> getMostProfitTours() {
        return mostProfitTours;
    }

    public List<LocationDTO> getMostProfitLocations() {
        return mostProfitLocations;
    }

    public List<UserDTO> getMostBoughtUsers() {
        return mostBoughtUsers;
    }

    @Override
    public String execute() throws Exception {
        TourDAO tourDAO = new TourDAO();
        LocationDAO locationDAO = new LocationDAO();
        UserDAO userDAO = new UserDAO();
        mostBoughtTours = tourDAO.getMostBoughtTours(Consts.TOP_REPORT_SIZE);
        mostProfitTours = tourDAO.getHighestProfitTours(Consts.TOP_REPORT_SIZE);
        mostProfitLocations = locationDAO.getHighestProfitLocations(Consts.TOP_REPORT_SIZE);
        mostBoughtUsers = userDAO.getUsersHighestProfit(Consts.TOP_REPORT_SIZE);
        return Action.SUCCESS;
    }
}
