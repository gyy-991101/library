package com.gx.dao;

import java.util.List;

import com.gx.common.BaseUserDao;
import com.gx.po.BookClass;
import com.gx.po.LibraryCard;
import com.gx.po.NewBook;
import com.gx.po.Users;

public interface UserDao extends BaseUserDao<Users, Integer> {
	public List<Users> findByNameAndpassword(String name,String password);
	public List<BookClass> findBookClass();
	public int  inserBook(NewBook L);
	public int  inserLibraryCard(LibraryCard L);
}
