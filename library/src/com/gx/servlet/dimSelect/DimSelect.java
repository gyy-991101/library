package com.gx.servlet.dimSelect;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
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
import net.sf.json.processors.JsDateJsonBeanProcessor;
import net.sf.json.processors.JsonValueProcessor;



import com.gx.dao.BookDao;
import com.gx.dao.impl.ImplBookDao;
import com.gx.po.NewBook;
import com.gx.servlet.returnBook.Paging;

public class DimSelect extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doGet(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=UTF-8");
		BookDao bookDao=new ImplBookDao();//声明对象
		bookDao.selectCountByDim();//查询书本数量
		boolean b=false;
		if(request.getParameter("type")!=null)
		{
			System.out.println(request.getParameter("type"));
			if(request.getParameter("type").equals("NextPage"))
			{
				DimPaging.DimpageNumbe=DimPaging.DimpageNumbe+DimPaging.DimpageSize;
				b=true;
				System.out.println(b+"1");
				//alert("true");
			}
			if(request.getParameter("type").equals("LastPage"))
			{
				DimPaging.DimpageNumbe=DimPaging.DimpageNumbe-DimPaging.DimpageSize;
				b=true;
				System.out.println(b+"2");
			}
			/*if(request.getParameter("type").equals("First"))
			{
				Paging.pageNumbe=0;
			}*/
		}
		if(DimPaging.DimpageNumbe<0 || DimPaging.DimpageNumbe>DimPaging.DimAllCount- DimPaging.DimpageSize)
		{
			JSONObject json = new JSONObject();
			if(DimPaging.DimpageNumbe<0)
			{
				json.put("count", 0);
				DimPaging.DimpageNumbe=DimPaging.DimpageNumbe+DimPaging.DimpageSize;
				json.put("data", "已经是首页");
			}
			if(DimPaging.DimpageNumbe>DimPaging.DimAllCount- DimPaging.DimpageSize)
			{
				json.put("count", 0);
				DimPaging.DimpageNumbe=DimPaging.DimpageNumbe-DimPaging.DimpageSize;
				json.put("data", "已经是尾页");
			}
			
			PrintWriter out=response.getWriter();
			out.write(json.toString());
		}
		else{
			if(b==false)
			{
				DimPaging.DimpageNumbe=0;
			}
		String otxt= request.getParameter("otxt").toString().trim();//参数：书名
		String otxt2= request.getParameter("otxt2").toString().trim();//参数：作者
		String otxt3= request.getParameter("otxt3").toString().trim();//参数：位置
		String otxt4= request.getParameter("otxt4").toString().trim();//参数：状态
		if("".equals(otxt))
		{
		}
		else
		{
			ImplBookDao.otxt=otxt;
		}
		if("".equals(otxt2))
		{
		}
		else
		{
			ImplBookDao.otxt2=otxt2;
		}
		if("".equals(otxt3))
		{	
		}
		else{
			ImplBookDao.otxt3=otxt3;
		}
		if("".equals(otxt4))
		{
			
		}
		else{
			ImplBookDao.otxt4=otxt4;
		}
		if("".equals(otxt)&& "".equals(otxt2)&&"".equals(otxt3)&&"".equals(otxt4))
		{
			ImplBookDao.otxt="";
			ImplBookDao.otxt2="";
			ImplBookDao.otxt3="";
			ImplBookDao.otxt4="";
		}
	    List<NewBook> users=bookDao.findByDim();
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
		                    return str; //
					}
					@Override
					public Object processArrayValue(Object arg0,
							JsonConfig arg1) {
						return null;
					}
				});
		
		if(users!=null && users.size()>0){
			//添加时间转换器
			jsonArray.addAll(users);//config
			json.put("count", users.size());
			json.put("row", DimPaging.DimpageNumbe);
			json.put("data",jsonArray);
		}else{
			//没有查询到数据
			json.put("count", 0);
		}
		PrintWriter out=response.getWriter();
		out.write(json.toString());
		}
	}
}
