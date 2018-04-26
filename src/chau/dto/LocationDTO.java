package chau.dto;

import java.io.Serializable;
import java.util.Map;

public class LocationDTO implements Serializable {
    private String id;
    private String name;
    private String url;
//    private LocationDTO parent;
    private String description;
    private Map<String, String> images;
    private int count;
    private double total;

    public LocationDTO() {
    }

    public LocationDTO(String id, String name) {
        this.id = id;
        this.name = name;
    }

    public LocationDTO(String id, String name, String description) {
        this.id = id;
        this.name = name;
        this.description = description;
    }

    public LocationDTO(String id, String name, String description, String url) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.url = url;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setImages(Map<String, String> images) {
        this.images = images;
    }

    public Map<String, String> getImages() {
        return images;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public int getCount() {
        return count;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }
}
