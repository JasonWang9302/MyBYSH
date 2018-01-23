package com.gddr.mybysj.entities;
/**
 * 管理员表
 * @author Administrator
 *
 */
public class Admin {

	private Integer adminId;
	private String password;
	private Double balance;
	public Admin() {
		super();
	}
	public Admin(String password, Double balance) {
		super();
		this.password = password;
		this.balance = balance;
	}
	public Admin(Integer adminId, String password, Double balance) {
		super();
		this.adminId = adminId;
		this.password = password;
		this.balance = balance;
	}
	public Integer getAdminId() {
		return adminId;
	}
	public void setAdminId(Integer adminId) {
		this.adminId = adminId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Double getBalance() {
		return balance;
	}
	public void setBalance(Double balance) {
		this.balance = balance;
	}
	@Override
	public String toString() {
		return "Admin [adminId=" + adminId + ", password=" + password + ", balance=" + balance + "]";
	}
	
	
}
