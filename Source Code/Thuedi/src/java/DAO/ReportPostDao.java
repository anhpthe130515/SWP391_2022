/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.ReportPost;
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
public class ReportPostDao extends DBContext {

    public Collection<ReportPost> select() {
        String sql = "SELECT *"
                + "  FROM [thuedi].[dbo].[Post_report]";
        Collection<ReportPost> reports = new ArrayList<>();

        try {
            PreparedStatement st = connection.prepareStatement(sql);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                reports.add(new ReportPost(rs.getInt("Id"), rs.getInt("Post_id"), rs.getInt("User_id"), rs.getString("Detail"), rs.getDate("Date"), rs.getNString("Status")));
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

        return reports;
    }

    public ReportPost select(int id) {
        String sql = "SELECT *"
                + "  FROM [thuedi].[dbo].[Post_report]\n"
                + "  WHERE [Id] = ?";

        ReportPost post = null;

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);

            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                post = new ReportPost(rs.getInt("Id"), rs.getInt("Post_id"), rs.getInt("User_id"), rs.getString("Detail"), rs.getDate("Date"), rs.getNString("Status"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ReportPostDao.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        } finally {
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(ReportPostDao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return post;
    }

    public int insert(ReportPost report) {
        String sql = "INSERT INTO [dbo].[Post_report]\n"
                + "           ([Post_id]\n"
                + "           ,[User_id]\n"
                + "           ,[Detail])\n"
                + "           ,[Date]\n"
                + "           ,[Status])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            st.setInt(1, report.getPostId());
            st.setInt(2, report.getUserId());
            st.setString(3, report.getDetail());
            st.setDate(4, report.getDate());
            st.setNString(5, report.getStatus());

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

    public void editStatus(ReportPost reportPost) {
        String sql = "UPDATE [dbo].[Post_report]\n"
                + "   SET [Status] = ?\n"
                + " WHERE Id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setNString(1, reportPost.getStatus());
            st.setInt(2, reportPost.getId());
            int result = st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(PostDao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
}
