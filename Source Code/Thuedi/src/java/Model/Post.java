/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.Date;

/**
 *
 * @author Admin
 */
public class Post {
    private int Id;
    private int UserId;
    private Date CreateDate;
    private String Title;
    private String Detail;
    private int Price;
    private float Area;
    private int NumberOfBedrooms;
    private int NumberOfRestrooms;
    private String Direction;
    private int Address;
    private String AddressDetail;
    private int PropertyType;

    public Post() {
    }

    public Post(int Id, int UserId, Date CreateDate, String Title, String Detail, int Price, float Area, int NumberOfBedrooms, int NumberOfRestrooms, String Direction, int Address, String AddressDetail, int PropertyType) {
        this.Id = Id;
        this.UserId = UserId;
        this.CreateDate = CreateDate;
        this.Title = Title;
        this.Detail = Detail;
        this.Price = Price;
        this.Area = Area;
        this.NumberOfBedrooms = NumberOfBedrooms;
        this.NumberOfRestrooms = NumberOfRestrooms;
        this.Direction = Direction;
        this.Address = Address;
        this.AddressDetail = AddressDetail;
        this.PropertyType = PropertyType;
    }

    public int getId() {
        return Id;
    }

    public void setId(int Id) {
        this.Id = Id;
    }

    public int getUserId() {
        return UserId;
    }

    public void setUserId(int UserId) {
        this.UserId = UserId;
    }

    public Date getCreateDate() {
        return CreateDate;
    }

    public void setCreateDate(Date CreateDate) {
        this.CreateDate = CreateDate;
    }

    public String getTitle() {
        return Title;
    }

    public void setTitle(String Title) {
        this.Title = Title;
    }

    public String getDetail() {
        return Detail;
    }

    public void setDetail(String Detail) {
        this.Detail = Detail;
    }

    public int getPrice() {
        return Price;
    }

    public void setPrice(int Price) {
        this.Price = Price;
    }

    public float getArea() {
        return Area;
    }

    public void setArea(float Area) {
        this.Area = Area;
    }

    public int getNumberOfBedrooms() {
        return NumberOfBedrooms;
    }

    public void setNumberOfBedrooms(int NumberOfBedrooms) {
        this.NumberOfBedrooms = NumberOfBedrooms;
    }

    public int getNumberOfRestrooms() {
        return NumberOfRestrooms;
    }

    public void setNumberOfRestrooms(int NumberOfRestrooms) {
        this.NumberOfRestrooms = NumberOfRestrooms;
    }

    public String getDirection() {
        return Direction;
    }

    public void setDirection(String Direction) {
        this.Direction = Direction;
    }

    public int getAddress() {
        return Address;
    }

    public void setAddress(int Address) {
        this.Address = Address;
    }

    public String getAddressDetail() {
        return AddressDetail;
    }

    public void setAddressDetail(String AddressDetail) {
        this.AddressDetail = AddressDetail;
    }

    public int getPropertyType() {
        return PropertyType;
    }

    public void setPropertyType(int PropertyType) {
        this.PropertyType = PropertyType;
    }

    @Override
    public String toString() {
        return "Post{" + "Id=" + Id + ", UserId=" + UserId + ", CreateDate=" + CreateDate + ", Title=" + Title + ", Detail=" + Detail + ", Price=" + Price + ", Area=" + Area + ", NumberOfBedrooms=" + NumberOfBedrooms + ", NumberOfRestrooms=" + NumberOfRestrooms + ", Direction=" + Direction + ", Address=" + Address + ", AddressDetail=" + AddressDetail + ", PropertyType=" + PropertyType + '}';
    }
}
