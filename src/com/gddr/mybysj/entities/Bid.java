package com.gddr.mybysj.entities;
/**
 * 投标实体类
 * @author Administrator
 *
 */
public class Bid {

    private Integer bidId;
    private Project project;
    private User  servicer;
    private Enclosure bidDoc;
    private Integer status;//012 未选 中标  落标
    private Integer deleteFlag;
	public Bid() {
		super();
	}
	public Bid(Project project, User servicer, Enclosure bidDoc, Integer status, Integer deleteFlag) {
		super();
		this.project = project;
		this.servicer = servicer;
		this.bidDoc = bidDoc;
		this.status = status;
		this.deleteFlag = deleteFlag;
	}
	public Bid(Integer bidId, Project project, User servicer, Enclosure bidDoc, Integer status, Integer deleteFlag) {
		super();
		this.bidId = bidId;
		this.project = project;
		this.servicer = servicer;
		this.bidDoc = bidDoc;
		this.status = status;
		this.deleteFlag = deleteFlag;
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
	public Enclosure getBidDoc() {
		return bidDoc;
	}
	public void setBidDoc(Enclosure bidDoc) {
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
	@Override
	public String toString() {
		return "Bid [bidId=" + bidId + ", project=" + project + ", servicer=" + servicer + ", bidDoc=" + bidDoc
				+ ", status=" + status + ", deleteFlag=" + deleteFlag + "]";
	}
    
    
	
}
