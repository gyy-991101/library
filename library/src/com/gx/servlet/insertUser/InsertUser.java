package com.gx.servlet.insertUser;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import com.gx.dao.UserDao;
import com.gx.dao.impl.ImplUserDao;
import com.gx.po.LibraryCard;
import com.gx.po.Users;

public class InsertUser extends HttpServlet{

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
		//account:account,password:password,mail:mail,phone:phone,UserName:UserName,Sex:Sex
		UserDao dao=new ImplUserDao();
		//获取到用户信息
		Users users=new Users();
		users.setAccountNumber(req.getParameter("account"));
		users.setPassword(req.getParameter("password"));
		users.setPhone(req.getParameter("phone"));
		users.setName(req.getParameter("UserName"));
		users.setSex(req.getParameter("Sex"));
		int k= dao.insetRow(users);
		 JSONObject json = new JSONObject();
		if(k>0)
		{
			LibraryCard L=new LibraryCard();
			L.setLibraryCard("jieshu"+k);
			L.setUsersID(k);
			int y= dao.inserLibraryCard(L);
			if(y>0)
			{
				json.put("data","成功");
			}
			else{
				json.put("data","失败");
			}
		}
		else{
			json.put("data","失败");
		}
		PrintWriter out=resp.getWriter();
		out.write(json.toString());
	}
}
