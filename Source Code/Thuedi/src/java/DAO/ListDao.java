/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import static DAO.DBContext.connection;
import Model.District;
import Model.Post;
import Model.PropertyType;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author AnhPT
 */
public class ListDao {

    public ArrayList<Post> getItems(int page) {
        ArrayList<Post> lst = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Post\n"
                    + "ORDER BY Create_date\n"
                    + "OFFSET ? ROWS\n"
                    + "FETCH FIRST 2 ROWS ONLY";

            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, (page-1)*2);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                lst.add(new Post(rs.getInt(1), rs.getInt(2), rs.getDate(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getFloat(7), rs.getInt(8), rs.getInt(9), rs.getString(10), rs.getInt(11), rs.getString(12), rs.getInt(13)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ListDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lst;
    }

    public ArrayList<District> getDistrict() {

        ArrayList<District> dm = new ArrayList<>();
        try {
            String sql = "SELECT * FROM District";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                dm.add(new District(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ListDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        for (District district : dm) {
            System.out.println(district.getName());
        }
        return dm;
    }

    public ArrayList<PropertyType> getPropertyType() {

        ArrayList<PropertyType> dm = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Property_type";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                dm.add(new PropertyType(rs.getInt(1), rs.getString(2)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ListDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        for (PropertyType propertyType : dm) {
            System.out.println(propertyType.getName());
        }
        return dm;
    }

    public int getNumPage() {

        String sql = "SELECT count(*) FROM Property_type";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int total = rs.getInt(1);
                int countPage = 0;
                countPage = total / 2;
                if (total % 2 != 0) {
                    countPage++;
                }
                return countPage;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ListDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }
}
