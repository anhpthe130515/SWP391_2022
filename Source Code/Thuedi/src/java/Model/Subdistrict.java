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
public class Subdistrict {
    private int Id;
    private String Name;
    private int DistrictId;
    private String AreaReview;

    public Subdistrict() {
    }

    public Subdistrict(int Id, String Name, int DistrictId, String AreaReview) {
        this.Id = Id;
        this.Name = Name;
        this.DistrictId = DistrictId;
        this.AreaReview = AreaReview;
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

    public int getDistrictId() {
        return DistrictId;
    }

    public void setDistrictId(int DistrictId) {
        this.DistrictId = DistrictId;
    }

    public String getAreaReview() {
        return AreaReview;
    }

    public void setAreaReview(String AreaReview) {
        this.AreaReview = AreaReview;
    }

    @Override
    public String toString() {
        return "Subdistrict{" + "Id=" + Id + ", Name=" + Name + ", DistrictId=" + DistrictId + ", AreaReview=" + AreaReview + '}';
    }
}
