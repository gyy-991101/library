package com.gx.service;

import java.util.List;
import com.gx.common.BaseUserService;
import com.gx.po.BookClass;
import com.gx.po.Users;

public interface IUserService extends BaseUserService<Users, Integer> {
public List<Users> findByNameAndpassword(String name,String password);
public List<BookClass> findBookClass();
}
