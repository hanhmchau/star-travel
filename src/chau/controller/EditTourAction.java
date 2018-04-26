package chau.controller;

import chau.dao.TourDAO;
import chau.dto.ItineraryDTO;
import chau.dto.TourDTO;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;

import java.util.Date;
import java.util.List;
import java.util.Set;

public class EditTourAction extends ActionSupport {

    private String title;
    private String description;
    private int numberOfDays = -1;
    private int numberOfNights = -1;
    private double adultPrice = -1;
    private double childPrice = -1;
    private int seatTotal = -1;
    private String highlights;
    private String whatYouCanExpect;
    private String inclusions;
    private Set<Integer> categories;
    private Set<Date> startDates;
    private Set<Integer> locations;
    private List<ItineraryDTO> itinerary;
    private String id;
    private String titleUrl;

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

    public void setLocations(Set<Integer> locations) {
        this.locations = locations;
    }

    public void setItinerary(List<ItineraryDTO> itinerary) {
        this.itinerary = itinerary;
    }

    public void setId(String id) {
        this.id = id;
    }

    @Override
    public String execute() throws Exception {
        TourDAO dao = new TourDAO();
        if (!dao.tourExists(id)) {
            return Action.ERROR;
        }
        if (title != null) {
            dao.setTourTitle(id, title);
        }
        if (description != null) {
            dao.setDescription(id, description);
        }
        if (numberOfDays > 0) {
            dao.setNumberOfDays(id, numberOfDays);
        }
        if (numberOfNights > 0) {
            dao.setNumberOfNights(id, numberOfNights);
        }
        if (adultPrice > 0) {
            dao.setAdultPrice(id, adultPrice);
        }
        if (childPrice > 0) {
            dao.setChildPrice(id, childPrice);
        }
        if (seatTotal > 0) {
            dao.setSeatTotal(id, seatTotal);
        }
        if (highlights != null) {
            dao.setHighlights(id, highlights);
        }
        if (whatYouCanExpect != null) {
            dao.setWhatYouCanExpect(id, whatYouCanExpect);
        }
        if (inclusions != null) {
            dao.setInclusions(id, inclusions);
        }
        return Action.SUCCESS;
    }
}
