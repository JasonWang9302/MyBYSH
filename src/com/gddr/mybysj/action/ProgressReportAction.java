package com.gddr.mybysj.action;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.gddr.mybysj.entities.ProgressReport;
import com.gddr.mybysj.entities.Project;
import com.gddr.mybysj.service.ProgressReportService;
import com.gddr.mybysj.service.ProjectService;
import com.opensymphony.xwork2.ModelDriven;

@Controller
public class ProgressReportAction extends BaseAction implements ModelDriven<ProgressReport> {
	@Autowired
	private ProgressReportService progressReportService;
	private ProgressReport model;
	@Autowired
	private ProjectService projectService;

	/*进度汇报*/
	public void prepareDoPgReport(){

		model =new  ProgressReport();
	}
	public String doPgReport(){
		
		System.out.println(model);
		model.setCommitTime(new Date());
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
