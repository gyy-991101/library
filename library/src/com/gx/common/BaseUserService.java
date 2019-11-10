package com.gx.common;

import java.util.List;

public interface BaseUserService<T,K> {
	public List<T> findAll();
	public boolean insetRow(T t);
	public boolean updateRow(T t);
	public boolean deleteRow(int id);
}
