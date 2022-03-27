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
public class ReportPost {

    private int Id;
    private int PostId;
    private int UserId;
    private String Detail;
    private Date date;
    private String status;

    public ReportPost() {
    }

    public ReportPost(int Id, int PostId, int UserId, String Detail, Date date, String status) {
        this.Id = Id;
        this.PostId = PostId;
        this.UserId = UserId;
        this.Detail = Detail;
        this.date = date;
        this.status = status;
    }

    public int getId() {
        return Id;
    }

    public void setId(int Id) {
        this.Id = Id;
    }

    public int getPostId() {
        return PostId;
    }

    public void setPostId(int PostId) {
        this.PostId = PostId;
    }

    public int getUserId() {
        return UserId;
    }

    public void setUserId(int UserId) {
        this.UserId = UserId;
    }

    public String getDetail() {
        return Detail;
    }

    public void setDetail(String Detail) {
        this.Detail = Detail;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
