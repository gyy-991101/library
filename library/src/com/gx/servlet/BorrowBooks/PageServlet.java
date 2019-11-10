package com.gx.servlet.BorrowBooks;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gx.dao.BookDao;
import com.gx.dao.impl.ImplBookDao;
import com.gx.po.BorrowBook;
import com.gx.po.NewBook;
import com.gx.po.Users;
import com.gx.servlet.myRecord.Page;

public class PageServlet extends HttpServlet {
@Override
protected void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html,charser=utf-8");
	String page= request.getParameter("page");
	 BookDao bookDao=new ImplBookDao();
     bookDao.selectAllCountByBorrow();
     if(request.getParameter("BookName")!=null)
     {
     	ImplBookDao.select=request.getParameter("BookName");
     
     }
	if(request.getParameter("page")!=null)
	{
		System.out.println(request.getParameter("page"));
			if(request.getParameter("page").equals("Next"))
			{
				PageByBorrow.DimpageNumbe=PageByBorrow.DimpageNumbe+PageByBorrow.DimpageSize;
				PageByBorrow.DimpageRow++;
			}
			if(request.getParameter("page").equals("Last"))
			{
				PageByBorrow.DimpageNumbe=PageByBorrow.DimpageNumbe-PageByBorrow.DimpageSize;
				PageByBorrow.DimpageRow--;
			}
	}
	if(PageByBorrow.DimpageNumbe<0 || PageByBorrow.DimpageNumbe>PageByBorrow.DimAllCount)
	{
		
		
		if(PageByBorrow.DimpageNumbe<0)
		{
			PageByBorrow.DimpageRow++;
			PageByBorrow.DimpageNumbe=PageByBorrow.DimpageNumbe+PageByBorrow.DimpageSize;
		
		}
		if(PageByBorrow.DimpageNumbe>PageByBorrow.DimAllCount- PageByBorrow.DimpageSize)
		{
			PageByBorrow.DimpageRow--;
			PageByBorrow.DimpageNumbe=PageByBorrow.DimpageNumbe-PageByBorrow.DimpageSize;
		}
	}
		//  int id= pfuser.get(0).getUsersID();
		     BookDao dao=new ImplBookDao();
			List<NewBook> t=dao.findBorrowAllBook();
			request.setAttribute("List", t);
		   request.getRequestDispatcher("/JSP/BorrowBooks.jsp").forward(request, response);

}
@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
	  /*  BookDao dao=new ImplBookDao();
		List<NewBook> t=dao.findBorrowAllBook();
		request.setAttribute("List", t);
		转化操作，携带数据
	   request.getRequestDispatcher("/JSP/BorrowBooks.jsp").forward(request, response);*/
	}
}
