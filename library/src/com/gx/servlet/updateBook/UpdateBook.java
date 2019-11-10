package com.gx.servlet.updateBook;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import com.gx.common.BaseBook;
import com.gx.dao.BookDao;
import com.gx.dao.impl.ImplBookDao;
import com.gx.po.NewBook;

public class UpdateBook extends HttpServlet {

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
	String updateClass=	req.getParameter("updateClass");
	String updateBookMC=req.getParameter("updateBookMC");
	String updateauthorName=req.getParameter("updateauthorName");
	String updatePressName=req.getParameter("updatePressName");
	String updatepublicationDate=req.getParameter("updatepublicationDate");
	String updaterecordDate=req.getParameter("updaterecordDate");
	String updatelocation=req.getParameter("updatelocation");
	String updateprice=req.getParameter("updateprice");
	String UpdateID=req.getParameter("UpdateID");
	
	BookDao bookDao=new ImplBookDao();
	NewBook t=new NewBook();
	 t.setBookMC(updateBookMC);
	 t.setClassID(Integer.parseInt(updateClass));
	 t.setAuthorName(updateauthorName);
	 t.setPressName(updatePressName);
	 SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd");
	Date dt;
	Date dt2;
	try {
		dt = dateFormat.parse(updatepublicationDate);
		 dt2= dateFormat.parse(updaterecordDate);
		 t.setPublicationDate(dt);
		 t.setRecordDate(dt2);
	} catch (ParseException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	t.setLocation(updatelocation);
	t.setPrice(updateprice);
	t.setBookID(Integer.parseInt(UpdateID));
	int k= bookDao.updateRowBook(t);
	 JSONObject json = new JSONObject();
		if(k>0)
		{
			
			 json.put("data","成功");
		}
		else{
			 json.put("data","失败");
		}
		PrintWriter out=resp.getWriter();
		out.write(json.toString());
	}
}
