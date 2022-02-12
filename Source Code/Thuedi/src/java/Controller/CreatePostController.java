/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.Post;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
@WebServlet(name = "CreatePostController", urlPatterns = {"/CreatePost"})
public class CreatePostController extends RequireLandlordController{

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("createpost.jsp").forward(request, response);
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Post post = new Post();
        post.setUserId(Integer.parseInt(request.getParameter("user_id")));
        post.setCreateDate(new Date(System.currentTimeMillis()));
        post.setTitle(request.getParameter("title"));
        post.setDetail(request.getParameter("detail"));
        post.setPrice(Integer.parseInt(request.getParameter("price")));
        post.setArea(Float.parseFloat(request.getParameter("area")));
        post.setNumberOfBedrooms(Integer.parseInt(request.getParameter("nob")));
        post.setNumberOfRestrooms(Integer.parseInt(request.getParameter("nor")));
        post.setDirection(request.getParameter("direction"));
        post.setAddress(Integer.parseInt(request.getParameter("address")));
        post.setAddressDetail(request.getParameter("address_detail"));
        post.setPropertyType(Integer.parseInt(request.getParameter("property_type")));
        
        System.out.println(post);
    }
    
}
