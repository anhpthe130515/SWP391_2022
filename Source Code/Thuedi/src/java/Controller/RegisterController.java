/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.UserDao;
import Model.Role;
import Model.User;
import Model.UserDetail;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigInteger;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Validation;
import javax.validation.Validator;
import javax.validation.ValidatorFactory;
import java.security.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author pinkd
 */
@WebServlet(name = "RegisterControl", urlPatterns = {"/register"})
public class RegisterController extends HttpServlet {

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
            out.println("<title>Servlet RegisterControl</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterControl at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
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
        String email = request.getParameter("email");
        if (new UserDao().checkUserExist(email)) {
            String ms = "T??i kho???n ???? t???n t???i";
            request.setAttribute("error", ms);
            request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
        } else {
            String password = request.getParameter("password");
            String rePassword = request.getParameter("repassword");
            if (password.equals(rePassword) == false) {
                String ms = "M???t kh???u kh??ng tr??ng kh???p";
                request.setAttribute("error", ms);
                request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
            } else {
                String hashText = null;
                try {
                    MessageDigest md = MessageDigest.getInstance("MD5");

                    // digest() method is called to calculate message digest
                    //  of an input digest() return array of byte
                    byte[] messageDigest = md.digest(password.getBytes());

                    // Convert byte array into signum representation
                    BigInteger no = new BigInteger(1, messageDigest);

                    // Convert message digest into hex value
                    hashText = no.toString(16);
                    while (hashText.length() < 32) {
                        hashText = "0" + hashText;
                    }
                } catch (NoSuchAlgorithmException ex) {
                    Logger.getLogger(RegisterController.class.getName()).log(Level.SEVERE, null, ex);
                }
                String name = request.getParameter("name");
                String phone = request.getParameter("phone");
                Date createDate = new Date(System.currentTimeMillis());

                User user = new User(0, email, hashText, Role.USER.getId(), createDate, false);
                int userId = new UserDao().insertUser(user);

                UserDetail userDetail = new UserDetail(userId, name, phone, "", "", "");
                new UserDao().insertUserDetail(userDetail);

                response.sendRedirect("login");
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
