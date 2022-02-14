/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author Admin
 */
public class District {
    private int Id;
    private String Name;
    private String AreaReview;
    private String ImageUrl;

    public District() {
    }

    public District(int Id, String Name, String AreaReview, String ImageUrl) {
        this.Id = Id;
        this.Name = Name;
        this.AreaReview = AreaReview;
        this.ImageUrl = ImageUrl;
    }

    public int getId() {
        return Id;
    }

    public void setId(int Id) {
        this.Id = Id;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public String getAreaReview() {
        return AreaReview;
    }

    public void setAreaReview(String AreaReview) {
        this.AreaReview = AreaReview;
    }

    public String getImageUrl() {
        return ImageUrl;
    }

    public void setImageUrl(String ImageUrl) {
        this.ImageUrl = ImageUrl;
    }

    @Override
    public String toString() {
        return "District{" + "Id=" + Id + ", Name=" + Name + ", AreaReview=" + AreaReview + ", ImageUrl=" + ImageUrl + '}';
    }
}
