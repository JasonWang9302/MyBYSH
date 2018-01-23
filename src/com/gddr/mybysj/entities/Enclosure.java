package com.gddr.mybysj.entities;
/**
 * 附件实体
 * @author Administrator
 *
 */
public class Enclosure {
	private Integer enclId;
	private String trueName;
	private String uploadName;
	public Enclosure() {
		super();
	}
	public Enclosure(String trueName, String uploadName) {
		super();
		this.trueName = trueName;
		this.uploadName = uploadName;
	}
	public Enclosure(Integer enclId, String trueName, String uploadName) {
		super();
		this.enclId = enclId;
		this.trueName = trueName;
		this.uploadName = uploadName;
	}
	public Integer getEnclId() {
		return enclId;
	}
	public void setEnclId(Integer enclId) {
		this.enclId = enclId;
	}
	public String getTrueName() {
		return trueName;
	}
	public void setTrueName(String trueName) {
		this.trueName = trueName;
	}
	public String getUploadName() {
		return uploadName;
	}
	public void setUploadName(String uploadName) {
		this.uploadName = uploadName;
	}
	@Override
	public String toString() {
		return "Enclosure [enclId=" + enclId + ", trueName=" + trueName + ", uploadName=" + uploadName + "]";
	}
	
	

}
