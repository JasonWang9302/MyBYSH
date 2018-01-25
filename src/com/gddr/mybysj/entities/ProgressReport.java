package com.gddr.mybysj.entities;
import java.util.Date;

/**
 * 进度汇报实体类
 * 
 * @author Administrator
 *
 */
public class ProgressReport {
	private Integer progRepId;
	private String progRepName;
	private String progRepDesc;
	private String progRepFile;
	private Project project;
	private Integer isAcceptFile;
	private Date commitTime;

	public ProgressReport() {
		super();
	}

	public ProgressReport(String progPRepName, String progRepDesc, String progRepFile, Project project,
			Integer isAcceptFile, Date commitTime) {
		super();
		this.progRepName = progPRepName;
		this.progRepDesc = progRepDesc;
		this.progRepFile = progRepFile;
		this.project = project;
		this.isAcceptFile = isAcceptFile;
		this.commitTime = commitTime;
	}

	public ProgressReport(Integer progRepId, String progPRepName, String progRepDesc, String progRepFile,
			Project project, Integer isAcceptFile, Date commitTime) {
		super();
		this.progRepId = progRepId;
		this.progRepName = progPRepName;
		this.progRepDesc = progRepDesc;
		this.progRepFile = progRepFile;
		this.project = project;
		this.isAcceptFile = isAcceptFile;
		this.commitTime = commitTime;
	}

	public Integer getProgRepId() {
		return progRepId;
	}

	public void setProgRepId(Integer progRepId) {
		this.progRepId = progRepId;
	}

	public String getProgRepName() {
		return progRepName;
	}

	public void setProgRepName(String progRepName) {
		this.progRepName = progRepName;
	}

	public String getProgRepDesc() {
		return progRepDesc;
	}

	public void setProgRepDesc(String progRepDesc) {
		this.progRepDesc = progRepDesc;
	}

	public String getProgRepFile() {
		return progRepFile;
	}

	public void setProgRepFile(String progRepFile) {
		this.progRepFile = progRepFile;
	}

	public Project getProject() {
		return project;
	}

	public void setProject(Project project) {
		this.project = project;
	}

	public Integer getIsAcceptFile() {
		return isAcceptFile;
	}

	public void setIsAcceptFile(Integer isAcceptFile) {
		this.isAcceptFile = isAcceptFile;
	}

	public Date getCommitTime() {
		return commitTime;
	}

	public void setCommitTime(Date commitTime) {
		this.commitTime = commitTime;
	}

	@Override
	public String toString() {
		return "ProgressReport [progRepId=" + progRepId + ", progPRepName=" + progRepName + ", progRepDesc="
				+ progRepDesc + ", progRepFile=" + progRepFile + ", project=" + project + ", isAcceptFile="
				+ isAcceptFile + ", commitTime=" + commitTime + "]";
	}

}
