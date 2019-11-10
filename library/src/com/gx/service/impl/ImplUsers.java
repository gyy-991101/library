package com.gx.service.impl;

import java.sql.Connection;
import java.util.List;

import com.gx.dao.UserDao;
import com.gx.dao.impl.ImplUserDao;
import com.gx.po.BookClass;
import com.gx.po.Users;
import com.gx.service.IUserService;

public class ImplUsers implements IUserService {

	UserDao dao=new ImplUserDao();
	@Override
	public List<Users> findAll() {
		// TODO Auto-generated method stub
		return dao.findAll();
	}

	@Override
	public boolean insetRow(Users t) {
 
		return false;
	}

	@Override
	public boolean updateRow(Users t) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deleteRow(int id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<Users> findByNameAndpassword(String name, String password) {
		
		return dao.findByNameAndpassword(name, password);
	}

	@Override
	public List<BookClass> findBookClass() {
		
		return null;
	}

}
