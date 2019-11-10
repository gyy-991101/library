package com.gx.dao.impl;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.sql.Connection;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.gx.dao.BookDao;
import com.gx.po.BookClass;
import com.gx.po.BookClass2;
import com.gx.po.BookName;
import com.gx.po.LibraryCard;
import com.gx.po.LibraryCard2;
import com.gx.po.NewBook;
import com.gx.servlet.BorrowBooks.PageByBorrow;
import com.gx.servlet.dimSelect.DimPaging;
import com.gx.servlet.myRecord.Page;
import com.gx.servlet.returnBook.Paging;
import com.gx.util.DButil;


public class ImplBookDao implements BookDao {
	public static String otxt="";
	public static String otxt2="";
	public static String otxt3="";
	public static String otxt4="";
	public static String select="";
	public Connection conn=null;
	public PreparedStatement ps=null;
	public Statement st=null;
	public ResultSet rs=null;
	String SelectAllBook="SELECT BookIinventory.*,BookClass.* FROM BookIinventory JOIN  BookClass ON BookIinventory.ClassID =BookClass.BookClassID ";
	String SelectBookByID="SELECT BookIinventory.*,BookClass.* FROM BookIinventory JOIN  BookClass ON BookIinventory.ClassID =BookClass.BookClassID where BookID=?";
	String BorrowBook="INSERT INTO borrowbooks(userID,BookCardID,date,returnDete,cost,FreeDate,evaluate) VALUES(?,?,?,?,?,?,?)";
	String updatesql="UPDATE bookiinventory SET state=1,Brcount=Brcount+1 WHERE BookID=?";
	String SelectBookByName="SELECT BookIinventory.*,BookClass.* FROM BookIinventory JOIN  BookClass ON BookIinventory.ClassID =BookClass.BookClassID where bookiinventory.BookMC=?";
	String SelectBookByBookCard="SELECT bookiinventory.*,borrowbooks.* FROM (users LEFT JOIN librarycard ON users.usersID=librarycard.usersID)  LEFT JOIN borrowbooks ON users.usersID=borrowbooks.userID LEFT JOIN bookiinventory ON borrowbooks.BookCardID=bookiinventory.BookID WHERE librarycard.libraryCard=? and state=1 group by bookiinventory.BookMC";
	String selectCountsql="SELECT COUNT(DISTINCT bookiinventory.BookMC) COUNT FROM (users LEFT JOIN librarycard ON users.usersID=librarycard.usersID)  LEFT JOIN borrowbooks ON users.usersID=borrowbooks.userID LEFT JOIN bookiinventory ON borrowbooks.BookCardID=bookiinventory.BookID WHERE users.usersID=? AND bookiinventory.state=1 ";
	
	String updateBooksql="UPDATE borrowbooks SET date=?,cost=?,FreeDate=?  WHERE BorrowBooksID=?";
	String updateBooksql2="UPDATE borrowbooks SET returnDete=?  WHERE BorrowBooksID=?";
	String updatesql2="UPDATE bookiinventory SET state=0 WHERE BookID=?";
	
	String SelectBookByDim="SELECT bookiinventory.*,bookclass.* FROM bookiinventory JOIN  bookclass ON bookiinventory.ClassID =bookclass.BookClassID WHERE 1=1 ";
    String selectBookCount2="SELECT COUNT(*) COUNT FROM bookiinventory";
	
    String t="SELECT bookiinventory.*,bookclass.* FROM bookiinventory JOIN  bookclass ON bookiinventory.ClassID =bookclass.BookClassID";
    String updateNewBooksql="UPDATE bookiinventory SET BookMC=?,authorName=?,PressName=?,publicationDate=?,recordDate=?,ClassID=?,location=?,price=?  WHERE BookID=?";
    String updateStateLosesql="UPDATE bookiinventory SET state=2 WHERE BookID=?";
    String updateCost="UPDATE borrowbooks SET cost=?  WHERE BorrowBooksID=?";
    String SelectRecord="SELECT borrowbooks.*,bookiinventory.*  FROM (users LEFT JOIN librarycard ON users.usersID=librarycard.usersID)  LEFT JOIN borrowbooks ON users.usersID=borrowbooks.userID LEFT JOIN bookiinventory ON borrowbooks.BookCardID=bookiinventory.BookID where users.usersID=?";
   String SelectCountByAll="SELECT count(*) count FROM (users LEFT JOIN librarycard ON users.usersID=librarycard.usersID)  LEFT JOIN borrowbooks ON users.usersID=borrowbooks.userID LEFT JOIN bookiinventory ON borrowbooks.BookCardID=bookiinventory.BookID where users.usersID=?";
    
   String updateEvaluate="UPDATE borrowbooks SET evaluate=?  WHERE BorrowBooksID=?";
   String SelectMonth="SELECT bookiinventory.BookMC,bookiinventory.BookID, COUNT(borrowbooks.BookCardID) COUNT FROM  borrowbooks,bookiinventory WHERE bookiinventory.BookID= borrowbooks.BookCardID AND borrowbooks.date>=? AND borrowbooks.date<=?   GROUP BY borrowbooks.BookCardID ORDER BY COUNT DESC LIMIT 0,8";
   String SelectAllCount="SELECT bookiinventory.*,borrowbooks.* FROM (users LEFT JOIN librarycard ON users.usersID=librarycard.usersID)  LEFT JOIN borrowbooks ON users.usersID=borrowbooks.userID LEFT JOIN bookiinventory ON borrowbooks.BookCardID=bookiinventory.BookID GROUP BY bookiinventory.BookMC  ORDER BY BookIinventory.Brcount  DESC LIMIT 0,8";
   String SelectAllBookByBorrow="SELECT BookIinventory.*,BookClass.* FROM BookIinventory JOIN  BookClass ON BookIinventory.ClassID =BookClass.BookClassID  WHERE BookIinventory.state=0";
  String SelectAllBookByUserID="SELECT bookiinventory.*,borrowbooks.* FROM (users LEFT JOIN librarycard ON users.usersID=librarycard.usersID)  LEFT JOIN borrowbooks ON users.usersID=borrowbooks.userID LEFT JOIN bookiinventory ON borrowbooks.BookCardID=bookiinventory.BookID WHERE users.usersID=?  group by bookiinventory.BookMC";
   String SelectBroowbookcount="SELECT COUNT(*) countbookiinventory FROM BookIinventory JOIN  BookClass ON BookIinventory.ClassID =BookClass.BookClassID  WHERE BookIinventory.state=0";
 String SelectEvaluate="SELECT bookiinventory.BookMC,borrowbooks.evaluate FROM (users LEFT JOIN librarycard ON users.usersID=librarycard.usersID)  LEFT JOIN borrowbooks ON users.usersID=borrowbooks.userID LEFT JOIN bookiinventory ON borrowbooks.BookCardID=bookiinventory.BookID WHERE users.usersID=?  GROUP BY bookiinventory.BookMC ORDER BY borrowbooks.evaluate DESC";
 String SelectEvaluateByBookname="SELECT bookiinventory.BookID,bookiinventory.BookMC,borrowbooks.evaluate,users.usersID FROM (users LEFT JOIN librarycard ON users.usersID=librarycard.usersID)  LEFT JOIN borrowbooks ON users.usersID=borrowbooks.userID LEFT JOIN bookiinventory ON borrowbooks.BookCardID=bookiinventory.BookID WHERE bookiinventory.BookMC=? GROUP BY users.usersID";
 String selectBookClass="SELECT bookclass.BookClassMC, COUNT(*)COUNT FROM bookiinventory JOIN  bookclass ON bookiinventory.ClassID =bookclass.BookClassID GROUP BY bookiinventory.ClassID ORDER BY COUNT DESC";
 String Selectbook="SELECT * FROM bookiinventory JOIN  bookclass ON bookiinventory.ClassID =bookclass.BookClassID WHERE bookclass.BookClassMC=? ORDER BY bookiinventory.Brcount DESC";
 String Selectbookcard="SELECT * FROM librarycard";
 @Override
	public List<NewBook> findAllBook() {
		List<NewBook> list=new ArrayList<NewBook>();
		try {
			conn=DButil.getConnection();
		
			ps=conn.prepareStatement(SelectAllBook);
			rs=ps.executeQuery();
			//setter方法
			while(rs.next())
			{
				NewBook book=new NewBook();
				book.setBookID(rs.getInt("BookID"));
				book.setPublicationDate(rs.getDate("publicationDate"));
				book.setRecordDate(rs.getDate("recordDate"));
				book.setAuthorName(rs.getString("authorName"));
				book.setBookMC(rs.getString("bookMC"));
				book.setBrcount(rs.getInt("brcount"));
				book.setBookClass(rs.getString("BookClassMC"));
				book.setEvaluate(rs.getInt("evaluate"));
				book.setLocation(rs.getString("location"));
				book.setPressName(rs.getString("pressName"));
				book.setPrice(rs.getString("price"));
				book.setState(rs.getInt("state"));
				list.add(book);	
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		finally
		{
			DButil.colseAll2(conn, ps, rs);
		}
		return list;
	}

	@Override
	public int insetRowBook(NewBook t) {
		
		
		return 0;
		
	}

	@Override
	public int updateRowBook(NewBook t) 
	{
		//BookMC=?,authorName=?,PressName=?,publicationDate=?,recordDate=?,
		//ClassID=?,location=?,price=?  WHERE BookID=?
		int updatefinall=0;
		try {
			conn=DButil.getConnection();
			ps=conn.prepareStatement(updateNewBooksql);
			if(t.getBookMC()!=null)
			{
				ps.setString(1,t.getBookMC());
			}
			if(t.getAuthorName()!=null)
			{
				ps.setString(2,t.getAuthorName());
			}
			if(t.getPressName()!=null)
			{
				ps.setString(3,t.getPressName());
			}
			if(t.getPublicationDate()!=null)
			{
				ps.setDate(4, new Date(t.getPublicationDate().getTime()));
			}
			if(t.getRecordDate()!=null)
			{
				ps.setDate(5, new Date(t.getRecordDate().getTime()));
			}
          if(t.getClassID()>0)
         {
	     ps.setInt(6, t.getClassID());
	     }
          if(t.getLocation()!=null)
			{
				ps.setString(7,t.getLocation());
			}
          if(t.getPrice()!=null)
			{
				ps.setString(8,t.getPrice());
			}
          if(t.getBookID()>0)
          {
 	     ps.setInt(9, t.getBookID());
 	      }
			 updatefinall=ps.executeUpdate();
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
		finally{
			DButil.colseAll(conn, ps, null);
		}
		return updatefinall;
		//return 0;
	}

	@Override
	public int deleteRowBook(int id) {
		
		return 0;
	}

	@Override
	public List<NewBook> findByID(int id) {
		List<NewBook> list=new ArrayList<NewBook>();
		try {
			conn=DButil.getConnection();
			ps=conn.prepareStatement(SelectBookByID);
			ps.setInt(1, id);
			rs=ps.executeQuery();
			while(rs.next())
			{
				NewBook book=new NewBook();
				book.setBookID(rs.getInt("BookID"));
				book.setPublicationDate(rs.getDate("publicationDate"));
				book.setRecordDate(rs.getDate("recordDate"));
				book.setAuthorName(rs.getString("authorName"));
				book.setBookMC(rs.getString("bookMC"));
				book.setBrcount(rs.getInt("brcount"));
				book.setBookClass(rs.getString("BookClassMC"));
				book.setEvaluate(rs.getInt("evaluate"));
				book.setLocation(rs.getString("location"));
				book.setPressName(rs.getString("pressName"));
				book.setPrice(rs.getString("price"));
				book.setState(rs.getInt("state"));
				list.add(book);	
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		finally{
			DButil.colseAll2(conn, ps, rs);
		}
		
		return list;
	}

	@Override
	public int insetBorrowRowBook(com.gx.po.BorrowBook b) {
		int key=-1;
		try {
			
			conn=DButil.getConnection();
			ps=conn.prepareStatement(BorrowBook,Statement.RETURN_GENERATED_KEYS);
			ps.setInt(1, b.getUserID());
			ps.setInt(2, b.getBookCardID());
			ps.setDate(3, new Date(b.getDate().getTime()));
			ps.setDate(4,new Date(b.getReturnDete().getTime()));
			ps.setString(5,b.getCost());
			ps.setDate(6,new Date(b.getFreeDate().getTime()));
			ps.setInt(7, b.getEvaluate());
		   	ps.executeUpdate();
		   	rs=ps.getGeneratedKeys();
			if(rs.next())
			{
				key=rs.getInt(1);
				System.out.println(key);
			}
		} catch (SQLException e) 
		{
			e.printStackTrace();
		}
		return key;
	}

	@Override
	public int updateBookCount(NewBook t) {
		int updatefinall=0;
		try {
		    conn=DButil.getConnection();
			ps=conn.prepareStatement(updatesql);
			
    if(t.getBookID()>0)
    {
	ps.setInt(1, t.getBookID());
	}
			 updatefinall=ps.executeUpdate();
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
		finally{
			DButil.colseAll(conn, ps, null);
		}
		return updatefinall;
	}

	@Override
	public List<NewBook> findByBookName(String BookName) {
		List<NewBook> list=new ArrayList<NewBook>();
		try {
			conn=DButil.getConnection();
		
			ps=conn.prepareStatement(SelectBookByName);
			ps.setString(1, BookName);
			rs=ps.executeQuery();
			while(rs.next())
			{
				NewBook book=new NewBook();
				book.setBookID(rs.getInt("BookID"));
				book.setPublicationDate(rs.getDate("publicationDate"));
				book.setRecordDate(rs.getDate("recordDate"));
				book.setAuthorName(rs.getString("authorName"));
				book.setBookMC(rs.getString("bookMC"));
				book.setBrcount(rs.getInt("brcount"));
				book.setBookClass(rs.getString("BookClassMC"));
				book.setEvaluate(rs.getInt("evaluate"));
				book.setLocation(rs.getString("location"));
				book.setPressName(rs.getString("pressName"));
				book.setPrice(rs.getString("price"));
				book.setState(rs.getInt("state"));
				list.add(book);	
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		finally{
			DButil.colseAll2(conn, ps, rs);
		}
		return list;
	}

	@Override
	public List<NewBook> findByBookCard(String BookCard) {
		List<NewBook> list=new ArrayList<NewBook>();
		try {
			conn=DButil.getConnection();
		StringBuffer buffer=new StringBuffer(SelectBookByBookCard);
		String str=" Limit "+ Paging.pageNumbe +","+Paging.pageSize;
		System.out.println(Paging.pageNumbe);
		buffer.append(str);
		//System.out.println(buffer.toString());
			ps=conn.prepareStatement(buffer.toString());
			ps.setString(1, BookCard);
			rs=ps.executeQuery();
			while(rs.next())
			{
				NewBook book=new NewBook();
				book.setBookID(rs.getInt("BookID"));
				book.setPublicationDate(rs.getDate("publicationDate"));
				book.setRecordDate(rs.getDate("recordDate"));
				//System.out.println(rs.getDate("recordDate"));
				book.setAuthorName(rs.getString("authorName"));
				book.setBookMC(rs.getString("bookMC"));
				book.setBrcount(rs.getInt("brcount"));
				book.setEvaluate(rs.getInt("evaluate"));
				book.setLocation(rs.getString("location"));
				book.setPressName(rs.getString("pressName"));
				book.setPrice(rs.getString("price"));
				book.setState(rs.getInt("state"));
				book.setBorrowBooksID(rs.getInt("BorrowBooksID"));
				book.setDate(rs.getDate("date"));
				book.setFreeDate(rs.getDate("freeDate"));
				list.add(book);	
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		finally{
			DButil.colseAll2(conn, ps, rs);
		}
		return list;
	}

	@Override
	public int selectCount(int id) {
		int count=0;
		try {
			conn=DButil.getConnection();
			
			ps=conn.prepareStatement(selectCountsql);
			ps.setInt(1, id);
			rs=ps.executeQuery();
			while(rs.next())
			{
				count=rs.getInt(1);
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		Paging.AllCount=count;
		return count;
	}

	@Override
	public int updateBook(com.gx.po.BorrowBook b) {

		int updatefinall=0;
		try {
			conn=DButil.getConnection();
			ps=conn.prepareStatement(updateBooksql);
			
			if(b.getDate()!=null)
			{
				ps.setDate(1,new Date(b.getDate().getTime()));
			}
			/*if(b.getReturnDete()!=null)
			{
				ps.setDate(2,new Date(b.getReturnDete().getTime()));
			}*/
          if(b.getCost()!=null)
    {
	ps.setString(2, b.getCost());
	}
          if(b.getFreeDate()!=null)
			{
				ps.setDate(3,new Date(b.getFreeDate().getTime()));
			}
/*          if(b.getReturnDete()!=null)
			{
				ps.setDate(4,new Date(b.getReturnDete().getTime()));
			}
          if(b.getEvaluate()>0)
          {
      	ps.setInt(5, b.getEvaluate());
      	  }*/
          System.out.println(b.getBorrowBooksID());
          if(b.getBorrowBooksID()>0)
          {
      	ps.setInt(4, b.getBorrowBooksID());
      	  }
			 updatefinall=ps.executeUpdate();
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
		finally{
			DButil.colseAll(conn, ps, null);
		}
		return updatefinall;
	}

	@Override
	public int updateborrowBook(com.gx.po.BorrowBook b) {
		int updatefinall=0;
		try {
			conn=DButil.getConnection();
			ps=conn.prepareStatement(updateBooksql2);
			
			if(b.getReturnDete()!=null)
			{
				ps.setDate(1,new Date(b.getReturnDete().getTime()));
			}
          if(b.getBorrowBooksID()>0)
          {
      	ps.setInt(2, b.getBorrowBooksID());
      	  }
			 updatefinall=ps.executeUpdate();
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
		finally{
			DButil.colseAll(conn, ps, null);
		}
		return updatefinall;
	}

	///把书本状态修改成可借
	@Override
	public int updateBookstate(NewBook t) {
		int updatefinall=0;
		try {
		    conn=DButil.getConnection();
			ps=conn.prepareStatement(updatesql2);
			
    if(t.getBookID()>0)
    {
	ps.setInt(1, t.getBookID());
	}
			 updatefinall=ps.executeUpdate();
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
		finally{
			DButil.colseAll(conn, ps, null);
		}
		return updatefinall;
		//return 0;
	}

	@Override
	public List<NewBook> findByDim() {
		List<NewBook> list=new ArrayList<NewBook>();
		try {
			conn=DButil.getConnection();
			StringBuffer buffer=new StringBuffer(SelectBookByDim);
			if("".equals(otxt))
			{	
			}
			else{
				buffer.append("AND BookMC  LIKE  '%"+ otxt+"%'");
			}
			if("".equals(otxt2))
			{
			}
			else{
				buffer.append("AND authorName  LIKE  '%"+ otxt2+"%'");
			}
			if("".equals(otxt3))
			{
			}
			else{
				buffer.append("AND location  LIKE  '%"+ otxt3+"%'");
			}
			if("".equals(otxt4))
			{	
			}
			else{
				buffer.append("AND state  LIKE  '%"+ otxt4+"%'");
			}
			System.out.println(buffer.toString());
			String str=" Limit "+ DimPaging.DimpageNumbe +","+DimPaging.DimpageSize;
			buffer.append(str);
			ps=conn.prepareStatement(buffer.toString());
			rs=ps.executeQuery();
			while(rs.next())
			{
				NewBook book=new NewBook();
				book.setBookID(rs.getInt("BookID"));
				book.setPublicationDate(rs.getDate("publicationDate"));
				book.setRecordDate(rs.getDate("recordDate"));
				book.setAuthorName(rs.getString("authorName"));
				book.setBookMC(rs.getString("bookMC"));
				book.setBrcount(rs.getInt("brcount"));
				book.setEvaluate(rs.getInt("evaluate"));
				book.setLocation(rs.getString("location"));
				book.setPressName(rs.getString("pressName"));
				book.setPrice(rs.getString("price"));
				book.setState(rs.getInt("state"));
				book.setBookClass(rs.getString("location"));
				book.setBookClass(rs.getString("BookClassMC"));
				
				//book.setBorrowBooksID(rs.getInt("BorrowBooksID"));
				//book.setDate(rs.getDate("date"));
				//book.setFreeDate(rs.getDate("freeDate"));
				list.add(book);	
				//list.add(book);	
			
			}
for (NewBook newBook : list) {
	System.out.println(newBook.getPublicationDate());
}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		finally{
			DButil.colseAll2(conn, ps, rs);
		}
		return list;
	}

	//查询书本数量
	@Override
	public int selectCountByDim() {
		int count=0;
		try {
			conn=DButil.getConnection();
			ps=conn.prepareStatement(selectBookCount2);
			rs=ps.executeQuery();
			while(rs.next())
			{
				count=rs.getInt(1);
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		DimPaging.DimAllCount=count;
		return 0;
	}

	@Override
	public int updateBookstateTOLose(NewBook t) {
		int updatefinall=0;
		try {
		    conn=DButil.getConnection();
			ps=conn.prepareStatement(updateStateLosesql);
			
    if(t.getBookID()>0)
    {
	ps.setInt(1, t.getBookID());
	}
			 updatefinall=ps.executeUpdate();
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
		finally{
			DButil.colseAll(conn, ps, null);
		}
		return updatefinall;
	}

	@Override
	public int updateBookCost(com.gx.po.BorrowBook b) {
		int updatefinall=0;
		try {
			conn=DButil.getConnection();
			ps=conn.prepareStatement(updateCost);
          if(b.getCost()!=null)
    {
	ps.setString(1, b.getCost());
	}
          if(b.getBorrowBooksID()>0)
          {
      	ps.setInt(2, b.getBorrowBooksID());
      	  }
			 updatefinall=ps.executeUpdate();
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
		finally{
			DButil.colseAll(conn, ps, null);
		}
		return updatefinall;
	}

	@Override
	public List<com.gx.po.BorrowBook> findByMyRecord(int id) {
		
		List<com.gx.po.BorrowBook> list=new ArrayList<com.gx.po.BorrowBook>();
		try {
		
			conn=DButil.getConnection();
			StringBuffer buffer=new StringBuffer(SelectRecord);
			String str=" Limit "+ Page.DimpageNumbe +","+Page.DimpageSize;
			buffer.append(str);
			System.out.println(buffer.toString());
			ps=conn.prepareStatement(buffer.toString());
			ps.setInt(1, id);
			rs=ps.executeQuery();
			
			while(rs.next())
			{
				com.gx.po.BorrowBook book=new com.gx.po.BorrowBook();
				book.setBorrowBooksID(rs.getInt("borrowBooksID"));
				book.setBookCardID(rs.getInt("bookCardID"));
				book.setDate(rs.getDate("date"));
				book.setFreeDate(rs.getDate("freeDate"));
				book.setReturnDete(rs.getDate("returnDete"));
				book.setEvaluate(rs.getInt("evaluate"));
				book.setUserID(rs.getInt("userID"));
				book.setCost(rs.getString("cost") );
				book.setBookMC(rs.getString("bookMC"));
				list.add(book);	
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		finally
		{
			DButil.colseAll2(conn, ps, rs);
		}
		return list;
	}

	@Override
	public int selectAllCount(int id) {
		int count=0;
		try {
			conn=DButil.getConnection();
			
			ps=conn.prepareStatement(SelectCountByAll);
			ps.setInt(1, id);
			rs=ps.executeQuery();
			while(rs.next())
			{
				count=rs.getInt(1);
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		Page.DimAllCount=count;
		return 0;
	}

	@Override
	public int updateBookEvaluate(com.gx.po.BorrowBook b) {
		int updatefinall=0;
		try {
			conn=DButil.getConnection();
			ps=conn.prepareStatement(updateEvaluate);
          if(b.getEvaluate()>0)
    {
	ps.setInt(1, b.getEvaluate());
	}
          if(b.getBorrowBooksID()>0)
          {
      	ps.setInt(2, b.getBorrowBooksID());
      	  }
			 updatefinall=ps.executeUpdate();
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
		finally{
			DButil.colseAll(conn, ps, null);
		}
		return updatefinall;
	}

	@Override
	public List<NewBook> findMonthBytime(java.util.Date dateF,java.util.Date dateL) {
	
		List<NewBook> list=new ArrayList<NewBook>();
		try {
			conn=DButil.getConnection();
		
			ps=conn.prepareStatement(SelectMonth);
			ps.setDate(1,new Date( dateF.getTime()));
			ps.setDate(2,new Date( dateL.getTime()));
			rs=ps.executeQuery();
			
			while(rs.next())
			{
				NewBook book=new NewBook();
				book.setBookID(rs.getInt("BookID"));
				book.setBookMC(rs.getString("bookMC"));
				list.add(book);	
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		finally
		{
			DButil.colseAll2(conn, ps, rs);
		}
		return list;
	}

	@Override
	public List<NewBook> findAll() {
		List<NewBook> list=new ArrayList<NewBook>();
		try {
			conn=DButil.getConnection();
			ps=conn.prepareStatement(SelectAllCount);
			rs=ps.executeQuery();
			while(rs.next())
			{
				NewBook book=new NewBook();
				book.setBookID(rs.getInt("BookID"));
				book.setPublicationDate(rs.getDate("publicationDate"));
				book.setRecordDate(rs.getDate("recordDate"));
				book.setAuthorName(rs.getString("authorName"));
				book.setBookMC(rs.getString("bookMC"));
				book.setBrcount(rs.getInt("brcount"));
				list.add(book);	
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		finally
		{
			DButil.colseAll2(conn, ps, rs);
		}
		return list;
	}

	@Override
	public List<NewBook> findAllByUserID() {
		List<NewBook> list=new ArrayList<NewBook>();
		try {
			conn=DButil.getConnection();
		
			ps=conn.prepareStatement(SelectAllBook);
			rs=ps.executeQuery();
			
			while(rs.next())
			{
				NewBook book=new NewBook();
				book.setBookID(rs.getInt("BookID"));
				book.setBookMC(rs.getString("bookMC"));
				book.setBrcount(rs.getInt("brcount"));
				book.setBookClass(rs.getString("BookClassMC"));
				book.setEvaluate(rs.getInt("evaluate"));
				book.setState(rs.getInt("state"));
				list.add(book);	
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		finally
		{
			DButil.colseAll2(conn, ps, rs);
		}
		return list;
	}

	@Override
	public List<NewBook> findBorrowAllBook() {
		List<NewBook> list=new ArrayList<NewBook>();
		try {
			conn=DButil.getConnection();
			StringBuffer buffer=new StringBuffer(SelectAllBookByBorrow);
			if("".equals(select))
			{	
			}
			else{
				buffer.append(" AND BookMC  LIKE  '%"+select+"%'");
			}
			String str=" Limit "+ PageByBorrow.DimpageNumbe +","+PageByBorrow.DimpageSize;
			buffer.append(str);
			System.out.println(buffer.toString());
			ps=conn.prepareStatement(buffer.toString());
			//LIMIT 0,9
			rs=ps.executeQuery();
			while(rs.next())
			{
				NewBook book=new NewBook();
				book.setBookID(rs.getInt("BookID"));
				book.setPublicationDate(rs.getDate("publicationDate"));
				book.setRecordDate(rs.getDate("recordDate"));
				book.setAuthorName(rs.getString("authorName"));
				book.setBookMC(rs.getString("bookMC"));
				book.setBrcount(rs.getInt("brcount"));
			//	book.setBookClass(rs.getString("BookClassMC"));
				book.setEvaluate(rs.getInt("evaluate"));
				book.setLocation(rs.getString("location"));
				book.setPressName(rs.getString("pressName"));
				book.setPrice(rs.getString("price"));
				book.setState(rs.getInt("state"));
				list.add(book);	
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		finally
		{
			DButil.colseAll2(conn, ps, rs);
		}
		return list;
	}

	@Override
	public List<NewBook> findBorrowAllBookByUserID(int id) {
		List<NewBook> list=new ArrayList<NewBook>();
		try {
			conn=DButil.getConnection();
		
			ps=conn.prepareStatement(SelectAllBookByUserID);
			ps.setInt(1, id);
			rs=ps.executeQuery();
			
			while(rs.next())
			{
				NewBook book=new NewBook();
				book.setBookID(rs.getInt("BookID"));
				book.setPublicationDate(rs.getDate("publicationDate"));
				book.setRecordDate(rs.getDate("recordDate"));
				book.setAuthorName(rs.getString("authorName"));
				book.setBookMC(rs.getString("bookMC"));
				book.setBrcount(rs.getInt("brcount"));
			//	book.setBookClass(rs.getString("BookClassMC"));
				book.setEvaluate(rs.getInt("evaluate"));
				book.setLocation(rs.getString("location"));
				book.setPressName(rs.getString("pressName"));
				book.setPrice(rs.getString("price"));
				book.setState(rs.getInt("state"));
				list.add(book);	
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		finally
		{
			DButil.colseAll2(conn, ps, rs);
		}
		return list;
	}

	@Override
	public int selectAllCountByBorrow() {
		int count=0;
		try {
			conn=DButil.getConnection();
			
			ps=conn.prepareStatement(SelectBroowbookcount);
			rs=ps.executeQuery();
			while(rs.next())
			{
				count=rs.getInt(1);
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		PageByBorrow.DimAllCount=count;
		return 0;
	}

	@Override
	public List<com.gx.po.BorrowBook> SelectEvaluate(int id) {
		List<com.gx.po.BorrowBook> list=new ArrayList<com.gx.po.BorrowBook>();
		try {
		
			conn=DButil.getConnection();
			ps=conn.prepareStatement(SelectEvaluate);
			ps.setInt(1, id);
			rs=ps.executeQuery();
			
			while(rs.next())
			{
				com.gx.po.BorrowBook book=new com.gx.po.BorrowBook();
			
				book.setEvaluate(rs.getInt("evaluate"));

				book.setBookMC(rs.getString("bookMC"));
				list.add(book);	
			}	
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		finally
		{
			DButil.colseAll2(conn, ps, rs);
		}
		return list;
	}

	@Override
	public List<NewBook> SelectEvaluateByBookname(String BookName) {
		List<NewBook> list=new ArrayList<NewBook>();
		try {
			conn=DButil.getConnection();
		
			ps=conn.prepareStatement(SelectEvaluateByBookname);
			ps.setString(1, BookName);
			rs=ps.executeQuery();
			while(rs.next())
			{
				NewBook book=new NewBook();
				book.setBookID(rs.getInt("BookID"));
				book.setBookMC(rs.getString("bookMC"));
				book.setEvaluate(rs.getInt("evaluate"));
				book.setUsersID(rs.getInt("usersID"));
				list.add(book);	
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally
		{
			DButil.colseAll2(conn, ps, rs);
		}
		return list;
	}
	@Override
	public List<BookClass2> SelectBookClass() {
		List<BookClass2> list=new ArrayList<BookClass2>();
		try {
			conn=DButil.getConnection();
			ps=conn.prepareStatement(selectBookClass);
			rs=ps.executeQuery();
			while(rs.next())
			{
				BookClass2 book=new BookClass2();
				book.setName(rs.getString("BookClassMC"));
				book.setY(rs.getInt("COUNT"));
				book.setDrilldown(rs.getString("BookClassMC"));
				list.add(book);	
			}
		} catch (SQLException e) 
		{
			e.printStackTrace();
		}
		finally
		{
			DButil.colseAll2(conn, ps, rs);
		}
		return list;
	}

	@Override
	public List<NewBook> SelectBook(String Classname) {
		List<NewBook> list=new ArrayList<NewBook>();
		try {
			conn=DButil.getConnection();
			ps=conn.prepareStatement(Selectbook);
			ps.setString(1,Classname);
			rs=ps.executeQuery();
			while(rs.next())
			{
				NewBook book=new NewBook();
				book.setBookMC(rs.getString("bookMC"));
				book.setBrcount(rs.getInt("brcount"));
				list.add(book);	
			}
		} catch (SQLException e) 
		{
			e.printStackTrace();
		}
		finally
		{
			DButil.colseAll2(conn, ps, rs);
		}
		return list;
	}

	@Override
	public List<BookName> SelectallBook() {
		List<BookName> list=new ArrayList<BookName>();
		try {
			conn=DButil.getConnection();
		
			ps=conn.prepareStatement(SelectAllBook);
			rs=ps.executeQuery();
			
			while(rs.next())
			{
				BookName book=new BookName();
				book.setLabel(rs.getString("bookMC"));
				
				list.add(book);	
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		finally
		{
			DButil.colseAll2(conn, ps, rs);
		}
		return list;
	}

	@Override
	public List<LibraryCard2> SelectallBookCard() {
		List<LibraryCard2> list=new ArrayList<LibraryCard2>();
		try {
			conn=DButil.getConnection();
			ps=conn.prepareStatement(Selectbookcard);
			rs=ps.executeQuery();
			
			while(rs.next())
			{
				LibraryCard2 book=new LibraryCard2();
				book.setLabel(rs.getString("libraryCard"));
				list.add(book);	
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		finally
		{
			//关闭资源，避免出现异常
			DButil.colseAll2(conn, ps, rs);
		}
		return list;
	
	}

}
