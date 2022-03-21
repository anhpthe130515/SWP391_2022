/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.User;
import Model.UserDetail;
import Model.UserUserDetail;
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
 * @author TuanLA
 */
public class UserDao extends DBContext {

    public User login(String user, String pass) {
        String sql = "select * from [User]\n"
                + "where Email = ?\n"
                + "and [Password] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);
            st.setString(2, pass);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new User(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getDate(5),
                        rs.getBoolean(6)
                );
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

        return null;
    }

    /**
     * Insert user to database
     *
     * @author pinkd
     *
     * @param user object
     * @return id of the user just inserted into the database
     */
    public int insertUser(User user) {
        String sql = "INSERT INTO [User]([Email],[Password],[Role_id],[Create_date],[Is_deleted]) VALUES (?,?,?,?,?)";
        int id = 0;
        try {
            PreparedStatement st = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            st.setString(1, user.getEmail());
            st.setString(2, user.getPassword());
            st.setInt(3, user.getRoleId());
            st.setDate(4, user.getCreateDate());
            st.setBoolean(5, user.isIsDeleted());
            int affectedRows = st.executeUpdate();
            if (affectedRows > 0) {
                try (ResultSet rs = st.getGeneratedKeys()) {
                    if (rs.next()) {
                        id = (int) rs.getLong(1);
                    } else {
                        throw new SQLException("Can't get user id.");
                    }
                } catch (SQLException ex) {
                    System.out.println(ex.getMessage());
                }
            } else {
                throw new SQLException("Creating user failed, no rows affected.");
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
        return id;
    }

    /**
     * Insert user detail to database
     *
     * @author pinkd
     *
     * @param userDetail object
     * @return
     */
    public void insertUserDetail(UserDetail userDetail) {
        String sql = "INSERT INTO [User_detail] VALUES (?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userDetail.getUserId());
            st.setString(2, userDetail.getName());
            st.setString(3, userDetail.getPhone());
            st.setString(4, userDetail.getImageLink());
            st.setString(5, userDetail.getPersonalId());
            st.setString(6, userDetail.getContact());
            st.executeUpdate();
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

    /**
     * Check if the user exists in the database or not
     *
     * @author pinkd
     *
     * @param email email of user to check
     * @return true if user exist, false if not
     */
    public boolean checkUserExist(String email) {
        String sql = "SELECT * FROM [User]\n"
                + "WHERE Email = ?\n";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return true;
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

        return false;
    }

    public Collection<UserUserDetail> getAllUsers() {
        String sql = "SELECT [id]\n"
                + "      ,[Email]\n"
                + "      ,[Password]\n"
                + "      ,[Role_id]\n"
                + "      ,[Create_date]\n"
                + "      ,[Is_deleted]\n"
                + "	  ,[Name]\n"
                + "      ,[Phone]\n"
                + "      ,[Image_link]\n"
                + "      ,[Personal_id]\n"
                + "      ,[Contacts]\n"
                + "  FROM [thuedi].[dbo].[User]\n"
                + "  INNER JOIN [thuedi].[dbo].[User_detail]\n"
                + "  ON [dbo].[User].id = [dbo].[User_detail].[User_Id]"
                + " WHERE Is_deleted = 0";
        Collection<UserUserDetail> users = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                users.add(new UserUserDetail(new User(rs.getInt("id"), rs.getString("Email"), rs.getString("Password"), rs.getInt("Role_id"), rs.getDate("Create_date"), rs.getBoolean("Is_deleted")), 
                        new UserDetail(rs.getInt("id"), rs.getString("Name"), rs.getString("Phone"), rs.getString("Image_link"), rs.getString("Personal_id"), rs.getString("Contacts"))));
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
            return null;
    
    public User select(int id) {
        String sql = "SELECT * FROM [User]\n"
                + "WHERE id = ?\n";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new User(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getDate(5),
                        rs.getBoolean(6)
                );
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
        return null;
    }
    public UserDetail selectUserDetail(int id) {
        String sql = "SELECT [User_Id]\n"
                + "      ,[Name]\n"
                + "      ,[Phone]\n"
                + "      ,[Image_link]\n"
                + "      ,[Personal_id]\n"
                + "      ,[Contacts]\n"
                + "  FROM [thuedi].[dbo].[User_detail]\n"
                + "  WHERE [User_Id] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new UserDetail(rs.getInt("User_id"),
                        rs.getString("Name"),
                        rs.getString("Phone"),
                        rs.getString("Image_link"),
                        rs.getString("Personal_id"),
                        rs.getString("Contacts")
                );
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
        return null;
    }

    public void deleteUser(int id) {
        String sql = "UPDATE [thuedi].[dbo].[User]\n"
                + "SET [Is_deleted] = 1\n"
                + "WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);

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
        return null;
    }
    
    public UserDetail userInfo(int id) {
        String sql = "select *\n" +
                    "from [User_detail]\n" +
                    "where [User_Id] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new UserDetail(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6)
                );
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
        return null;
    }

}
