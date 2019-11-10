package com.gx.servlet.InsertBook;

import java.io.IOException;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gx.dao.UserDao;
import com.gx.dao.impl.ImplUserDao;
import com.gx.po.NewBook;

public class InsertBook extends HttpServlet {
 
	

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
		resp.setContentType("text/html,charser=utf-8");
        String sta = req.getParameter("aaa");
       
        NewBook book=new NewBook();
       String str2[]= sta.split("/");
       for (int i = 0; i < str2.length; i++) {
    	   String str[]= str2[i].split(",");
    	   book.setBookMC(str[0]);
           book.setAuthorName(str[1]);
           book.setPressName(str[2]);
           SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");  
    		Date dt;
    		Date dt2;
    		try {
    			dt = sdf.parse(str[3]);
    			dt2 = sdf.parse(str[4]);
    			  book.setPublicationDate(dt);
    			  book.setRecordDate(dt2);
    		} catch (ParseException e) {
    			// TODO Auto-generated catch block
    			e.printStackTrace();
    		}
    		book.setLocation(str[5]);
    		book.setPrice(str[6]);
    		
    		book.setState(0);
    		book.setEvaluate(0);
    		book.setBrcount(0);
    		book.setClassID(Integer.parseInt(str[9]));
    		Image.image=str[8];
    		  UserDao dao=new ImplUserDao();
    	        dao.inserBook(book);
	} 
       // System.out.println(sta);
	}
}
