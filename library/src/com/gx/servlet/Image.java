package com.gx.servlet;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gx.util.DButil;


public class Image extends HttpServlet {
@Override
protected void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
	try {
		Class.forName("com.mysql.jdbc.Driver");
	} catch (ClassNotFoundException e) 
	{
		
		e.printStackTrace();
	}
	 int id = 1;
	  try
	  {
	   id = Integer.parseInt(request.getParameter("id"));
	  }
	  catch(NumberFormatException e)
	  {
	   id = 1;
	  }
	  String sql = "select picture from bookiinventory where BookID=" + id;
	  Connection conn;
	  Statement stmt;
	try {
		conn = DButil.getConnection();
		stmt = conn.createStatement();
		 ResultSet rs = null;
		  ServletOutputStream sout = null;
		  try
		  {
		   rs=stmt.executeQuery(sql);
		   if(rs.next())
		   {
		    sout = response.getOutputStream();
		    InputStream in = rs.getBinaryStream(1);
		    byte b[] = new byte[0x7a120];
		    in.read(b);
		    sout.write(b);
		    sout.flush();
		    sout.close();
		   }
		  }
		  catch(Exception e)
		  {
		   e.printStackTrace();
		  }
		  finally
		  {
		  DButil.colseAll(conn,stmt, rs);
		  }
	} catch (SQLException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}	
	
}
@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	super.doGet(request, response);
		
	}
}
