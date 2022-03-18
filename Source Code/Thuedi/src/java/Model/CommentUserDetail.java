/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author pinkd
 */
public class CommentUserDetail {

    private Comment comment;
    private UserDetail userDetail;

    public CommentUserDetail() {
    }

    public CommentUserDetail(Comment comment, UserDetail userDetail) {
        this.comment = comment;
        this.userDetail = userDetail;
    }

    public Comment getComment() {
        return comment;
    }

    public void setComment(Comment comment) {
        this.comment = comment;
    }

    public UserDetail getUserDetail() {
        return userDetail;
    }

    public void setUserDetail(UserDetail userDetail) {
        this.userDetail = userDetail;
    }

}