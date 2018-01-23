package com.gddr.mybysj.entities;

public class User {
	private Integer userId;
	private String userName;
	private String password;
	private String phone;
	private String email;
	private String introduction;
	private Double balance;
	private String payPassword;
	private Integer grades;// 评分
	public User() {
		super();
	}
	public User(String userName, String password, String phone, String email, String introduction, Double balance,
			String payPassword, Integer grades) {
		super();
		this.userName = userName;
		this.password = password;
		this.phone = phone;
		this.email = email;
		this.introduction = introduction;
		this.balance = balance;
		this.payPassword = payPassword;
		this.grades = grades;
	}
	public User(Integer userId, String userName, String password, String phone, String email, String introduction,
			Double balance, String payPassword, Integer grades) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.password = password;
		this.phone = phone;
		this.email = email;
		this.introduction = introduction;
		this.balance = balance;
		this.payPassword = payPassword;
		this.grades = grades;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getIntroduction() {
		return introduction;
	}
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	public Double getBalance() {
		return balance;
	}
	public void setBalance(Double balance) {
		this.balance = balance;
	}
	public String getPayPassword() {
		return payPassword;
	}
	public void setPayPassword(String payPassword) {
		this.payPassword = payPassword;
	}
	public Integer getGrades() {
		return grades;
	}
	public void setGrades(Integer grades) {
		this.grades = grades;
	}
	@Override
	public String toString() {
		return "User [userId=" + userId + ", userName=" + userName + ", password=" + password + ", phone=" + phone
				+ ", email=" + email + ", introduction=" + introduction + ", balance=" + balance + ", payPassword="
				+ payPassword + ", grades=" + grades + "]";
	}
	

}
