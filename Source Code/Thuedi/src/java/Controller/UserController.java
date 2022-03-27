/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.UserDao;
import Model.User;
import Model.UserDetail;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author AnhPT
 */
@WebServlet(name = "UserController", urlPatterns = {"/userDetail"})
public class UserController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User account = (User) session.getAttribute("user");
        int id = account.getId();
        User user = new UserDao().select(id);
        UserDetail info = new UserDao().userInfo(id);

        request.setAttribute("user", user);
        request.setAttribute("info", info);

        request.getRequestDispatcher("/WEB-INF/userDetail.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User account = (User) session.getAttribute("user");
        int id = account.getId();
        String password = request.getParameter("password");
        String rePassword = request.getParameter("rePassword");
        if (password.equals(rePassword) == false) {
            String ms = "Mật khẩu không trùng khớp";
            request.setAttribute("error", ms);
            request.getRequestDispatcher("/WEB-INF/userDetail.jsp").forward(request, response);
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

            new UserDao().updatePw(id, hashText);
            request.getRequestDispatcher("/WEB-INF/userDetail.jsp").forward(request, response);
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
