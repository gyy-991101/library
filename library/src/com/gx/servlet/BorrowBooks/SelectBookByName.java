package com.gx.servlet.BorrowBooks;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
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
import com.gx.dao.impl.ImplBookDao;
import com.gx.po.NewBook;

public class SelectBookByName extends HttpServlet{
	@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp)
				throws ServletException, IOException 
				{
			
	//	super.doPost(req, resp);
		}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException 
			{
		request.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=UTF-8");
		//获取查询的条件 书名或者作者
		BookDao bookDao=new ImplBookDao();
		//获取到查询的是书名
		String BookName= request.getParameter("BookName");
	    List<NewBook> users=bookDao.findByBookName(BookName);
	    JSONObject json = new JSONObject();
		JSONArray jsonArray=new JSONArray();
		JsonConfig jsonConfig = new JsonConfig();
  		jsonConfig.registerJsonValueProcessor(java.util.Date.class,new JsonValueProcessor() {
  		            private final String format="yyyy-MM-dd";
  		            public Object processObjectValue(String key, Object value,JsonConfig arg2){
  		              if(value==null)
  		                    return "";
  		              if (value instanceof java.util.Date) {
  		                    String str = new SimpleDateFormat(format).format((java.util.Date) value);
  		                    return str;
  		              }
  		                    return value.toString();
  		            }
  		            public Object processArrayValue(Object value, JsonConfig arg1){
  		                       return null;
  		            }
  		         });
		if(users!=null && users.size()>0){
			//添加时间转换器
			jsonArray.addAll(users,jsonConfig);
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
