package com.gx.servlet.BorrowBooks;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import net.sf.json.JSONObject;

import com.gx.common.BaseBook;
import com.gx.dao.BookDao;
import com.gx.dao.impl.ImplBookDao;
import com.gx.po.BorrowBook;
import com.gx.po.NewBook;
import com.gx.po.Users;

public class BookCardVerification extends HttpServlet {

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
		List<Users> pfuser= (List<Users>) req.getSession().getAttribute("user");
		int ida=pfuser.get(0).getUsersID();
		  JSONObject json = new JSONObject();
	int bookcount=bookDao.selectCount(pfuser.get(0).getUsersID());
	if(bookcount>=5)
	{
		 json.put("data","借书数目大于5");
	}
	else{
	List<Users> list=(List<Users>) req.getSession().getAttribute("user");
	System.out.println(list.get(0).getLibraryCard()); 
    System.out.println(req.getParameter("BookCardID"));
  
    if(list.get(0).getLibraryCard().equals(req.getParameter("BookCardID")))
    {
    	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
    	 Date date = new Date();
    	 Date date2 = new Date();
    	//System.out.println(df.format(date));// new Date()为获取当前系统时间
    	
    	 Calendar calendar = Calendar.getInstance();
         calendar.setTime(date);
         calendar.add(Calendar.MONTH, +1);//+1今天的时间加一天
         date2 = calendar.getTime();
     	//System.out.println(df.format(date));// new Date()为获取当前系统时间
     	BorrowBook b=new BorrowBook();
     	b.setUserID(list.get(0).getUsersID());
     	b.setDate(date);
     	b.setReturnDete(date2);
     	b.setCost("0");
     	if(req.getSession().getAttribute("typeID")!=null)
     	{
     		b.setBookCardID(Integer.parseInt((String) req.getSession().getAttribute("typeID")));	
     	}
     	else
     	{
     		b.setBookCardID(Integer.parseInt((String) req.getParameter("typeID")));	
     	}
     	b.setEvaluate(0);
     	b.setFreeDate(date2);
     	//BookDao bookDao=new ImplBookDao();
     int i=	bookDao.insetBorrowRowBook(b);
     if(i>0)
     {	
    	 NewBook  t=new NewBook();
         if(req.getSession().getAttribute("typeID")!=null)
      	{
        	 t.setBookID(Integer.parseInt((String) req.getSession().getAttribute("typeID")));
      	}
      	else{
      		 t.setBookID(Integer.parseInt((String) req.getParameter("typeID")));
      	}
    	 bookDao.updateBookCount(t);
    	 json.put("data","成功");
     }
     else
     {
    	 json.put("data","失败");
     }
    }
    else
    {
    	json.put("data","失败");
    }
	
	
	}
	PrintWriter out=resp.getWriter();
	out.write(json.toString());
	}
}
