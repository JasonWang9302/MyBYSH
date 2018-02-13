package com.gddr.mybysj.entities;
/**
 * 管理员表
 * @author Administrator
 *
 */
public class Admin {

	private Integer adminId;
	private String adminName;
	private String password;
	private Double balance;
	public Admin() {
		super();
	}
	public Admin(String adminName, String password, Double balance) {
		super();
		this.adminName = adminName;
		this.password = password;
		this.balance = balance;
	}
	public Admin(Integer adminId, String adminName, String password, Double balance) {
		super();
		this.adminId = adminId;
		this.adminName = adminName;
		this.password = password;
		this.balance = balance;
	}
	public Integer getAdminId() {
		return adminId;
	}
	public String getAdminName() {
		return adminName;
	}
	public String getPassword() {
		return password;
	}
	public Double getBalance() {
		return balance;
	}
	public void setAdminId(Integer adminId) {
		this.adminId = adminId;
	}
	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void setBalance(Double balance) {
		this.balance = balance;
	}
	@Override
	public String toString() {
		return "Admin [adminId=" + adminId + ", adminName=" + adminName + ", password=" + password + ", balance="
				+ balance + "]";
	}
}
