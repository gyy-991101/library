package com.gx.common;

import java.util.List;

public interface BaseUserDao<T,K> {
public List<T> findAll();
public int insetRow(T t);
public int updateRow(T t);
public int deleteRow(int id);
}
