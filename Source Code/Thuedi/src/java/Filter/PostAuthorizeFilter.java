/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Filter;

import DAO.PostDao;
import Model.Post;
import Model.Role;
import Model.User;
import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class PostAuthorizeFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;
        
        if(request.getParameter("id") == null || request.getSession().getAttribute("user") == null) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN);
            return;
        }
        
        User user = (User) request.getSession().getAttribute("user");
        int id = Integer.parseInt(request.getParameter("id"));
        Post post = new PostDao().select(id);
        
        if(post == null || (post.getUserId() != user.getId() && user.getRoleId() != Role.ADMIN.getId())) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN);
            return;
        }
        
        chain.doFilter(req, res);
    }

    @Override
    public void destroy() {
    }
    
    
    
}
