package com.gx.po;

import java.util.Date;

public class BorrowBook {
	private int	BorrowBooksID;
	private int	userID;
	private int	BookCardID;
	private Date date;	
	private Date returnDete;	
	private Date FreeDate;	
	private int evaluate;
	private String cost;
	private String BookMC;
	public String getBookMC() {
		return BookMC;
	}
	public void setBookMC(String bookMC) {
		BookMC = bookMC;
	}
	public int getBorrowBooksID() {
		return BorrowBooksID;
	}
	public void setBorrowBooksID(int borrowBooksID) {
		BorrowBooksID = borrowBooksID;
	}
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}
	public int getBookCardID() {
		return BookCardID;
	}
	public void setBookCardID(int bookCardID) {
		BookCardID = bookCardID;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public Date getReturnDete() {
		return returnDete;
	}
	public void setReturnDete(Date returnDete) {
		this.returnDete = returnDete;
	}
	public Date getFreeDate() {
		return FreeDate;
	}
	public void setFreeDate(Date freeDate) {
		FreeDate = freeDate;
	}
	public int getEvaluate() {
		return evaluate;
	}
	public void setEvaluate(int evaluate) {
		this.evaluate = evaluate;
	}
	public String getCost() {
		return cost;
	}
	public void setCost(String cost) {
		this.cost = cost;
	}

}
