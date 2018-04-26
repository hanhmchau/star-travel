package chau.controller;

import chau.dao.TourDAO;
import chau.dto.CategoryDTO;
import chau.dto.ItineraryDTO;
import chau.dto.UserDTO;
import chau.utils.MyUtils;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import java.util.Date;
import java.util.List;
import java.util.Set;

public class CreateNewTour extends ActionSupport {
    private String title;
    private String description;
    private int numberOfDays;
    private int numberOfNights;
    private double adultPrice;
    private double childPrice;
    private int seatTotal;
    private String highlights;
    private String whatYouCanExpect;
    private String inclusions;
    private Set<Integer> categories;
    private Set<Date> startDates;
    private Set<String> locations;
    private List<ItineraryDTO> itinerary;
    private String id;
    private String titleUrl;

    public String getId() {
        return id;
    }

    public String getTitleUrl() {
        return titleUrl;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setNumberOfDays(int numberOfDays) {
        this.numberOfDays = numberOfDays;
    }

    public void setNumberOfNights(int numberOfNights) {
        this.numberOfNights = numberOfNights;
    }

    public void setAdultPrice(double adultPrice) {
        this.adultPrice = adultPrice;
    }

    public void setChildPrice(double childPrice) {
        this.childPrice = childPrice;
    }

    public void setSeatTotal(int seatTotal) {
        this.seatTotal = seatTotal;
    }

    public void setHighlights(String highlights) {
        this.highlights = highlights;
    }

    public void setWhatYouCanExpect(String whatYouCanExpect) {
        this.whatYouCanExpect = whatYouCanExpect;
    }

    public void setInclusions(String inclusions) {
        this.inclusions = inclusions;
    }

    public void setCategories(Set<Integer> categories) {
        this.categories = categories;
    }

    public void setStartDates(Set<Date> startDates) {
        this.startDates = startDates;
    }

    public void setLocations(Set<String> locations) {
        this.locations = locations;
    }

    public void setItinerary(List<ItineraryDTO> itinerary) {
        this.itinerary = itinerary;
    }

    @Override
    public String execute() throws Exception {
        TourDAO dao = new TourDAO();
        titleUrl = MyUtils.createTitleUrl(title, 1);
        String creatorId = ((UserDTO) ActionContext.getContext().getSession().get("USER")).getId();
        id = dao.insertNewTour(title, titleUrl, description, numberOfDays, numberOfNights, adultPrice, childPrice, creatorId, seatTotal, highlights,
                whatYouCanExpect, inclusions, categories, locations, startDates, itinerary);
        return ActionSupport.SUCCESS;
    }

    @Override
    public void validate() {
        super.validate();
    }
}