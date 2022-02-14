/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.Post;
import Model.User;
import java.io.InputStream;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class PostDao extends DBContext{
    public static int insert(Post post) {
        String sql = "INSERT INTO [dbo].[Post]\n"
                + "           ([User_id]\n"
                + "           ,[Create_date]\n"
                + "           ,[Title]\n"
                + "           ,[Detail]\n"
                + "           ,[Price]\n"
                + "           ,[Area]\n"
                + "           ,[Number_of_bedrooms]\n"
                + "           ,[Number_of_restrooms]\n"
                + "           ,[Direction]\n"
                + "           ,[Address]\n"
                + "           ,[Address_detail]\n"
                + "           ,[Property_type_id])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            st.setString(1, post.getUserId()+"");
            st.setString(2, post.getCreateDate().toString());
            st.setString(3, post.getTitle());
            st.setString(4, post.getDetail());
            st.setString(5, post.getPrice()+"");
            st.setString(6, post.getArea()+"");
            st.setString(7, post.getNumberOfBedrooms()+"");
            st.setString(8, post.getNumberOfRestrooms()+"");
            st.setString(9, post.getDirection());
            st.setString(10, post.getAddress()+"");
            st.setString(11, post.getAddressDetail());
            st.setString(12, post.getPropertyType()+"");
            
            st.executeUpdate();
            
            if(st.getGeneratedKeys().next()) {
                return st.getGeneratedKeys().getInt(1);
            } else {
                throw new SQLException("Cannot get generated keys");
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
            
            return -1;
        }
    }
    
    public static void insertImage(InputStream image, int postId) {
        String sql = "INSERT INTO [dbo].[Post_image]\n"
                + "           ([Post_id]\n"
                + "           ,[Image_link])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?)";
        
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, postId+"");
            st.setBlob(2, image);
            
            st.execute();
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    
}
