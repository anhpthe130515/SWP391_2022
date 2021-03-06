/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.District;
import Model.Subdistrict;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class DistrictDao extends DBContext{
    public Collection<District> select() {
        String sql = "SELECT * FROM [thuedi].[dbo].[District]";
        Collection<District> districts = new ArrayList<>();
        
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            
            ResultSet rs = st.executeQuery();
            while(rs.next()) {
                districts.add(new District(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4)));
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
        
        return districts;
    }
    
    public District select(int id) {
        String sql = "SELECT * FROM [District]"
                + "  WHERE [Id] = ?";
        District district = null;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                district = new District(rs.getInt("Id"), rs.getString("Name"), rs.getString("Area_review"), rs.getString("Image_URL"));
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
        return district;
    }
    
    public Collection<Subdistrict> selectSubdistrict(int id) {
        String sql = "SELECT * FROM [thuedi].[dbo].[Sub_district] WHERE District_id = ?";
        Collection<Subdistrict> subdistricts = new ArrayList<>();
        
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            
            ResultSet rs = st.executeQuery();
            while(rs.next()) {
                subdistricts.add(new Subdistrict(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4)));
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
        
        return subdistricts;
    }
}
