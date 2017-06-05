package com.jacknic.shop.filter;

import org.springframework.web.filter.OncePerRequestFilter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 用户状态过滤器
 */
public class UserFilter extends OncePerRequestFilter {
    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {
        /*如果用户尚未登录，则跳转到登录界面*/
        Object user = request.getSession().getAttribute("user");
        if (user == null) {
            StringBuffer requestURL = request.getRequestURL();
            response.sendRedirect(request.getContextPath() + "/verify/login?returnURL=" + requestURL);
            return;
        }
        filterChain.doFilter(request, response);
    }

}
