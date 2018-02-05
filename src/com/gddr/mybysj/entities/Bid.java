package com.gddr.mybysj.entities;

import java.util.Date;

/**
 * 投标实体类
 * @author Administrator
 *
 */
public class Bid {

    private Integer bidId;
    private Project project;
    private User  servicer;
    private String bidDoc;
    private Integer status;//012 未选 中标  落标
    private Integer deleteFlag;
    private String bidReason;
    private String contactNumber;
    private Date bidTime;
	public Bid() {
		super();
	}
	public Bid(Project project, User servicer, String bidDoc, Integer status, Integer deleteFlag, String bidReason,
			String contactNumber, Date bidTime) {
		super();
		this.project = project;
		this.servicer = servicer;
		this.bidDoc = bidDoc;
		this.status = status;
		this.deleteFlag = deleteFlag;
		this.bidReason = bidReason;
		this.contactNumber = contactNumber;
		this.bidTime = bidTime;
	}
	public Bid(Integer bidId, Project project, User servicer, String bidDoc, Integer status, Integer deleteFlag,
			String bidReason, String contactNumber, Date bidTime) {
		super();
		this.bidId = bidId;
		this.project = project;
		this.servicer = servicer;
		this.bidDoc = bidDoc;
		this.status = status;
		this.deleteFlag = deleteFlag;
		this.bidReason = bidReason;
		this.contactNumber = contactNumber;
		this.bidTime = bidTime;
	}
	public Integer getBidId() {
		return bidId;
	}
	public void setBidId(Integer bidId) {
		this.bidId = bidId;
	}
	public Project getProject() {
		return project;
	}
	public void setProject(Project project) {
		this.project = project;
	}
	public User getServicer() {
		return servicer;
	}
	public void setServicer(User servicer) {
		this.servicer = servicer;
	}
	public String getBidDoc() {
		return bidDoc;
	}
	public void setBidDoc(String bidDoc) {
		this.bidDoc = bidDoc;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Integer getDeleteFlag() {
		return deleteFlag;
	}
	public void setDeleteFlag(Integer deleteFlag) {
		this.deleteFlag = deleteFlag;
	}
	public String getBidReason() {
		return bidReason;
	}
	public void setBidReason(String bidReason) {
		this.bidReason = bidReason;
	}
	public String getContactNumber() {
		return contactNumber;
	}
	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}
	public Date getBidTime() {
		return bidTime;
	}
	public void setBidTime(Date bidTime) {
		this.bidTime = bidTime;
	}
	@Override
	public String toString() {
		return "Bid [bidId=" + bidId + ", project=" + project + ", servicer=" + servicer + ", bidDoc=" + bidDoc
				+ ", status=" + status + ", deleteFlag=" + deleteFlag + ", bidReason=" + bidReason + ", contactNumber="
				+ contactNumber + ", bidTime=" + bidTime + "]";
	}

    
	
}
