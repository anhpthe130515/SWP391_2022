/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.Post;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Date;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author Admin
 */
@WebServlet(name = "CreatePostControl", urlPatterns = {"/Landlord/CreatePost"})
@MultipartConfig(fileSizeThreshold=1024*1024*10, 	// 10 MB 
                 maxFileSize=1024*1024*50,      	// 50 MB
                 maxRequestSize=1024*1024*100)          // 100 MB
public class CreatePostController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/createpost.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
        
        request.getSession().setAttribute("post", post);
        
        ArrayList<InputStream> images = new ArrayList<>();
        
        for (Part part : request.getParts()) {
            if(part.getContentType() != null) { 
                if (("image/png").equals(part.getContentType()) || ("image/jpeg").equals(part.getContentType())) {
                    images.add(part.getInputStream());
                }
            }
        }
        request.getSession().setAttribute("images", images);
        
        response.sendRedirect("Payment");
    }
}
