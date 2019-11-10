package com.gx.servlet.BorrowBooks;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gx.dao.BookDao;
import com.gx.dao.impl.ImplBookDao;
import com.gx.po.NewBook;
import com.gx.po.Users;

public class BorrowBooksServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String type=request.getParameter("type");
		request.getSession().setAttribute("typeID", type);
		BookDao dao= new ImplBookDao();
		//获取到图书id等信息
		List<NewBook> list=dao.findByID(Integer.parseInt(type));
		request.setAttribute("list", list);
		List<Users> pfuser =(List<Users>) request.getSession().getAttribute("user");
		
		//在servlet层调用service逻辑处理层
		BookDao bookDao=new ImplBookDao();
		List<NewBook> listAll=	bookDao.findAllBook();
		List<String> Str=new  ArrayList<String>();
		for (NewBook newBook : listAll) 
		{
			Str.add(newBook.getBookMC());
		}
		List<String> Str2=new  ArrayList<String>();
		List<NewBook> list2 =bookDao.findBorrowAllBookByUserID(pfuser.get(0).getUsersID());
			
			for (NewBook newBook : list2) 
			{
				Str2.add(newBook.getBookMC());
			}
			List<String> ListStr=new  ArrayList<String>();
        for(String str1 : Str){ 
            if(!list2.contains(str1)){ 
            	if(str1!=null)
            	{
              //  System.out.println("ArrayList2里没有的是==>" + str1); 
            	ListStr.add(str1);
            	}
            } 
        }
			
			List<NewBook> ListLike=new ArrayList<NewBook>();
				//下一步，进行与没有读过的书对比
			
			 ListLike=bookDao.SelectEvaluateByBookname(list.get(0).getBookMC());
			List<NewBook> similarityList=new ArrayList<NewBook>();
			double y=0;
			for (String string : ListStr) 
			{
				y=0;
				int bookID=0;
				 List<NewBook> liste=bookDao.SelectEvaluateByBookname(string.toString());
				 int k=0;
				 for (int g = 0; g <ListLike.size(); g++) 
				 {
					 for (int j = 0; j < liste.size(); j++) 
					 {		
			//if(ListLike.get(i).getBookMC().equals(liste.get(j).getBookMC()))
			if(liste.get(j).getUsersID()==ListLike.get(g).getUsersID())
			{ 
				k++;
				System.out.println("书名: "+liste.get(j).getBookMC());
				System.out.println("***评分1："+ListLike.get(g).getEvaluate());
				System.out.println("***评分2："+liste.get(j).getEvaluate());
				y +=(ListLike.get(g).getEvaluate()-liste.get(j).getEvaluate())*(ListLike.get(g).getEvaluate()-liste.get(j).getEvaluate());
				System.out.println("第"+k+"次评分："+ y);
				bookID=liste.get(j).getBookID();
			}
		}
	}
				 if(k>0)
				 {
				 NewBook e=new NewBook();
				 e.setBookMC(string);
				 e.setBookID(bookID);
				 e.setSimilarity(1/(1+ Math.sqrt(y)));
				 similarityList.add(e); 
				System.out.println("书名:"+string+" 评价：" +(1/(1+ Math.sqrt(y)))+"书本ID："+bookID);
				 }
			}
			Collections.sort(similarityList, new Comparator<NewBook>(){
				@Override
				public int compare(NewBook o1, NewBook o2) {
					//按照学生的年龄进行升序排列
					if(o1.getSimilarity() < o2.getSimilarity()){
						return 1;
					}
					if(o1.getSimilarity() == o2.getSimilarity()){
						return 0;
					}
					return -1;
				}
			}); 
		request.setAttribute("List2",similarityList);
		request.getRequestDispatcher("/JSP/details.jsp").forward(request, response);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub /library/JSP/details.jsp
		doGet(req, resp);
		
	}
}
