/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.PostDao;
import Model.Post;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
@WebServlet(name = "PaymentController", urlPatterns = {"/Landlord/Payment"})
public class PaymentController extends HttpServlet {
    private boolean checkPostExist(HttpServletRequest request) {
        return request.getSession().getAttribute("post") == null;
    }
    
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
        if (checkPostExist(request)) {
            response.sendRedirect("CreatePost");
            return;
        }
        
        request.getRequestDispatcher("/WEB-INF/payment.jsp").forward(request, response);
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
        if (checkPostExist(request)) {
            response.sendRedirect("CreatePost");
            return;
        }
        int id = new PostDao().insert((Post)request.getSession().getAttribute("post"));
        request.getSession().removeAttribute("post");
        
        if(id == -1) {
            request.setAttribute("errorms", "Có lỗi xảy ra trong quá trình tạo bài đăng. Xin hãy vui lòng liên hệ admin");
            new CreatePostController().doGet(request, response);
            return;
        }
        
        int flag = 0;
        ArrayList<InputStream> images = (ArrayList<InputStream>)request.getSession().getAttribute("images");
        for (InputStream image : images) {
            if(flag != -1) {
                flag = new PostDao().insertImage(image, id);
            } else {
                new PostDao().insertImage(image, id);
            }
        }
        request.getSession().removeAttribute("images");
        
        if(id == -1) {
            request.setAttribute("erorms", "Có lỗi xảy ra trong quá trình đăng tải ảnh. Xin hãy vui lòng cập nhật lại bài đăng");
            new CreatePostController().doGet(request, response);
            return;
        }
        
        response.sendRedirect("../list");
    }


}
