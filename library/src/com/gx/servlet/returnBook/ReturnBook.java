package com.gx.servlet.returnBook;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import com.gx.dao.BookDao;
import com.gx.dao.impl.ImplBookDao;
import com.gx.po.BorrowBook;
import com.gx.po.NewBook;

public class ReturnBook extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doGet(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		 req.setCharacterEncoding("utf-8");
			resp.setContentType("application/json; charset=UTF-8");
			String BookID=req.getParameter("BooKID");
			String NewBooKID=req.getParameter("NewBooKID");
			BookDao bookDao=new ImplBookDao();
			BorrowBook b=new BorrowBook();
			Date date=new Date();
			b.setReturnDete(date);
			String IcostF= req.getParameter("IcostF");
			b.setCost(IcostF);
			
			b.setBorrowBooksID(Integer.parseInt(BookID) );
		  int k=bookDao.updateborrowBook(b);
		  
		 JSONObject json = new JSONObject();
		if(k>0)
		{
			NewBook t=new NewBook();
			t.setBookID(Integer.parseInt(NewBooKID));
		int k2=	bookDao.updateBookstate(t);
		if(k2>0)
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
