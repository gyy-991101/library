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

import com.gx.dao.UserDao;

import com.gx.po.BookClass;
import com.gx.po.LibraryCard;
import com.gx.po.NewBook;
import com.gx.po.Users;

import com.gx.servlet.InsertBook.Image;
import com.gx.util.DButil;



public class ImplUserDao<image> implements UserDao {
	public Connection conn=null;
	public PreparedStatement ps=null;
	public Statement st=null;
	public ResultSet rs=null;
	String selectsql="Select * from users";
	String selectsqlBookClass="Select * from bookclass";
	String delectsql="delete from users where id=?";
	String updatesql="update users set name=? where id=?";
	String selectsql2="Select id,name,password,email,birthday from users where id=?";
	String selectusersCount="SELECT COUNT(*) COUNT FROM users";
	String SelectLogin="SELECT users.*,librarycard.* FROM users JOIN  librarycard  ON users.usersID =librarycard.usersID WHERE accountNumber=? AND PASSWORD=?";
	
	String InsertBook="INSERT INTO bookiinventory(BookMC,authorName,PressName,publicationDate,recordDate,state,ClassID,location,Brcount,price,evaluate,picture) VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";
	String insertUser="INSERT INTO users(NAME,sex,phone,accountNumber,PASSWORD,JurisdictionID) VALUES(?,?,?,?,?,2)";
	String insertUserCard="INSERT INTO librarycard(libraryCard,usersID) VALUES (?,?)";
	@Override
	public List<Users> findAll() {
		
		List<Users> list=new ArrayList<Users>();
		try {
			conn=DButil.getConnection();
		
			ps=conn.prepareStatement(selectsql);
			rs=ps.executeQuery();
			
			while(rs.next())
			{
				Users user=new Users();
				user.setUsersID(rs.getInt("usersID"));
				user.setBirthday(rs.getDate("birthday"));
				user.setSex(rs.getString("sex"));
				user.setName(rs.getString("name"));
				user.setPassword(rs.getString("password"));
				user.setPhone(rs.getString("phone"));
				user.setJurisdictionID(rs.getInt("JurisdictionID"));
				user.setAccountNumber(rs.getString("accountNumber"));
				user.setAge(rs.getString("age"));
				list.add(user);	
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
	public int insetRow(Users t) {
		int key=-1;
		try {
			//NAME,sex,phone,accountNumber,PASSWORD,
			conn=DButil.getConnection();
			ps=conn.prepareStatement(insertUser,Statement.RETURN_GENERATED_KEYS);
			ps.setString(1,  t.getName());
			ps.setString(2,  t.getSex());
			ps.setString(3,  t.getPhone());
			ps.setString(4,  t.getAccountNumber());
			ps.setString(5, t.getPassword());
			
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
	public int updateRow(Users t) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteRow(int id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Users> findByNameAndpassword(String name, String password) {
		List<Users> list=new ArrayList<Users>();
		try {
			conn=DButil.getConnection();
		
			ps=conn.prepareStatement(SelectLogin);
			ps.setString(1, name);
			ps.setString(2, password);
			rs=ps.executeQuery();
			while(rs.next())
			{
				Users user=new Users();
				user.setUsersID(rs.getInt("usersID"));
				user.setLibraryCard(rs.getString("libraryCard"));
//				user.setBirthday(rs.getDate("birthday"));
//				user.setSex(rs.getString("sex"));
//				user.setName(rs.getString("name"));
//				user.setPassword(rs.getString("password"));
//				user.setPhone(rs.getString("phone"));
//				user.setJurisdictionID(rs.getInt("JurisdictionID"));
//				user.setAccountNumber(rs.getString("accountNumber"));
//				user.setAge(rs.getString("age"));
				list.add(user);	
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
	public List<BookClass> findBookClass() {
		List<BookClass> list=new ArrayList<BookClass>();
		try {
			conn=DButil.getConnection();
		
			ps=conn.prepareStatement(selectsqlBookClass);
			rs=ps.executeQuery();
			
			while(rs.next())
			{
				BookClass bookClass=new BookClass();
				bookClass.setBookClassID(rs.getInt("BookClassID"));
				bookClass.setBookClassMC(rs.getString("BookClassMC"));
				
				list.add(bookClass);	
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
	public int inserBook(NewBook L) {
		int key=-1;
		try {
			
			conn=DButil.getConnection();
			ps=conn.prepareStatement(InsertBook,Statement.RETURN_GENERATED_KEYS);
			ps.setString(1, L.getBookMC());
			ps.setString(2, L.getAuthorName());
			ps.setString(3, L.getPressName());
			ps.setDate(4,new Date(L.getPublicationDate().getTime()));
			ps.setDate(5,new Date(L.getRecordDate().getTime()));
			ps.setInt(6, L.getState());
			ps.setInt(7, L.getClassID());
			ps.setString(8, L.getLocation());
			ps.setInt(9, L.getBrcount());
			ps.setString(10, L.getPrice());
			ps.setInt(11, L.getEvaluate());
			
			File f=new File("F:"+File.separator+"/java图书馆项目/"+Image.image+"");
		   	ps.setBinaryStream(12,new FileInputStream(f),(int) new File(f.getPath()).length());
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
		} catch (FileNotFoundException e) 
		{
			e.printStackTrace();
		}
		return key;
	}

	@Override
	public int inserLibraryCard(com.gx.po.LibraryCard L) {
		int key=-1;
		try {
			//NAME,sex,phone,accountNumber,PASSWORD,
			conn=DButil.getConnection();
			ps=conn.prepareStatement(insertUserCard,Statement.RETURN_GENERATED_KEYS);
			ps.setString(1,  L.getLibraryCard());
			ps.setInt(2,  L.getUsersID());
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


	

}
