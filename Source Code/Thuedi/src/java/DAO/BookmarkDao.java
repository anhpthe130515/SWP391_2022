/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.Bookmark;
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
    public Collection<Bookmark> select() {
        String sql = "SELECT [Id]\n"
                + "      ,[Post_id]\n"
                + "      ,[User_id]\n"
                + "  FROM [thuedi].[dbo].[Bookmark]";
        Collection<Bookmark> bookmarks = new ArrayList<>();

        try {
            PreparedStatement st = connection.prepareStatement(sql);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                bookmarks.add(new Bookmark(rs.getInt("Id"), rs.getInt("Post_id"), rs.getInt("User_ud")));
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(PostDao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        return bookmarks;
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
}
