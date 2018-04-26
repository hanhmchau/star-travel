package chau.dto;

import java.io.Serializable;
import java.util.List;

public class OrderItemDTO implements Serializable {
    private String id;
    private TourDateDTO tourDateDTO;
    private int adultSeat;
    private int childSeat;
    private double price;
    private boolean cancellable;
    private List<RefundDTO> refunds;

    public OrderItemDTO() {
    }

    public OrderItemDTO(String id, TourDateDTO tourDateDTO, int adultSeat, int childSeat, double price) {
        this.id = id;
        this.tourDateDTO = tourDateDTO;
        this.adultSeat = adultSeat;
        this.childSeat = childSeat;
        this.price = price;
    }

    public OrderItemDTO(String id, int adultSeat, int childSeat, double price) {
        this.id = id;
        this.adultSeat = adultSeat;
        this.childSeat = childSeat;
        this.price = price;
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

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public void setCancellable(boolean cancellable) {
        this.cancellable = cancellable;
    }

    public boolean isCancellable() {
        return cancellable;
    }

    public List<RefundDTO> getRefunds() {
        return refunds;
    }

    public void setRefunds(List<RefundDTO> refunds) {
        this.refunds = refunds;
    }
}
