/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.Date;

/**
 *
 * @author pinkd
 */
public class Comment {

    private int id;
    private int postId;
    private int userId;
    private String comment;
    private Date createDate;

    public Comment() {
    }

    public Comment(int id, int postId, int userId, String comment, Date createDate) {
        this.id = id;
        this.postId = postId;
        this.userId = userId;
        this.comment = comment;
        this.createDate = createDate;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getPostId() {
        return postId;
    }

    public void setPostId(int postId) {
        this.postId = postId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    @Override
    public String toString() {
        return "Id: " + id + " - PostId: " + postId + " - UserId: " + userId + " - Comment: " + comment + " - Date: " + createDate;
    }

}
