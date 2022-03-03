/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.ListDao;
import Model.District;
import Model.Post;
import Model.PropertyType;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author TuanLA
 */
@WebServlet(name = "ListControl", urlPatterns = {"/list"})
public class ListController extends HttpServlet {

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
        String page = request.getParameter("page");
        if(page==null){
            page = "1";
        }
        int indexPage = Integer.parseInt(page);
        int numPage = new ListDao().getNumPage();
        int numPost = new ListDao().getNumPost();
        ArrayList<Post> lst = new ListDao().getItems(indexPage);
        ArrayList<District> listDistricts = new ListDao().getDistrict();
        ArrayList<PropertyType> listPropertyTypes = new ListDao().getPropertyType();
        Integer districtId = request.getParameter("district") == null || request.getParameter("district").equals("") ? null : Integer.parseInt(request.getParameter("district"));
        Integer propertyTypeId = request.getParameter("propertyType") == null || request.getParameter("propertyType").equals("") ? null : Integer.parseInt(request.getParameter("propertyType"));
        
        request.setAttribute("lst", lst);
        request.setAttribute("numPage", numPage);
        request.setAttribute("numPost", numPost);
        request.setAttribute("listDistricts", listDistricts);
        request.setAttribute("listPropertyTypes", listPropertyTypes);
        request.setAttribute("district", districtId);
        request.setAttribute("propertyType", propertyTypeId);
        request.getRequestDispatcher("list.jsp").forward(request, response);
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
