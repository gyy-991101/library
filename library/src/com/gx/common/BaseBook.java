package com.gx.common;

import java.util.List;

public interface BaseBook <T,K>{
	public List<T> findAllBook();
	public int insetRowBook(T t);
	public int updateRowBook(T t);
	public int deleteRowBook(int id);
}
