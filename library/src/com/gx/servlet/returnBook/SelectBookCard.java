package com.gx.servlet.returnBook;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.gx.dao.BookDao;
import com.gx.dao.impl.ImplBookDao;
import com.gx.po.BookName;
import com.gx.po.LibraryCard;
import com.gx.po.LibraryCard2;

public class SelectBookCard  extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		super.doPost(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		//
		req.setCharacterEncoding("utf-8");
		resp.setContentType("application/json; charset=UTF-8");
		BookDao findAllBook=new ImplBookDao();
		List<LibraryCard2> users= findAllBook.SelectallBookCard();
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
