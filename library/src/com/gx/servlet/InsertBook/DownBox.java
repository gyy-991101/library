package com.gx.servlet.InsertBook;

import java.io.IOException;
import java.io.PrintWriter;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.gx.dao.UserDao;
import com.gx.dao.impl.ImplUserDao;
import com.gx.po.BookClass;

public class DownBox extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		doPost(request, response);
		
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
	
		response.setContentType("application/json; charset=UTF-8");
		
		UserDao dao=new ImplUserDao();
		List<BookClass> users=dao.findBookClass();
		JSONObject json = new JSONObject();
		JSONArray jsonArray=new JSONArray();

		if(users!=null && users.size()>0){
			//添加时间转换器
			jsonArray.addAll(users);
			json.put("count", users.size());
			json.put("data",jsonArray);
		}else{
			//没有查询到数据
			json.put("count", 0);
		}
		PrintWriter out=response.getWriter();
		out.write(json.toString());
	
	}
}
