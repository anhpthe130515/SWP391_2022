/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.Bookmark;
import Model.Post;
import Model.PostBookmark;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collection;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class BookmarkDao extends DBContext {
    public Collection<PostBookmark> selectBookmarkedPost(int id) {
        String sql = "SELECT p.[Id] \n"
                + "      ,p.[User_id]\n"
                + "      ,p.[Create_date]\n"
                + "      ,p.[Title]\n"
                + "      ,p.[Detail]\n"
                + "      ,p.[Price]\n"
                + "      ,p.[Area]\n"
                + "      ,p.[Number_of_bedrooms]\n"
                + "      ,p.[Number_of_restrooms]\n"
                + "      ,p.[Direction]\n"
                + "      ,p.[Address]\n"
                + "      ,p.[Address_detail]\n"
                + "      ,p.[Property_type_id]\n"
                + "      ,p.[Accept_covid_patient]\n"
                + "	  ,b.[Id] as Bookmark_id\n"
                + "  FROM [thuedi].[dbo].[Post] p\n"
                + "  INNER JOIN [thuedi].[dbo].[Bookmark] b \n"
                + "  ON p.[Id] = b.[Post_id]\n"
                + "  WHERE b.[User_id] = ?";
        
        Collection<PostBookmark> posts = new ArrayList<>();
        
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            
            ResultSet rs = st.executeQuery();
            while(rs.next()) {
                posts.add(new PostBookmark(
                        new Post(
                                rs.getInt("Id"),
                                rs.getInt("User_id"),
                                rs.getDate("Create_date"),
                                rs.getString("Title"),
                                rs.getString("Detail"),
                                rs.getInt("Price"),
                                rs.getFloat("Area"),
                                rs.getInt("Number_of_bedrooms"),
                                rs.getInt("Number_of_restrooms"),
                                rs.getString("Direction"),
                                rs.getInt("Address"),
                                rs.getString("Address_detail"),
                                rs.getInt("Property_type_id"),
                                rs.getBoolean("Accept_covid_patient")),
                        new Bookmark(
                                rs.getInt("Bookmark_id"),
                                rs.getInt("Id"),
                                id)
                ));
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        } finally {
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(PostDao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        return posts;
    } 
    
    public int insert(Bookmark bookmark) {
        String sql = "INSERT INTO [dbo].[Bookmark]\n"
                + "           ([Post_id]\n"
                + "           ,[User_id])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            st.setInt(1, bookmark.getPostId());
            st.setInt(2, bookmark.getUserId());

            st.executeUpdate();

            if (st.getGeneratedKeys().next()) {
                return st.getGeneratedKeys().getInt(1);
            } else {
                throw new SQLException("Cannot get generated keys");
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);

            return -1;
        } finally {
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(PostDao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
    
    public int delete(int id) {
        String sql = "DELETE FROM [dbo].[Bookmark]\n"
                + "      WHERE Id = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);

            return st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(PostDao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return 0;
    }
}
