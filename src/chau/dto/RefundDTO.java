package chau.dto;

import java.io.Serializable;
import java.util.Date;

public class RefundDTO implements Serializable {
    private String id;
    private int adultSeat;
    private int childSeat;
    private double refundRate;
    private Date dateCancelled;

    public RefundDTO() {
    }

    public RefundDTO(String id, int adultSeat, int childSeat, double refundRate, Date dateCancelled) {
        this.id = id;
        this.adultSeat = adultSeat;
        this.childSeat = childSeat;
        this.refundRate = refundRate;
        this.dateCancelled = dateCancelled;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
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

    public double getRefundRate() {
        return refundRate;
    }

    public void setRefundRate(double refundRate) {
        this.refundRate = refundRate;
    }

    public Date getDateCancelled() {
        return dateCancelled;
    }

    public void setDateCancelled(Date dateCancelled) {
        this.dateCancelled = dateCancelled;
    }
}
