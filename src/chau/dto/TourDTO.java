package chau.dto;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class TourDTO implements Serializable {
    private String id;
    private String title;
    private String titleUrl;
    private String description;
    private int numberOfDays;
    private int numberOfNights;
    private double adultPrice;
    private double childPrice;
    private int creatorId;
    private Date dateCreated;
    private int status;
    private int seatTotal;
    private String highlights;
    private String whatYouCanExpect;
    private String inclusions;
    private Set<CategoryDTO> categories;
    private Map<String, Date> startDates;
    private Map<String, String> images;
    private List<ItineraryDTO> itinerary;
    private Set<LocationDTO> locations;
    private List<ReviewDTO> reviews;
    private double averageRating;
    private int totalBought;
    private double totalMoney;

    public TourDTO() {
    }

    public TourDTO(String id) {
        this.id = id;
    }

    public TourDTO(String id, String title, String titleUrl, String description, int numberOfDays, int numberOfNights,
                   double adultPrice, double childPrice, int creatorId,
                   Date dateCreated, int status, int seatTotal, String highlights, String whatYouCanExpect, String inclusions) {
        this.id = id;
        this.title = title;
        this.titleUrl = titleUrl;
        this.description = description;
        this.numberOfDays = numberOfDays;
        this.numberOfNights = numberOfNights;
        this.adultPrice = adultPrice;
        this.childPrice = childPrice;
        this.creatorId = creatorId;
        this.dateCreated = dateCreated;
        this.status = status;
        this.seatTotal = seatTotal;
        this.highlights = highlights;
        this.whatYouCanExpect = whatYouCanExpect;
        this.inclusions = inclusions;
    }

    public TourDTO(String id, String title, String titleUrl, int numberOfDays, int numberOfNights, double adultPrice, double childPrice) {
        this.id = id;
        this.title = title;
        this.titleUrl = titleUrl;
        this.numberOfDays = numberOfDays;
        this.numberOfNights = numberOfNights;
        this.adultPrice = adultPrice;
        this.childPrice = childPrice;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getTitleUrl() {
        return titleUrl;
    }

    public void setTitleUrl(String titleUrl) {
        this.titleUrl = titleUrl;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getNumberOfDays() {
        return numberOfDays;
    }

    public void setNumberOfDays(int numberOfDays) {
        this.numberOfDays = numberOfDays;
    }

    public int getNumberOfNights() {
        return numberOfNights;
    }

    public void setNumberOfNights(int numberOfNights) {
        this.numberOfNights = numberOfNights;
    }

    public double getAdultPrice() {
        return adultPrice;
    }

    public void setAdultPrice(double adultPrice) {
        this.adultPrice = adultPrice;
    }

    public double getChildPrice() {
        return childPrice;
    }

    public void setChildPrice(double childPrice) {
        this.childPrice = childPrice;
    }

    public int getCreatorId() {
        return creatorId;
    }

    public void setCreatorId(int creatorId) {
        this.creatorId = creatorId;
    }

    public Date getDateCreated() {
        return dateCreated;
    }

    public void setDateCreated(Date dateCreated) {
        this.dateCreated = dateCreated;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getSeatTotal() {
        return seatTotal;
    }

    public void setSeatTotal(int seatTotal) {
        this.seatTotal = seatTotal;
    }

    public String getHighlights() {
        return highlights;
    }

    public void setHighlights(String highlights) {
        this.highlights = highlights;
    }

    public String getWhatYouCanExpect() {
        return whatYouCanExpect;
    }

    public void setWhatYouCanExpect(String whatYouCanExpect) {
        this.whatYouCanExpect = whatYouCanExpect;
    }

    public String getInclusions() {
        return inclusions;
    }

    public void setInclusions(String inclusions) {
        this.inclusions = inclusions;
    }

    public Set<CategoryDTO> getCategories() {
        return categories;
    }

    public void setCategories(Set<CategoryDTO> categories) {
        this.categories = categories;
    }

    public Map<String, Date> getStartDates() {
        return startDates;
    }

    public void setStartDates(Map<String, Date> startDates) {
        this.startDates = startDates;
    }

    public Map<String, String> getImages() {
        return images;
    }

    public void setImages(Map<String, String> images) {
        this.images = images;
    }

    public List<ItineraryDTO> getItinerary() {
        return itinerary;
    }

    public void setItinerary(List<ItineraryDTO> itinerary) {
        this.itinerary = itinerary;
    }

    public Set<LocationDTO> getLocations() {
        return locations;
    }

    public void setLocations(Set<LocationDTO> locations) {
        this.locations = locations;
    }

    public int getHours() {
        return (numberOfDays + numberOfNights) * 12;
    }

    public List<ReviewDTO> getReviews() {
        return reviews;
    }

    public void setReviews(List<ReviewDTO> reviews) {
        this.reviews = reviews;
    }

    public void setAverageRating(double averageRating) {
        this.averageRating = averageRating;
    }

    public double getAverageRating() {
        if (averageRating > 0) {
            return averageRating;
        }
        return reviews != null ? reviews.stream().mapToDouble(review -> review.getRating()).average().orElse(0) : 0;
    }

    public void setTotalBought(int totalBought) {
        this.totalBought = totalBought;
    }

    public int getTotalBought() {
        return totalBought;
    }

    public void setTotalMoney(double totalMoney) {
        this.totalMoney = totalMoney;
    }

    public double getTotalMoney() {
        return totalMoney;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        TourDTO tourDTO = (TourDTO) o;

        return id != null ? id.equals(tourDTO.id) : tourDTO.id == null;
    }

    @Override
    public int hashCode() {
        return id != null ? id.hashCode() : 0;
    }
}
