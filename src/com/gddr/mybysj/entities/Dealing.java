package com.gddr.mybysj.entities;

import java.util.Date;

/**
 * 交易记录表 记录资金流转
 * @author Administrator
 *
 */
public class Dealing {
	private Integer dealingId;
	private Project project;
	private String dealingName;
	private Double dealingAmount;
	private Date dealingTime;
	private User payer;
	private User payee;
	public Dealing() {
		super();
	}
	public Dealing(Project project, String dealingName, Double dealingAmount, Date dealingTime, User payer,
			User payee) {
		super();
		this.project = project;
		this.dealingName = dealingName;
		this.dealingAmount = dealingAmount;
		this.dealingTime = dealingTime;
		this.payer = payer;
		this.payee = payee;
	}
	public Dealing(Integer dealingId, Project project, String dealingName, Double dealingAmount, Date dealingTime,
			User payer, User payee) {
		super();
		this.dealingId = dealingId;
		this.project = project;
		this.dealingName = dealingName;
		this.dealingAmount = dealingAmount;
		this.dealingTime = dealingTime;
		this.payer = payer;
		this.payee = payee;
	}
	public Integer getDealingId() {
		return dealingId;
	}
	public void setDealingId(Integer dealingId) {
		this.dealingId = dealingId;
	}
	public Project getProject() {
		return project;
	}
	public void setProject(Project project) {
		this.project = project;
	}
	public String getDealingName() {
		return dealingName;
	}
	public void setDealingName(String dealingName) {
		this.dealingName = dealingName;
	}
	public Double getDealingAmount() {
		return dealingAmount;
	}
	public void setDealingAmount(Double dealingAmount) {
		this.dealingAmount = dealingAmount;
	}
	public Date getDealingTime() {
		return dealingTime;
	}
	public void setDealingTime(Date dealingTime) {
		this.dealingTime = dealingTime;
	}
	public User getPayer() {
		return payer;
	}
	public void setPayer(User payer) {
		this.payer = payer;
	}
	public User getPayee() {
		return payee;
	}
	public void setPayee(User payee) {
		this.payee = payee;
	}
	@Override
	public String toString() {
		return "Dealing [dealingId=" + dealingId + ", project=" + project + ", dealingName=" + dealingName
				+ ", dealingAmount=" + dealingAmount + ", dealingTime=" + dealingTime + ", payer=" + payer + ", payee="
				+ payee + "]";
	}
	
	
	

}
