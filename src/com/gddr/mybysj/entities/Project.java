package com.gddr.mybysj.entities;

import java.util.Date;
/**
 * 项目类
 * @author Administrator
 */
public class Project {

	private Integer proId;
	private String proName;
	private String proDesc;
	private Date createTime;
	private Category category;
	private Date preDeliveryTime;//预定交付时间
	private User publisher;
	private User servicer;
	private String  rfp;//招标书
	private Integer status;//状态 01234 待审核  招标中   待开始   进行中    待结算    已完成
	private Integer deleteFlag;//逻辑删标记   0 未删除   1 被发布者删了
	private Date endTime;//结束时间 最后操作的时间 包括状态改变  逻辑删等；
	private Integer compensationRate;//赔率
	private Double  projectFund;//项目紫荆
	private Integer guaranteeStatus;//担保状态  ：双方是否交担保金 0 未  1需已 服未 2需未 服已  3已
	public Project() {
		super();
	}
	public Project(Integer proId, String proName, String proDesc, Date createTime, Category category,
			Date preDeliveryTime, User publisher, User servicer, String rfp, Integer status, Integer deleteFlag,
			Date endTime, Integer compensationRate, Double projectFund, Integer guaranteeStatus) {
		super();
		this.proId = proId;
		this.proName = proName;
		this.proDesc = proDesc;
		this.createTime = createTime;
		this.category = category;
		this.preDeliveryTime = preDeliveryTime;
		this.publisher = publisher;
		this.servicer = servicer;
		this.rfp = rfp;
		this.status = status;
		this.deleteFlag = deleteFlag;
		this.endTime = endTime;
		this.compensationRate = compensationRate;
		this.projectFund = projectFund;
		this.guaranteeStatus = guaranteeStatus;
	}
	public Project(String proName, String proDesc, Date createTime, Category category, Date preDeliveryTime,
			User publisher, User servicer, String rfp, Integer status, Integer deleteFlag, Date endTime,
			Integer compensationRate, Double projectFund, Integer guaranteeStatus) {
		super();
		this.proName = proName;
		this.proDesc = proDesc;
		this.createTime = createTime;
		this.category = category;
		this.preDeliveryTime = preDeliveryTime;
		this.publisher = publisher;
		this.servicer = servicer;
		this.rfp = rfp;
		this.status = status;
		this.deleteFlag = deleteFlag;
		this.endTime = endTime;
		this.compensationRate = compensationRate;
		this.projectFund = projectFund;
		this.guaranteeStatus = guaranteeStatus;
	}
	public Integer getProId() {
		return proId;
	}
	public void setProId(Integer proId) {
		this.proId = proId;
	}
	public String getProName() {
		return proName;
	}
	public void setProName(String proName) {
		this.proName = proName;
	}
	public String getProDesc() {
		return proDesc;
	}
	public void setProDesc(String proDesc) {
		this.proDesc = proDesc;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	public Date getPreDeliveryTime() {
		return preDeliveryTime;
	}
	public void setPreDeliveryTime(Date preDeliveryTime) {
		this.preDeliveryTime = preDeliveryTime;
	}
	public User getPublisher() {
		return publisher;
	}
	public void setPublisher(User publisher) {
		this.publisher = publisher;
	}
	public User getServicer() {
		return servicer;
	}
	public void setServicer(User servicer) {
		this.servicer = servicer;
	}
	public String getRfp() {
		return rfp;
	}
	public void setRfp(String rfp) {
		this.rfp = rfp;
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
	public Date getEndTime() {
		return endTime;
	}
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	public Integer getCompensationRate() {
		return compensationRate;
	}
	public void setCompensationRate(Integer compensationRate) {
		this.compensationRate = compensationRate;
	}
	public Double getProjectFund() {
		return projectFund;
	}
	public void setProjectFund(Double projectFund) {
		this.projectFund = projectFund;
	}
	public Integer getGuaranteeStatus() {
		return guaranteeStatus;
	}
	public void setGuaranteeStatus(Integer guaranteeStatus) {
		this.guaranteeStatus = guaranteeStatus;
	}
	@Override
	public String toString() {
		return "Project [proId=" + proId + ", proName=" + proName + ", proDesc=" + proDesc + ", createTime="
				+ createTime + ", category=" + category + ", preDeliveryTime=" + preDeliveryTime + ", publisher="
				+ publisher + ", servicer=" + servicer + ", rfp=" + rfp + ", status=" + status + ", deleteFlag="
				+ deleteFlag + ", endTime=" + endTime + ", compensationRate=" + compensationRate + ", projectFund="
				+ projectFund + ", guaranteeStatus=" + guaranteeStatus + "]";
	}
	
	
}
