package chau.dto;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class Cart implements Serializable {
    private List<CartItem> contents;
    private double total;

    public Cart(List<CartItem> contents) {
        this.contents = contents;
    }

    public Cart() {
        contents = new ArrayList<>();
    }

    public List<CartItem> getContents() {
        return contents;
    }

    public void setContents(List<CartItem> contents) {
        this.contents = contents;
    }

    public void addItem(CartItem item) {
        if (contents.contains(item)) {
            CartItem current = contents.get(contents.indexOf(item));
            current.setAdultSeat(current.getAdultSeat() + item.getAdultSeat());
            current.setChildSeat(current.getChildSeat() + item.getChildSeat());
        } else {
            contents.add(item);
        }
    }

    public boolean removeItem(String id) {
        return contents.removeIf(cartItem -> cartItem.getId().equals(id));
    }

    public void removeItem(CartItem item) {
        removeItem(item.getId());
    }

    public double getTotal() {
        return contents.stream().map(item -> item.getTemporaryTotal()).reduce((a, b) -> a+b).get();
    }
}
