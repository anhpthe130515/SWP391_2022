/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author AnhPT
 */
public class District {
    private int id;
    private String name;
    private String areaReview;
    private String img;

    public District() {
    }

    public District(int id, String name, String areaReview, String img) {
        this.id = id;
        this.name = name;
        this.areaReview = areaReview;
        this.img = img;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAreaReview() {
        return areaReview;
    }

    public void setAreaReview(String areaReview) {
        this.areaReview = areaReview;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }
    
    
}
