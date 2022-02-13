/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.User;
import Model.UserDetail;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author TuanLA
 */
public class UserDao extends DBContext {

    public static User login(String user, String pass) {
        String sql = "select * from [User]\n"
                + "where Email = ?\n"
                + "and [Password] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);
            st.setString(2, pass);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new User(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getDate(5),
                        rs.getBoolean(6)
                );
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

    /**
    * Insert user to database
    * 
    * @author pinkd
    * 
    * @param  user   object
    * @return id of the user just inserted into the database
    */
    public int insertUser(User user) {
        String sql = "INSERT INTO [User]([Email],[Password],[Role_id],[Create_date],[Is_deleted]) VALUES (?,?,?,?,?)";
        int id = 0;
        try {
            PreparedStatement st = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            st.setString(1, user.getEmail());
            st.setString(2, user.getPassword());
            st.setInt(3, user.getRoleId());
            st.setDate(4, user.getCreateDate());
            st.setBoolean(5, user.isIsDeleted());
            int affectedRows = st.executeUpdate();
            if (affectedRows > 0) {
                try (ResultSet rs = st.getGeneratedKeys()) {
                    if (rs.next()) {
                        id = (int) rs.getLong(1);
                    } else {
                        throw new SQLException("Can't get user id.");
                    }
                } catch (SQLException ex) {
                    System.out.println(ex.getMessage());
                }
            } else {
                throw new SQLException("Creating user failed, no rows affected.");
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return id;
    }

    /**
    * Insert user detail to database
    * 
    * @author pinkd
    * 
    * @param  userDetail   object
    * @return 
    */
    public void insertUserDetail(UserDetail userDetail) {
        String sql = "INSERT INTO [User_detail] VALUES (?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userDetail.getUserId());
            st.setString(2, userDetail.getName());
            st.setString(3, userDetail.getPhone());
            st.setString(4, userDetail.getImageLink());
            st.setString(5, userDetail.getPersonalId());
            st.setString(6, userDetail.getContact());
            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
    * Check if the user exists in the database or not
    * 
    * @author pinkd
    * 
    * @param  email   email of user to check
    * @return         true if user exist, false if not
    */
    public boolean checkUserExist(String email) {
        String sql = "SELECT * FROM [User]\n"
                + "WHERE Email = ?\n";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
}
