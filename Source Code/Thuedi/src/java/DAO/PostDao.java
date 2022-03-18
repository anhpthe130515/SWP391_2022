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
                + "      ,[Accept_covid_patient]\n"
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
                        rs.getInt("Property_type_id"),
                        rs.getBoolean("Accept_covid_patient"));
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

    public Collection<Post> selectByUserId(int id) {
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
                + "      ,[Accept_covid_patient]\n"
                + "  FROM [dbo].[Post] \n"
                + "  WHERE [User_id] = ?";

        Collection<Post> posts = new ArrayList<>();

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                posts.add(
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
                                rs.getBoolean("Accept_covid_patient"))
                );
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

    public Collection<Post> getAllPost() {
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
                + "      ,[Accept_covid_patient]\n"
                + "  FROM [dbo].[Post] \n";

        Collection<Post> posts = new ArrayList<>();

        try {
            PreparedStatement st = connection.prepareStatement(sql);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                posts.add(
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
                                rs.getBoolean("Accept_covid_patient"))
                );
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
                + "           ,[Property_type_id]\n"
                + "           ,[Accept_covid_patient])\n"
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
            st.setBoolean(13, post.isAcceptCovidPatient());

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
            st.setInt(1, postId);
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

    public int DeleteImages(int postId) {
        String sql = "DELETE FROM [dbo].[Post_image]\n"
                + "      WHERE Post_id = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, postId);

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

    public byte[] selectImage(int id) {
        String sql = "SELECT [Image]\n"
                + "  FROM [dbo].[Post_image]\n"
                + "  WHERE [Id] = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);

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
                + "      ,[Accept_covid_patient] = ?\n"
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
            st.setBoolean(11, post.isAcceptCovidPatient());
            st.setInt(12, post.getId());

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

    // List Post
    public ArrayList<Post> getItems(int page) {
        ArrayList<Post> lst = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Post\n"
                    + "ORDER BY Id DESC\n"
                    + "OFFSET ? ROWS\n"
                    + "FETCH FIRST 8 ROWS ONLY";

            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, (page - 1) * 8);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                lst.add(new Post(rs.getInt(1), rs.getInt(2), rs.getDate(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getFloat(7), rs.getInt(8), rs.getInt(9), rs.getString(10), rs.getInt(11), rs.getString(12), rs.getInt(13), rs.getBoolean(14)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(PostDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lst;
    }

    public int getNumPage() {

        String sql = "SELECT count(*) FROM Post";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int total = rs.getInt(1);
                int countPage = 0;
                countPage = total / 8;
                if (total % 8 != 0) {
                    countPage++;
                }
                return countPage;
            }
        } catch (SQLException ex) {
            Logger.getLogger(PostDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public int getNumPost() {

        String sql = "SELECT count(id) FROM Post";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int total = rs.getInt(1);
                int num = 0;
                return num = total;
            }
        } catch (SQLException ex) {
            Logger.getLogger(PostDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

}
