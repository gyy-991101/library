package com.gx.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.gx.po.Users;


public class LoginChkFilter implements Filter {

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}
	@Override
	public void doFilter(ServletRequest request, ServletResponse response,FilterChain chain) throws IOException, ServletException {
		// 获得在下面代码中要用的request,response,session对象     request.getSession().setAttribute("user", user);
        HttpServletRequest servletRequest = (HttpServletRequest) request;
        HttpServletResponse servletResponse = (HttpServletResponse) response;
        HttpSession session = servletRequest.getSession();
        // 获得用户请求的URI
        String path = servletRequest.getRequestURI();
       // Users pfuser = (Users) session.getAttribute("user");
        List<Users> pfuser =(List<Users>) session.getAttribute("user");
        System.out.println(pfuser);
        // 登陆页面无需过滤
        if(path.indexOf("JSP/Login.jsp") > -1 || path.indexOf("LoginServlet")>-1||path.indexOf("Image")>-1)
        {
            chain.doFilter(servletRequest, servletResponse);
            return;
        }   
       
        if (pfuser == null) 
        {
            // 跳转到登陆页面
            servletResponse.sendRedirect(servletRequest.getContextPath()+"/JSP/BookCard.jsp");
           } 
        else 
        {
            // 已经登陆,继续此次请求
            chain.doFilter(request, response);
        }
		
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}

	


}
