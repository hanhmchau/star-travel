package chau.dto;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;

public class CartItem implements Serializable {
    private String id;
    private TourDateDTO tourDateDTO;
    private int adultSeat;
    private int childSeat;
    private double temporaryTotal;

    public CartItem(TourDateDTO tourDateDTO, int adultSeat, int childSeat) {
        this.tourDateDTO = tourDateDTO;
        this.adultSeat = adultSeat;
        this.childSeat = childSeat;
    }

    public CartItem(String id, int adultSeat, int childSeat) {
        this.id = id;
        this.adultSeat = adultSeat;
        this.childSeat = childSeat;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public TourDateDTO getTourDateDTO() {
        return tourDateDTO;
    }

    public void setTourDateDTO(TourDateDTO tourDateDTO) {
        this.tourDateDTO = tourDateDTO;
    }

    public int getAdultSeat() {
        return adultSeat;
    }

    public void setAdultSeat(int adultSeat) {
        this.adultSeat = adultSeat;
    }

    public int getChildSeat() {
        return childSeat;
    }

    public void setChildSeat(int childSeat) {
        this.childSeat = childSeat;
    }

    public double getTemporaryTotal() {
        return adultSeat * tourDateDTO.getTour().getAdultPrice() + childSeat * tourDateDTO.getTour().getChildPrice();
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        CartItem cartItem = (CartItem) o;

        return id != null ? id.equals(cartItem.id) : cartItem.id == null;
    }

    @Override
    public int hashCode() {
        return id != null ? id.hashCode() : 0;
    }
}
