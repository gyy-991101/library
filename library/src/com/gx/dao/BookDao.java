package com.gx.dao;

import java.util.Date;
import java.util.List;

import com.gx.common.BaseBook;
import com.gx.po.BookClass;
import com.gx.po.BookClass2;
import com.gx.po.BookName;
import com.gx.po.BorrowBook;
import com.gx.po.LibraryCard;
import com.gx.po.LibraryCard2;
import com.gx.po.NewBook;

public interface BookDao extends BaseBook<NewBook, Integer>{
	public List<NewBook> findByID(int id);
	public int insetBorrowRowBook(BorrowBook b );
	public int updateBookCount(NewBook t);
	public List<NewBook> findByBookName(String  BookName);
	public List<NewBook> findByBookCard(String  BookCard);
	public int selectCount(int id);
	public int updateBook(BorrowBook b);
	public int updateborrowBook(BorrowBook b);
	public int updateBookstate(NewBook  t);//把书本状态修改成可借
	public List<NewBook> findByDim();//查询共有多少书本
	public int selectCountByDim();//书本总数量
	public int updateBookstateTOLose(NewBook  t);//把书本状态修改成遗失
	public int updateBookCost(BorrowBook b);//遗失提交费用
	public List<BorrowBook> findByMyRecord(int id);//查询借书历史
	public int selectAllCount(int id);//查询历史共借过多少书本
	public int updateBookEvaluate(BorrowBook b);//修改评分
	public List<NewBook> findMonthBytime(Date d1,Date d2);//查询本月借出最多的书本
	public List<NewBook> findAll();//查询借出最多的书本
	public List<NewBook> findAllByUserID(); // 查询出用户没有阅读过的书
	public List<NewBook> findBorrowAllBook(); //查询可以借的书本
	public List<NewBook> findBorrowAllBookByUserID(int id); //通过用户ID查询已经借的书本
	public int selectAllCountByBorrow();//查询有多少书本可以接
	public List<BorrowBook> SelectEvaluate(int id);//通过用户ID来查询评价高的数据
	public List<NewBook> SelectEvaluateByBookname(String BookName); //查询评价通过书名
	public List<BookClass2> SelectBookClass(); //查询各书类型的总数
	public List<NewBook> SelectBook(String Classname); //通过书类型来查询各书借出的总数
	public List<BookName> SelectallBook(); //查询所有的书名
	public List<LibraryCard2> SelectallBookCard();//查询所有的借书证
}
