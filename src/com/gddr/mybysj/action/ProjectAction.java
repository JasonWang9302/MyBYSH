package com.gddr.mybysj.action;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.gddr.mybysj.entities.Category;
import com.gddr.mybysj.entities.Project;
import com.gddr.mybysj.entities.User;
import com.gddr.mybysj.service.CategoryService;
import com.gddr.mybysj.service.ProjectService;
import com.gddr.mybysj.util.ProjectDataResponse;
import com.opensymphony.xwork2.ModelDriven;

@Controller
public class ProjectAction extends BaseAction implements ModelDriven<Project> {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Autowired
	private ProjectService projectService;
	@Autowired
	private CategoryService categoryService;
	private Project model;

	private Integer proId;

	public void setProId(Integer proId) {
		this.proId = proId;
	}

	// ajax
	private InputStream inputStream;

	public InputStream getInputStream() {
		return inputStream;
	}

	public void preparePublish() {
		System.out.println("---------preparePublish-----------");
		model = new Project();
	}

	public String publish() {
		System.out.println("---------publish---------");
		User currUser = (User) session.getAttribute("currUser");
		System.out.println(currUser);

		model.setPublisher(currUser);
		model.setCreateTime(new Date());
		model.setDeleteFlag(0);
		model.setStatus(0);

		projectService.publishPro(currUser, model);

		response.setContentType("text/hmtl;charset=utf-8");
		request.setAttribute("tip", "发布成功！我们的工作人员将在24小时内审核");

		System.out.println(model);
		return "publish";
	}

	/* 去发布 */
	public String toPublish() {
		System.out.println("----------toPublish-----------");
		List<Category> list = categoryService.getAll();
		System.out.println(list);
		request.setAttribute("cateList", list);

		return "toPublish";
	}

	public String showProjectList() {
		List<Project> list = projectService.getCheckedProject();
		request.setAttribute("projectList", list);
		return "showProjectList";
	}

	public String showDetail() {

		int proId = Integer.parseInt(request.getParameter("proId"));
		Project project = projectService.getProjectById(proId);
		request.setAttribute("project", project);
		System.out.println("-------------" + project);
		return "showDetail";
	}

	/* 以下是个人中心业务 */
	/* 显示待审核项目list */
	public String showMyPublishDSH() {

		User user = (User) session.getAttribute("currUser");
		List<Project> list = projectService.getProjectByPubAndStatus(user, 0);
		request.setAttribute("projectList", list);
		return "showMyPublishDSH";
	}

	/* 用户逻辑删项目 */
	public String logicDelProject() throws UnsupportedEncodingException {
		Integer proId = Integer.parseInt(request.getParameter("proId"));
		System.out.println("logicDel...Proid:" + proId);
		projectService.logicDel(proId);
		inputStream = new ByteArrayInputStream("1".getBytes("UTF-8"));
		return "logicDelProject";
	}

	/* 用户待审核 去 编辑 */
	public String toEditProject() {
		List<Category> list = categoryService.getAll();
		request.setAttribute("cateList", list);
		Integer proId = Integer.parseInt(request.getParameter("proId"));
		Project project = projectService.getProjectById(proId);
		request.setAttribute("project", project);
		return "toEditProject";
	}

	/* 用户待审核 做 编辑 */

	public void prepareUpdateProject() {
		model = projectService.getProjectById(proId);
		System.out.println(model);
	}

	public String updateProject() {
		System.out.println(model);
		projectService.updateProject(model);
		response.setContentType("text/hmtl;charset=utf-8");
		request.setAttribute("tipMessage", "修改成功！请等待审核");
		return "updateProject";
	}

	@Override
	public void prepare() throws Exception {

	}

	@Override
	public Project getModel() {
		System.out.println("---------getModel-----------");
		return model;
	}

}
