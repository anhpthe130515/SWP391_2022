/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.CommentDao;
import Model.Comment;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author pinkd
 */
@WebServlet(name = "CommentController", urlPatterns = {"/comment"})
public class CommentController extends HttpServlet {

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String postId = request.getParameter("id");
        if (postId != null) {
            Comment comment = new Comment();
            comment.setPostId(Integer.parseInt(postId));
            comment.setComment(request.getParameter("content"));
            comment.setCreateDate(new Date(System.currentTimeMillis()));
            User user = (User) request.getSession().getAttribute("user");
            if (user == null) {
                String ms = "Ban phai dang nhap de binh luan";
                response.sendRedirect("PostDetail?id=" + request.getParameter("id") + "&error=" + ms);
            } else {
                comment.setUserId(user.getId());
                int id = new CommentDao().insertComment(comment);
                response.sendRedirect("PostDetail?id=" + request.getParameter("id"));
            }
        } 
    }
    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
