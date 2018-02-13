package com.gddr.mybysj.entities;

import java.util.Date;

/**
 * 交易记录类 记录资金流转
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
	private Integer status;
	public Dealing() {
		super();
	}
	public Dealing(Project project, String dealingName, Double dealingAmount, Date dealingTime, User payer, User payee,
			Integer status) {
		super();
		this.project = project;
		this.dealingName = dealingName;
		this.dealingAmount = dealingAmount;
		this.dealingTime = dealingTime;
		this.payer = payer;
		this.payee = payee;
		this.status = status;
	}
	public Dealing(Integer dealingId, Project project, String dealingName, Double dealingAmount, Date dealingTime,
			User payer, User payee, Integer status) {
		super();
		this.dealingId = dealingId;
		this.project = project;
		this.dealingName = dealingName;
		this.dealingAmount = dealingAmount;
		this.dealingTime = dealingTime;
		this.payer = payer;
		this.payee = payee;
		this.status = status;
	}
	public Integer getDealingId() {
		return dealingId;
	}
	public Project getProject() {
		return project;
	}
	public String getDealingName() {
		return dealingName;
	}
	public Double getDealingAmount() {
		return dealingAmount;
	}
	public Date getDealingTime() {
		return dealingTime;
	}
	public User getPayer() {
		return payer;
	}
	public User getPayee() {
		return payee;
	}
	public Integer getStatus() {
		return status;
	}
	public void setDealingId(Integer dealingId) {
		this.dealingId = dealingId;
	}
	public void setProject(Project project) {
		this.project = project;
	}
	public void setDealingName(String dealingName) {
		this.dealingName = dealingName;
	}
	public void setDealingAmount(Double dealingAmount) {
		this.dealingAmount = dealingAmount;
	}
	public void setDealingTime(Date dealingTime) {
		this.dealingTime = dealingTime;
	}
	public void setPayer(User payer) {
		this.payer = payer;
	}
	public void setPayee(User payee) {
		this.payee = payee;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "Dealing [dealingId=" + dealingId + ", project=" + project + ", dealingName=" + dealingName
				+ ", dealingAmount=" + dealingAmount + ", dealingTime=" + dealingTime + ", payer=" + payer + ", payee="
				+ payee + ", status=" + status + "]";
	}
}
