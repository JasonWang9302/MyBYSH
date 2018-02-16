package com.gddr.mybysj.action;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.gddr.mybysj.entities.ProgressReport;
import com.gddr.mybysj.entities.Project;
import com.gddr.mybysj.service.ProgressReportService;
import com.gddr.mybysj.service.ProjectService;
import com.gddr.mybysj.util.ProjectDataResponse;
import com.opensymphony.xwork2.ModelDriven;

@Controller
public class ProgressReportAction extends BaseAction implements ModelDriven<ProgressReport> {
	@Autowired
	private ProgressReportService progressReportService;
	private ProgressReport model;
	@Autowired
	private ProjectService projectService;
	private ProjectDataResponse projectDataResponse;

	public ProjectDataResponse getProjectDataResponse() {
		return projectDataResponse;
	}

	public void setProjectDataResponse(ProjectDataResponse projectDataResponse) {
		this.projectDataResponse = projectDataResponse;
	}

	/* 去显示汇报列表界面 */
	public String toShowPgReList() {
		request.setAttribute("proId", request.getParameter("proId"));
		return "toShowPgReList";
	}

	/* 进度汇报列表 渲染 */
	public String showPgReportList() {
		Integer proId = Integer.parseInt(request.getParameter("proId"));
		System.out.println("showPgReportList......"+proId);
		List<ProgressReport> pgReList = progressReportService.getProgressReportListByProId(proId);
		System.out.println(pgReList);
		projectDataResponse = new ProjectDataResponse();
		projectDataResponse.setCode(0);
		projectDataResponse.setMsg("收到了。。。");
		projectDataResponse.setCount(pgReList.size());
		projectDataResponse.setData(pgReList);
		System.out.println(projectDataResponse);
		return "showPgReportList";
	}

	/* 进度汇报 */
	public void prepareDoPgReport() {

		model = new ProgressReport();
	}

	public String doPgReport() {

		System.out.println(model);
		model.setCommitTime(new Date());
		//判断提交的是否是最后的验收文件
		if(model.getIsAcceptFile()==1){
			Integer proId=model.getProject().getProId();
			Project project=projectService.getProjectById(proId);
			project.setStatus(4);
			projectService.updateProject(project);			
		}
		progressReportService.addProgressReport(model);
		request.setAttribute("tipMessage", "进度汇报提交成功！");
		return "doPgReport";
	}

	/* 跳转到提交汇报 */
	public String toPgReport() {
		Integer proId = Integer.parseInt(request.getParameter("proId"));
		Project project = projectService.getProjectById(proId);
		request.setAttribute("project", project);
		System.out.println("toPgRe......." + project);
		return "toPgReport";
	}

	@Override
	public void prepare() throws Exception {
	}

	@Override
	public ProgressReport getModel() {
		return model;
	}

}
