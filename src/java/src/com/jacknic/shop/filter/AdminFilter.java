package com.jacknic.shop.filter;

import com.jacknic.shop.Entity.UserEntity;
import org.springframework.web.filter.OncePerRequestFilter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 管理员状态过滤器
 */
public class AdminFilter extends OncePerRequestFilter {
    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {
        /*如果用户尚未登录，则跳转到登录界面*/
        UserEntity userEntity = (UserEntity) request.getSession().getAttribute("user");
        if (userEntity == null) {
            StringBuffer requestURL = request.getRequestURL();
            response.sendRedirect(request.getContextPath() + "/verify/login?returnURL=" + requestURL);
            return;
        } else {
            if (userEntity.getGroupId() != 1) {
                //如果不是管理员组成员、则跳转回首页
                request.setAttribute("html_title", "用户权限不足，无法进入管理系统");
                request.setAttribute("error_title", "用户权限不足，无法进入管理系统");
                request.setAttribute("error_msg", "您的账号不属于管理员账号，因此不能进入后台管理系统！");
                request.getRequestDispatcher("/WEB-INF/view/error_default.jsp").forward(request, response);
            }
        }
        filterChain.doFilter(request, response);
    }

}
