package chau.dto;

import java.io.Serializable;

public class ItineraryDTO implements Serializable {
    String id;
    String tourId;
    String title;
    String content;
    int order;

    public ItineraryDTO() {
    }

    public ItineraryDTO(String id, String title, String content, int order) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.order = order;
    }

    public ItineraryDTO(String id, String tourId, String title, String content, int order) {
        this.id = id;
        this.tourId = tourId;
        this.title = title;
        this.content = content;
        this.order = order;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTourId() {
        return tourId;
    }

    public void setTourId(String tourId) {
        this.tourId = tourId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getOrder() {
        return order;
    }

    public void setOrder(int order) {
        this.order = order;
    }
}
