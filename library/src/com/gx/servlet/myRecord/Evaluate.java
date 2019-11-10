package com.gx.servlet.myRecord;

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

public class Evaluate extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=UTF-8");
	String Evaluatenumber=request.getParameter("Evaluatenumber");
	String borrowBooksID=request.getParameter("borrowBooksID");
	BookDao dao=new ImplBookDao();
	BorrowBook b=new BorrowBook();
	 b.setEvaluate(Integer.parseInt(Evaluatenumber));
	 b.setBorrowBooksID(Integer.parseInt(borrowBooksID));
	int k= dao.updateBookEvaluate(b);

	JSONObject json = new JSONObject();
	 if(k>0)
	 {
		 json.put("data", "成功");
	 }
	 else
	 {
		 json.put("count", "失败");
	 }
	 PrintWriter out=response.getWriter();
		out.write(json.toString());
	}
}
