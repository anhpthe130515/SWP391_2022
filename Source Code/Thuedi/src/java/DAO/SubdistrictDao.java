/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

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
public class SubdistrictDao extends DBContext{
    public Collection<Subdistrict> select() {
        String sql = "SELECT * FROM [thuedi].[dbo].[Sub_district]";
        Collection<Subdistrict> subdistricts = new ArrayList<>();
        
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            
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
