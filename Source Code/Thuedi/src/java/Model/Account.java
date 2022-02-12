/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.Date;

/**
 *
 * @author TuanLA
 */
public class Account {
    private int id;
    private String email;
    private String password;
    private int roleId;
    private Date createDate;
    private boolean isDeleted;

    public Account() {
    }

    public Account(int id, String email, String password, int roleId, Date createDate, boolean isDeleted) {
        this.id = id;
        this.email = email;
        this.password = password;
        this.roleId = roleId;
        this.createDate = createDate;
        this.isDeleted = isDeleted;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public boolean isIsDeleted() {
        return isDeleted;
    }

    public void setIsDeleted(boolean isDeleted) {
        this.isDeleted = isDeleted;
    }

    @Override
    public String toString() {
        return "Account{" + "id=" + id + ", email=" + email + ", password=" + password + ", roleId=" + roleId + ", createDate=" + createDate + ", isDeleted=" + isDeleted + '}';
    }

   
}
