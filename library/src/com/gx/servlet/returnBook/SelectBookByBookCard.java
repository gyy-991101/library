package com.gx.servlet.returnBook;

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
import com.gx.po.Users;

public class SelectBookByBookCard extends HttpServlet{

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
		BookDao bookDao=new ImplBookDao();
		List<Users> pfuser= (List<Users>) request.getSession().getAttribute("user");
		int ida=pfuser.get(0).getUsersID();
		bookDao.selectCount(pfuser.get(0).getUsersID());
		boolean b=false;
		if(request.getParameter("type")!=null)
		{
			System.out.println(request.getParameter("type"));
			if(request.getParameter("type").equals("NextPage"))
			{
				Paging.pageNumbe=Paging.pageNumbe+Paging.pageSize;
				b=true;
			}
			
			if(request.getParameter("type").equals("LastPage"))
			{
				Paging.pageNumbe=Paging.pageNumbe-Paging.pageSize;
				b=true;
			}
			
			/*if(request.getParameter("type").equals("First"))
			{
				Paging.pageNumbe=0;
			}*/
		}
		if(Paging.pageNumbe<0 || (Paging.pageNumbe>=Paging.AllCount)&& Paging.AllCount>1 )
		{
			JSONObject json = new JSONObject();
			if(Paging.pageNumbe<0)
			{
				json.put("count", 0);
				Paging.pageNumbe=Paging.pageNumbe+Paging.pageSize;
				json.put("data", "已经是首页");
			}
			if(Paging.pageNumbe>=Paging.AllCount)
			{
				json.put("count", 0);
				Paging.pageNumbe=Paging.pageNumbe-Paging.pageSize;
				json.put("data", "已经是尾页");
			}
			
			PrintWriter out=response.getWriter();
			out.write(json.toString());
		}
		else{
if(b=false)
{
	Paging.pageNumbe=0;
}

		String BookName= request.getParameter("BookCardID");//通过借书证来查询已经借的书本
	    List<NewBook> users=bookDao.findByBookCard(BookName);
	    JSONObject json = new JSONObject();
		JSONArray jsonArray=new JSONArray();
		JsonConfig config = new JsonConfig();
		config.registerJsonValueProcessor(
				Date.class,
				new JsonValueProcessor(){
					@Override
					public Object processObjectValue(String key,
							Object value, JsonConfig config) {
						  	String str = new SimpleDateFormat("yyyy-MM-dd").format((java.util.Date) value);
		                    return str;
					}
					
					@Override
					public Object processArrayValue(Object arg0,
							JsonConfig arg1) {
						return null;
					}
				});
	
		if(users!=null && users.size()>0){
			//添加时间转换器
			jsonArray.addAll(users,config);
			json.put("count", users.size());
			json.put("row", Paging.pageNumbe);
			json.put("data",jsonArray);
		}
		else
		{
			//没有查询到数据
			json.put("count", 0);
		}
		//System.out.println(Paging.pageNumbe);
		PrintWriter out=response.getWriter();
		out.write(json.toString());
		}
	}
}
