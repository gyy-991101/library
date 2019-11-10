package com.gx.servlet.myRecord;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import com.gx.dao.BookDao;
import com.gx.dao.UserDao;
import com.gx.dao.impl.ImplBookDao;
import com.gx.dao.impl.ImplUserDao;
import com.gx.po.BorrowBook;
import com.gx.po.Users;
import com.gx.servlet.dimSelect.DimPaging;

public class MyRecord extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html,charser=utf-8");
		String page= request.getParameter("page");
		 BookDao bookDao=new ImplBookDao();
	       List<Users> pfuser=(List<Users>) request.getSession().getAttribute("user");
	 bookDao.selectAllCount(pfuser.get(0).getUsersID());
		if(request.getParameter("page")!=null)
		{
			System.out.println(request.getParameter("page"));
				if(request.getParameter("page").equals("Next"))
				{
					Page.DimpageNumbe=Page.DimpageNumbe+Page.DimpageSize;
					Page.DimpageRow++;
				}
				if(request.getParameter("page").equals("Last"))
				{
					Page.DimpageNumbe=Page.DimpageNumbe-Page.DimpageSize;
					Page.DimpageRow--;
				}
		}
		if(Page.DimpageNumbe<0 || Page.DimpageNumbe>Page.DimAllCount)
		{
			
			
			if(Page.DimpageNumbe<0)
			{
				Page.DimpageRow++;
				Page.DimpageNumbe=Page.DimpageNumbe+Page.DimpageSize;
			
			}
			if(Page.DimpageNumbe>Page.DimAllCount- Page.DimpageSize)
			{
				Page.DimpageRow--;
				Page.DimpageNumbe=Page.DimpageNumbe-Page.DimpageSize;
				
			}
		
		}

			  int id= pfuser.get(0).getUsersID();
			  System.out.println("用户ID="+id);
			   List<BorrowBook> list =bookDao.findByMyRecord(id) ; 
			   request.setAttribute("List", list);
			   request.getRequestDispatcher("/JSP/MyRecord.jsp").forward(request, response);
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		super.doGet(request, response);
	}
}
