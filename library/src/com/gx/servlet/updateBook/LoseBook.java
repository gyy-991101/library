package com.gx.servlet.updateBook;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import com.gx.dao.BookDao;
import com.gx.dao.impl.ImplBookDao;
import com.gx.po.BorrowBook;
import com.gx.po.NewBook;

public class LoseBook extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		super.doPost(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
	
		req.setCharacterEncoding("utf-8");
		resp.setContentType("application/json; charset=UTF-8");
		BookDao bookDao=new ImplBookDao();
		NewBook t=new NewBook();
		String UpdateID=req.getParameter("UpdateID");
		t.setBookID(Integer.parseInt(UpdateID));
		int k= bookDao.updateBookstateTOLose(t);
		 JSONObject json = new JSONObject();
			if(k>0)
			{
				if(req.getParameter("BorrowBooksID")!=null)
				{
					BorrowBook b=new BorrowBook();
					
					b.setCost(req.getParameter("BookCost"));
					b.setBorrowBooksID(Integer.parseInt(req.getParameter("BorrowBooksID")));
					int o= bookDao.updateBookCost(b);
					if(o>0)
					{
						 json.put("data","成功");
					}
					else{
						 json.put("data","失败");
					}
				}
				else{
					 json.put("data","成功");
				}
				
				
			}
			else{
				 json.put("data","失败");
			}
			PrintWriter out=resp.getWriter();
			out.write(json.toString());
	}
	
}
