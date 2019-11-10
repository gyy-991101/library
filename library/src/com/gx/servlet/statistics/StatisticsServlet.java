package com.gx.servlet.statistics;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.gx.dao.BookDao;
import com.gx.dao.impl.ImplBookDao;
import com.gx.po.BookClass;
import com.gx.po.BookClass2;
import com.gx.po.NewBook;

public class StatisticsServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
	req.setCharacterEncoding("utf-8");
	resp.setContentType("application/json; charset=UTF-8");
	BookDao dao=new  ImplBookDao();
	List<BookClass2> users=dao.SelectBookClass();
	JSONObject json = new JSONObject();
	JSONObject json2 = new JSONObject();
	JSONArray jsonArray=new JSONArray();
	JSONArray jsonArray2=new JSONArray();
	int a=0;
	int q=-1;
	
for (BookClass2 bookClass2 : users) 
{
	System.out.println(bookClass2.getName());
	List<NewBook> l= dao.SelectBook(bookClass2.getName());
	
	List<Object> li=new ArrayList<Object>();
	json.remove(json);
	json.clear();
	jsonArray.removeAll(jsonArray);
	jsonArray2.removeAll(jsonArray2);
	for(int i=0;i<li.size();i++) 
	{  
		li.remove(i);  
	}
	for (int i = 0; i < l.size(); i++) 
	{
		li.clear();
		li.add(l.get(i).getBookMC());
		li.add(l.get(i).getBrcount());
		jsonArray2.add(li);
	}
	if(l!=null && l.size()>0)
	{
		//添加时间转换器
		jsonArray.addAll(jsonArray2);
		json.put("name",bookClass2.getName());
		json.put("id",bookClass2.getName());
		json.put("data",jsonArray);
	}
	else
	{
		//没有查询到数据
		json.put("count", 0);
	}
	q++;
	//json2.element(name2, json);
	json2.element(q+"", json);
	json2.put("length", q+1);
	
}
PrintWriter out=resp.getWriter();
out.write(json2.toString());
	}
}
