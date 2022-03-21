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
public class UserUserDetail {

    private User user;
    private UserDetail detail;

    public UserUserDetail() {
    }

    public UserUserDetail(User user, UserDetail detail) {
        this.user = user;
        this.detail = detail;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public UserDetail getDetail() {
        return detail;
    }

    public void setDetail(UserDetail detail) {
        this.detail = detail;
    }

}
