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
public class ReportPostDao extends DBContext{
    public Collection<ReportPost> select() {
        String sql = "SELECT [Id]\n"
                + "      ,[Post_id]\n"
                + "      ,[User_id]\n"
                + "      ,[Detail]\n"
                + "  FROM [thuedi].[dbo].[Post_report]";
        Collection<ReportPost> reports = new ArrayList<>();

        try {
            PreparedStatement st = connection.prepareStatement(sql);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                reports.add(new ReportPost(rs.getInt("Id"), rs.getInt("Post_id"), rs.getInt("User_ud"), rs.getString("Detail")));
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
    
    public int insert(ReportPost report) {
        String sql = "INSERT INTO [dbo].[Post_report]\n"
                + "           ([Post_id]\n"
                + "           ,[User_id]\n"
                + "           ,[Detail])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            st.setInt(1, report.getPostId());
            st.setInt(2, report.getUserId());
            st.setString(3, report.getDetail());

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
