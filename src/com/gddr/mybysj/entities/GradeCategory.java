package com.gddr.mybysj.entities;
/**
 * 评价类别表  
 * @author Administrator
 *
 */

public class GradeCategory {

	private Integer gradeCateId;
	private Integer grade;
	public GradeCategory() {
		super();
	}
	public GradeCategory(Integer grade) {
		super();
		this.grade = grade;
	}
	public GradeCategory(Integer gradeCateId, Integer grade) {
		super();
		this.gradeCateId = gradeCateId;
		this.grade = grade;
	}
	public Integer getGradeCateId() {
		return gradeCateId;
	}
	public void setGradeCateId(Integer gradeCateId) {
		this.gradeCateId = gradeCateId;
	}
	public Integer getGrade() {
		return grade;
	}
	public void setGrade(Integer grade) {
		this.grade = grade;
	}
	@Override
	public String toString() {
		return "GradeCategory [gradeCateId=" + gradeCateId + ", grade=" + grade + "]";
	}
	
	
}
