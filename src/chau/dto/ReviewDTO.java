package chau.dto;

import java.io.Serializable;

public class ReviewDTO implements Serializable {
    private String id;
    private UserDTO user;
    private String tourId;
    private int rating;
    private String comment;

    public ReviewDTO() {
    }

    public ReviewDTO(String id, UserDTO user, String tourId, int rating, String comment) {
        this.id = id;
        this.user = user;
        this.tourId = tourId;
        this.rating = rating;
        this.comment = comment;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public UserDTO getUser() {
        return user;
    }

    public void setUser(UserDTO user) {
        this.user = user;
    }

    public String getTourId() {
        return tourId;
    }

    public void setTourId(String tourId) {
        this.tourId = tourId;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }
}
