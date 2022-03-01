/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.Post;
import Model.Subdistrict;
import Model.User;
import java.io.InputStream;
import java.sql.Blob;
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
public class PostDao extends DBContext {

    public Post select(int id) {
        String sql = "SELECT [Id]\n"
                + "      ,[User_id]\n"
                + "      ,[Create_date]\n"
                + "      ,[Title]\n"
                + "      ,[Detail]\n"
                + "      ,[Price]\n"
                + "      ,[Area]\n"
                + "      ,[Number_of_bedrooms]\n"
                + "      ,[Number_of_restrooms]\n"
                + "      ,[Direction]\n"
                + "      ,[Address]\n"
                + "      ,[Address_detail]\n"
                + "      ,[Property_type_id]\n"
                + "  FROM [dbo].[Post] \n"
                + "  WHERE [Id] = ?";

        Post post = null;

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);

            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                post = new Post(
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
                        rs.getInt("Property_type_id"));
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

        return post;
    }

    public int insert(Post post) {
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
            st.setInt(1, post.getUserId());
            st.setDate(2, post.getCreateDate());
            st.setString(3, post.getTitle());
            st.setString(4, post.getDetail());
            st.setInt(5, post.getPrice());
            st.setFloat(6, post.getArea());
            st.setInt(7, post.getNumberOfBedrooms());
            st.setInt(8, post.getNumberOfRestrooms());
            st.setString(9, post.getDirection());
            st.setInt(10, post.getAddress());
            st.setString(11, post.getAddressDetail());
            st.setInt(12, post.getPropertyType());

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

    public int insertImage(InputStream image, int postId) {
        String sql = "INSERT INTO [dbo].[Post_image]\n"
                + "           ([Post_id]\n"
                + "           ,[Image])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?)";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, postId + "");
            st.setBlob(2, image);

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

    public byte[] selectImage(int id) {
        String sql = "SELECT [Image]\n"
                + "  FROM [dbo].[Post_image]\n"
                + "  WHERE [Id] = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id + "");

            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Blob image = rs.getBlob(1);
                return image.getBytes(1, (int) image.length());
            } else {
                throw new SQLException("Id not found");
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
    }

    public int DeletePost(int id) {
        String sql = "DELETE FROM [dbo].[Post]\n"
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

    public ArrayList<Integer> getAllImageId(int postId) {
        String sql = "SELECT Id FROM [thuedi].[dbo].[Post_image] WHERE Post_id = ?";
        ArrayList<Integer> listImageId = new ArrayList<>();

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, postId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                listImageId.add(rs.getInt("Id"));
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

        return listImageId;
    }

    public void update(Post post) {
        System.out.println("ID = " + post.getId());
        String sql = "UPDATE [dbo].[Post]\n"
                + "   SET "
                + "      [Title] = ?\n"
                + "      ,[Detail] = ?\n"
                + "      ,[Price] = ?\n"
                + "      ,[Area] = ?\n"
                + "      ,[Number_of_bedrooms] = ?\n"
                + "      ,[Number_of_restrooms] = ?\n"
                + "      ,[Direction] = ?\n"
                + "      ,[Address] = ?\n"
                + "      ,[Address_detail] = ?\n"
                + "      ,[Property_type_id] = ?\n"
                + " WHERE Id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, post.getTitle());
            st.setString(2, post.getDetail());
            st.setInt(3, post.getPrice());
            st.setFloat(4, post.getArea());
            st.setInt(5, post.getNumberOfBedrooms());
            st.setInt(6, post.getNumberOfRestrooms());
            st.setString(7, post.getDirection());
            st.setInt(8, post.getAddress());
            st.setString(9, post.getAddressDetail());
            st.setInt(10, post.getPropertyType());
            st.setInt(11, post.getId());

            int result = st.executeUpdate();
            System.out.println("result = " + result);

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
