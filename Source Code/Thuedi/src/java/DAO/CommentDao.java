/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.Comment;
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
 * @author pinkd
 */
public class CommentDao extends DBContext {

    public Comment selectById(int id) {
        String sql = "SELECT [Id], [Post_id], [Comment], [User_id]\n"
                + "  FROM [Post_comment]\n"
                + "  WHERE Id = ?";
        Comment comment = null;

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);

            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                comment = new Comment(rs.getInt("Id"), rs.getInt("Post_id"), rs.getInt("User_id"), rs.getString("Comment"));
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

        return comment;
    }

    public Collection<Comment> selectByPostId(int id) {
        String sql = "SELECT [Id], [Post_id], [Comment], [User_id]\n"
                + "  FROM [Post_comment]\n"
                + "  WHERE Post_id = ?";
        Collection<Comment> comments = new ArrayList<>();

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                comments.add(new Comment(rs.getInt("Id"), rs.getInt("Post_id"), rs.getInt("User_id"), rs.getString("Comment")));
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

        return comments;
    }

    public int insertComment(Comment comment) {
        String sql = "INSERT INTO [Post_comment]([Post_id],[Comment],[User_id]) VALUES (?,?,?)";
        int id = 0;
        try {
            PreparedStatement st = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            st.setInt(1, comment.getPostId());
            st.setString(2, comment.getComment());
            st.setInt(3, comment.getUserId());
            int affectedRows = st.executeUpdate();
            if (affectedRows > 0) {
                try (ResultSet rs = st.getGeneratedKeys()) {
                    if (rs.next()) {
                        id = (int) rs.getLong(1);
                    } else {
                        throw new SQLException("Can't get comment id.");
                    }
                } catch (SQLException ex) {
                    System.out.println(ex.getMessage());
                }
            } else {
                throw new SQLException("Creating comment failed, no rows affected.");
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

    public int deleteComment(int id) {
        String sql = "DELETE FROM [Post_comment]\n"
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

    public void updateComment(Comment comment) {
        String sql = "UPDATE [Post_comment]\n"
                + "   SET [Comment] = ?\n"
                + " WHERE Id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, comment.getComment());
            st.setInt(2, comment.getId());
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
