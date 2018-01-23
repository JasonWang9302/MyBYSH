package com.gddr.mybysj.entities;

import java.util.Date;

/**
 * 评论实体类
 * 
 * @author Administrator
 *
 */
public class Comment {
	private Integer commId;
	private String commContext;
	private Project project;
	private User servicer;
	private GradeCategory gradeCategory;//评论类别  为了得到加减分
	private Date commTime;

	public Comment() {
		super();
	}

	public Comment(String commContext, Project project, User servicer, GradeCategory gradeCategory, Date commTime) {
		super();
		this.commContext = commContext;
		this.project = project;
		this.servicer = servicer;
		this.gradeCategory = gradeCategory;
		this.commTime = commTime;
	}

	public Comment(Integer commId, String commContext, Project project, User servicer, GradeCategory gradeCategory,
			Date commTime) {
		super();
		this.commId = commId;
		this.commContext = commContext;
		this.project = project;
		this.servicer = servicer;
		this.gradeCategory = gradeCategory;
		this.commTime = commTime;
	}

	public Integer getCommId() {
		return commId;
	}

	public void setCommId(Integer commId) {
		this.commId = commId;
	}

	public String getCommContext() {
		return commContext;
	}

	public void setCommContext(String commContext) {
		this.commContext = commContext;
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

	public GradeCategory getGradeCategory() {
		return gradeCategory;
	}

	public void setGradeCategory(GradeCategory gradeCategory) {
		this.gradeCategory = gradeCategory;
	}

	public Date getCommTime() {
		return commTime;
	}

	public void setCommTime(Date commTime) {
		this.commTime = commTime;
	}

	@Override
	public String toString() {
		return "Comment [commId=" + commId + ", commContext=" + commContext + ", project=" + project + ", servicer="
				+ servicer + ", gradeCategory=" + gradeCategory + ", commTime=" + commTime + "]";
	}

}
