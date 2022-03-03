/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.DistrictDao;
import DAO.PostDao;
import DAO.PropertyTypeDao;
import DAO.SubdistrictDao;
import Model.District;
import Model.Post;
import Model.Subdistrict;
import Model.User;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Collection;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author pinkd
 */
@WebServlet(name = "UpdatePostController", urlPatterns = {"/Landlord/updatePost"})
@MultipartConfig(fileSizeThreshold=1024*1024*10, 	// 10 MB 
                 maxFileSize=1024*1024*50,      	// 50 MB
                 maxRequestSize=1024*1024*100)          // 100 MB
public class UpdatePostController extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UpdatePostController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdatePostController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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
        // set default values
        Collection<District> districtList = new DistrictDao().select();
        Collection<Subdistrict> subdistrictList = new SubdistrictDao().select();

        // get post by id 
        int id = Integer.parseInt(request.getParameter("id"));
        Post post = new PostDao().select(id);
        
        Subdistrict subdistrict = subdistrictList.stream()
                .filter(predicate -> post.getAddress() == predicate.getId())
                .findAny()
                .orElse(null);
        
        District district = districtList.stream()
                .filter(predicate -> subdistrict.getDistrictId() == predicate.getId())
                .findAny()
                .orElse(null);

        // set value of post update
        request.setAttribute("post", post);
        request.setAttribute("propertyType", new PropertyTypeDao().select());
        request.setAttribute("districtList", districtList);
        request.setAttribute("subdistrictList", subdistrictList);
        request.setAttribute("district", district);
        request.setAttribute("listImageId", new PostDao().getAllImageId(id));
        
        request.getSession().setAttribute("post", post);
        
        request.getRequestDispatcher("/WEB-INF/updatePost.jsp").forward(request, response);
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
        int id = Integer.parseInt(request.getParameter("id"));
        Post post = new PostDao().select(id);
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
        
        ArrayList<InputStream> images = new ArrayList<>();
        
        for (Part part : request.getParts()) {
            if (part.getContentType() != null) {                
                if (("image/png").equals(part.getContentType()) || ("image/jpeg").equals(part.getContentType())) {
                    images.add(part.getInputStream());
                }
            }
        }
        request.getSession().setAttribute("images", images);
        new PostDao().update(post);
        response.sendRedirect("ManagePost");
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
