package com.gx.servlet.statistics;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Dictionary;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.sf.json.processors.JsonValueProcessor;

import com.gx.dao.BookDao;
import com.gx.dao.UserDao;
import com.gx.dao.impl.ImplBookDao;
import com.gx.dao.impl.ImplUserDao;
import com.gx.po.BookClass;
import com.gx.po.BookClass2;
import com.gx.servlet.dimSelect.DimPaging;

public class Statistics extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException 
	{
		req.setCharacterEncoding("utf-8");
		resp.setContentType("application/json; charset=UTF-8");
	BookDao dao=new  ImplBookDao();
	List<BookClass2> users=dao.SelectBookClass();
	JSONObject json = new JSONObject();
	JSONArray jsonArray=new JSONArray();
		if(users!=null && users.size()>0)
		{
			//添加时间转换器
			jsonArray.addAll(users);
			json.put("data",jsonArray);
		}
		else
		{
			//没有查询到数据
			json.put("count", 0);
		}
		PrintWriter out=resp.getWriter();
		out.write(json.toString());
	}
	 
}
