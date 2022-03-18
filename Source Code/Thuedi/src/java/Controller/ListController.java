/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.DistrictDao;
import DAO.PostDao;
import DAO.PropertyTypeDao;
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
        ArrayList<District> listDistricts = (ArrayList<District>) new DistrictDao().select();
        ArrayList<PropertyType> listPropertyTypes = (ArrayList<PropertyType>) new PropertyTypeDao().select();
        Integer districtId = request.getParameter("district") == null || request.getParameter("district").equals("") ? 0 : Integer.parseInt(request.getParameter("district"));
        Integer propertyTypeId = request.getParameter("propertyType") == null || request.getParameter("propertyType").equals("") ? 0 : Integer.parseInt(request.getParameter("propertyType"));
        Integer price1 = request.getParameter("price") == null || request.getParameter("price").equals("") ? 0 : Integer.parseInt(request.getParameter("price"));
        Integer covid1 = request.getParameter("covid") == null || request.getParameter("covid").equals("") ? 2 : Integer.parseInt(request.getParameter("covid"));
        String dis = "";
        if(districtId == 0){
            dis = "T1.Id";
        } else{
            dis = "" +districtId;
        }
        String pro = "";
        if(propertyTypeId == 0){
            pro = "T4.Id";
        } else{
            pro = "" +propertyTypeId;
        }
        String price2 = "";
        if(price1 == 0){
            price2 = "> 0";
        }else if(price1 == 1){
            price2 = "<= 3000000";
        }else if(price1 == 2){
            price2 = "between 3000000 and 7000000";
        }else{
            price2 = ">=7000000";
        }
        String covid2 = "";
        if(covid1 == 0){
            covid2 = "= 0";
        }else if(covid1 == 1){
            covid2 = "= 1";
        }else {
            covid2 = "in (0,1)";
        }
        
        int numPage = new PostDao().getNumPage(dis, pro, price2, covid2);
        int numPost = new PostDao().getNumPost(dis, pro, price2, covid2);
        ArrayList<Post> lst = new PostDao().getItems(dis, pro ,price2, covid2, indexPage);
        
        request.setAttribute("lst", lst);
        request.setAttribute("numPage", numPage);
        request.setAttribute("numPost", numPost);
        request.setAttribute("page", page);
        request.setAttribute("listDistricts", listDistricts);
        request.setAttribute("listPropertyTypes", listPropertyTypes);
        request.setAttribute("district", districtId);
        request.setAttribute("propertyType", propertyTypeId);
        request.setAttribute("price", price1);
        request.setAttribute("covid", covid1);
        request.getRequestDispatcher("/WEB-INF/list.jsp").forward(request, response);
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
