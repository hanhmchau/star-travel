package chau.dto;

import java.io.Serializable;

public class CategoryDTO implements Serializable {
    private int id;
    private String name;
    private int status;

    public CategoryDTO() {
    }

    public CategoryDTO(int id, String name) {
        this.id = id;
        this.name = name;
    }

    public CategoryDTO(int id, String name, int status) {
        this.id = id;
        this.name = name;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
