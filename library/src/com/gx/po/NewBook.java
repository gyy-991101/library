package com.gx.po;

import java.util.Date;

public class NewBook {

private int BookID;
 private String BookMC;
 private String authorName;
 private String PressName;
 private Date publicationDate;
 private Date recordDate;
 private int state;
 private int ClassID;
 private String location;
 private int Brcount;
 private String price;
 private int evaluate;
 private byte[] picture;
 private String BookClass;
 private int BorrowBooksID;
 private Date date;
 private Date FreeDate;
 private int usersID;
 private double similarity;
 private String label;
 public String getLabel() {
	return label;
}
public void setLabel(String label) {
	this.label = label;
}
public double getSimilarity() {
	return similarity;
}
public void setSimilarity(double similarity) {
	this.similarity = similarity;
}
public int getUsersID() {
		return usersID;
	}
	public void setUsersID(int usersID) {
		this.usersID = usersID;
	}
public Date getDate() {
	return date;
}
public void setDate(Date date) {
	this.date = date;
}

public Date getFreeDate() {
	return FreeDate;
}
public void setFreeDate(Date freeDate) {
	FreeDate = freeDate;
}
public int getBorrowBooksID() {
	return BorrowBooksID;
}
public void setBorrowBooksID(int borrowBooksID) {
	BorrowBooksID = borrowBooksID;
}
public String getBookClass() {
	return BookClass;
}
public void setBookClass(String bookClass) {
	BookClass = bookClass;
}
public int getBookID() {
	return BookID;
}
public void setBookID(int bookID) {
	BookID = bookID;
}
public String getBookMC() {
	return BookMC;
}
public void setBookMC(String bookMC) {
	BookMC = bookMC;
}
public String getAuthorName() {
	return authorName;
}
public void setAuthorName(String authorName) {
	this.authorName = authorName;
}
public String getPressName() {
	return PressName;
}
public void setPressName(String pressName) {
	PressName = pressName;
}
public Date getPublicationDate() {
	return publicationDate;
}
public void setPublicationDate(Date publicationDate) {
	this.publicationDate = publicationDate;
}
public Date getRecordDate() {
	return recordDate;
}
public void setRecordDate(Date recordDate) {
	this.recordDate = recordDate;
}
public int getState() {
	return state;
}
public void setState(int state) {
	this.state = state;
}
public int getClassID() {
	return ClassID;
}
public void setClassID(int classID) {
	ClassID = classID;
}
public String getLocation() {
	return location;
}
public void setLocation(String location) {
	this.location = location;
}
public int getBrcount() {
	return Brcount;
}
public void setBrcount(int brcount) {
	Brcount = brcount;
}
public String getPrice() {
	return price;
}
public void setPrice(String price) {
	this.price = price;
}
public int getEvaluate() {
	return evaluate;
}
public void setEvaluate(int evaluate) {
	this.evaluate = evaluate;
}
public byte[] getPicture() {
	return picture;
}
public void setPicture(byte[] picture) {
	this.picture = picture;
}
}
