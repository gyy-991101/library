package com.gx.po;

import java.util.Date;

public class Users {

	
	
	private int usersID;
	private String  name;
	private String  sex;
	private String  age;
	private Date birthday;
	private String  phone;
	private String accountNumber;
	private String password;
	private int JurisdictionID;
	private String libraryCard;
	public int getUsersID() {
		return usersID;
	}
	public void setUsersID(int usersID) {
		this.usersID = usersID;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAccountNumber() {
		return accountNumber;
	}
	public void setAccountNumber(String accountNumber) {
		this.accountNumber = accountNumber;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getJurisdictionID() {
		return JurisdictionID;
	}
	public void setJurisdictionID(int jurisdictionID) {
		JurisdictionID = jurisdictionID;
	}
	public String getLibraryCard() {
		return libraryCard;
	}
	public void setLibraryCard(String libraryCard) {
		this.libraryCard = libraryCard;
	}
}
