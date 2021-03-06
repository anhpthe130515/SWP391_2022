/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.CommentDao;
import DAO.DistrictDao;
import DAO.PostDao;
import DAO.PropertyTypeDao;
import DAO.SubdistrictDao;
import DAO.UserDao;
import Model.Post;
import Model.Comment;
import Model.CommentUserDetail;
import java.io.IOException;
import java.util.Collection;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
@WebServlet(name = "PostDetailController", urlPatterns = {"/PostDetail"})
public class PostDetailController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getParameter("id") == null) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN);
        }

        request.setAttribute("error", request.getParameter("error"));

        int id = Integer.parseInt(request.getParameter("id"));

        request.setAttribute("propertyType", new PropertyTypeDao().select());
        request.setAttribute("district", new DistrictDao().select());
        request.setAttribute("subdistrict", new SubdistrictDao().select());

        Post post = new PostDao().select(id);
        request.setAttribute("post", post);

        request.setAttribute("author", new UserDao().select(post.getUserId()));
        
        request.setAttribute("authorDetail", new UserDao().selectUserDetail(post.getUserId()));


        request.setAttribute("listImageId", new PostDao().getAllImageId(id));

        Collection<CommentUserDetail> comments = new CommentDao().selectByPostId(id);
        request.setAttribute("comments", comments);
        System.out.println("comment: " + comments.size());

        request.getRequestDispatcher("/WEB-INF/postdetail.jsp").forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
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
        processRequest(request, response);
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
        processRequest(request, response);
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