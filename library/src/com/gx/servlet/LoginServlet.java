package com.gx.servlet;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;


import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Cookie;

import com.gx.dao.UserDao;
import com.gx.dao.impl.ImplUserDao;
import com.gx.util.DButil;


public class LoginServlet extends HttpServlet {
	private ServletConfig config=null;
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
    }

   
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String Driver= config.getInitParameter("Driver");
		System.out.println(Driver);
		
		DButil.UserName=config.getInitParameter("UserName");
		DButil.password=config.getInitParameter("password");
		DButil.url=config.getInitParameter("url");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html,charser=utf-8");
		String codekey=request.getParameter("codekey");
		
        String token1=request.getParameter("token");
   
		UserDao dao=new ImplUserDao();
		String mes=null;
		String userName=request.getParameter("Username");
		String password=request.getParameter("Password");
		List list= dao.findByNameAndpassword(userName, password);
		if(list.size()>0)
		{
		request.getSession().setAttribute("user", list);
			mes="登录成功";	
			if( request.getParameter("background")!=null)
			{
				
			
			if( request.getParameter("background").equals("background"))
			{
				request.getRequestDispatcher("/backgroundJSP/BackgroundMain.jsp").forward(request, response);
			}
			else
			{
				request.getRequestDispatcher("/JSP/Main.jsp").forward(request, response);
			}
			}
			else{
				request.getRequestDispatcher("/JSP/Main.jsp").forward(request, response);
			}
		}
		else
		{
			mes="登录失败";
			request.getRequestDispatcher("/JSP/Login.jsp").forward(request, response);
		}
		request.setAttribute("mes", mes);
		
	}
	@Override
	public void init(ServletConfig config) throws ServletException {
		this.config=config;
	}
}
