package com.gx.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DButil {
	public static String Driver;
	public static String url;
	public static String password;
	public static String UserName;

	static {
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) 
		{	
			e.printStackTrace();
		}
	}
public static Connection getConnection() throws SQLException
{
	return DriverManager.getConnection("jdbc:mysql://localhost:3306/11","root","123456");
}
public static void colseAll(Connection conn,Statement st,ResultSet rs)
{
		try {
			if(conn!=null)
			{
			conn.close();
			}
			if(st!=null)
			{
				st.close();
			}
			if(rs!=null)
			{
				rs.close();
			}
		} catch (SQLException e) 
		{
			e.printStackTrace();
		}
}
public static void colseAll2(Connection conn,PreparedStatement ps,ResultSet rs)
{
		try {
			if(conn!=null)
			{
			conn.close();
			}
			if(ps!=null)
			{
				ps.close();
			}
			if(rs!=null)
			{
				rs.close();
			}
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
}
}
