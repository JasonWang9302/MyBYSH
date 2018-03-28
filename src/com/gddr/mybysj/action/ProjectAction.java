package com.gddr.mybysj.action;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.gddr.mybysj.dao.impl.ProjectDaoImpl;
import com.gddr.mybysj.entities.Bid;
import com.gddr.mybysj.entities.Category;
import com.gddr.mybysj.entities.Project;
import com.gddr.mybysj.entities.User;
import com.gddr.mybysj.service.BidService;
import com.gddr.mybysj.service.CategoryService;
import com.gddr.mybysj.service.ProjectService;
import com.gddr.mybysj.service.UserService;
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
	@Autowired
	private BidService bidService;
	private Project model;
	private Integer proId;
	
	
	/*private Integer cateId;
	
	private Integer status;*/
	//返回json
	private ProjectDataResponse projectDataResponse;
	public void setProjectDataResponse(ProjectDataResponse projectDataResponse) {
		this.projectDataResponse = projectDataResponse;
	}

	public void setProId(Integer proId) {
		this.proId = proId;
	}

	// ajax
	private InputStream inputStream;

	public InputStream getInputStream() {
		return inputStream;
	}
	
	//显示所有待审核项目
    public String showAllUnchecked(){
    	projectDataResponse=new ProjectDataResponse();
		List<Project> list=null;
		list=projectService.getAllProjectUnchecked();
		projectDataResponse.setCode(0);
		projectDataResponse.setMsg("收到了。。。");
		projectDataResponse.setCount(list.size());
		projectDataResponse.setData(list);
		System.out.println(projectDataResponse);
		
		return "showAllUnchecked";
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
		model.setGuaranteeStatus(0);

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
		//System.out.println(list);
		request.setAttribute("cateList", list);

		if(session.getAttribute("currUser")==null){
			
			return "toLogin";
		}
		
		return "toPublish";
	}

	public String showProjectList() {
		List<Project> list = projectService.getCheckedProject();
		request.setAttribute("projectList", list);
		request.setAttribute("count", list.size());
		return "showProjectList";
	}

	public String showProjectListByPage() {
		//User user = (User) session.getAttribute("currUser");
		projectDataResponse=new ProjectDataResponse();
		List<Project> list=null;
		
		Integer curr=Integer.parseInt(request.getParameter("curr"));
		Integer limit=Integer.parseInt(request.getParameter("limit"));
		Integer cateId=null;
		Integer status=null;
		if(!request.getParameter("cateId").equals("-1")){
			 cateId=Integer.parseInt(request.getParameter("cateId"));
		}
		if(!request.getParameter("status").equals("-1")){
			status=Integer.parseInt(request.getParameter("status"));
		}

		String keyWord=request.getParameter("keyWord");
		System.out.println("cateId:"+request.getAttribute("cateId"));
	    Integer first=(curr-1)*limit;
		System.out.println(limit+" "+first);
		
		list=projectService.getProjectWithPageByRequirement(first, limit, cateId, status, keyWord);
		
		projectDataResponse.setCode(0);
		projectDataResponse.setMsg("收到了。。。");
		projectDataResponse.setData(list);
		
		System.out.println(projectDataResponse);
		//不分页情况下看此条件下有多少数据 传到前台供算总页码
		list=projectService.getProjectWithPageByRequirement(null, null, cateId, status, keyWord);
		projectDataResponse.setCount(list.size());
		request.setAttribute("count", list.size());
		System.out.println(request.getAttribute("count"));
		return "showProjectListByPage";
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
	/* 服务方逻辑删项目  完成记录中的删除*/
	public String servicerLogicDelProject() throws UnsupportedEncodingException {
		Integer proId = Integer.parseInt(request.getParameter("proId"));
		System.out.println("logicDel...Proid:" + proId);
		projectService.servicerLogicDel(proId);
		inputStream = new ByteArrayInputStream("1".getBytes("UTF-8"));
		return "servicerLogicDelProject";
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

	
	
	/*个人中心部分*/
	 /* 相似方法 抽取通用代码 临时写在这 有时间整理到service层*/
	/*role 1 发布者   2服务者*/
	public void showByStatus(int role,Integer status){
		User user = (User) session.getAttribute("currUser");
		projectDataResponse=new ProjectDataResponse();
		List<Project> list=null;
		if(role==1){
			list=projectService.getProjectByPubAndStatus(user, status);
		}
		if(role==2){
			list=projectService.getProjectBySerAndStatus(user, status);
			System.out.println("role2,,,"+list);
		}
		projectDataResponse.setCode(0);
		projectDataResponse.setMsg("收到了。。。");
		projectDataResponse.setCount(list.size());
		projectDataResponse.setData(list);
		System.out.println(projectDataResponse);
	}
	//我的发布
	public String showDSH1() {
        showByStatus(1,0);//未审核的
		return "showDSH1";
	}
	public String showZBZ1() {
		showByStatus(1,1);//审核通过  招标中
		return "showZBZ1";
	}
	public String showDKS1() {
		showByStatus(1,2);//招完标 待交担保 待开始
		return "showDKS1";
	}
	public String showJXZ1() {
		showByStatus(1,3);//交完担保 进行中
		return "showJXZ1";
	}
	public String showDYS1() {
		showByStatus(1,4);//待验收
		return "showDYS1";
	}
	public String showYWC1() {
		showByStatus(1,5);//已完成
		return "showYWC1";
	}
	//我的任务
	/*public String showDSH2() {
        showByStatus(2,0);//未审核的
		return "showDSH2";
	}*/
	public String showTBZ2() {
		User user = (User) session.getAttribute("currUser");
		projectDataResponse=new ProjectDataResponse();
		List<Bid> list=null;
		list=bidService.getBidListByServicer(user);
		projectDataResponse.setCode(0);
		projectDataResponse.setMsg("收到了。。。");
		projectDataResponse.setCount(list.size());
		projectDataResponse.setData(list);
		System.out.println(projectDataResponse);
		return "showTBZ2";
	}
	public String showDKS2() {
		showByStatus(2,2);//已选标
		return "showDKS2";
	}
	public String showJXZ2() {
		showByStatus(2,3);//交完担保 进行中
		return "showJXZ2";
	}
	public String showDJS2() {
		showByStatus(2,4);//待结算
		return "showDJS2";
	}
	public String showYWC2() {
		showByStatus(2,5);//已完成
		return "showYWC2";
	}
	
	/*选标*/
	public String chooseServicer(){
		Integer userId=Integer.parseInt(request.getParameter("userId"));
		Integer proId=Integer.parseInt(request.getParameter("proId"));
	//System.out.println("proId:...................."+proId+"userId:"+userId);
		projectService.getProjectById(proId);
	//	System.out.println("-------");
		projectService.chooseServicer(proId, userId);
		return "chooseServicer";
	}
	
	
	
	
	
	//管理员审核需求
	public String adminCheckProject() throws UnsupportedEncodingException {
		Integer proId = Integer.parseInt(request.getParameter("proId"));
	    Project project=projectService.getProjectById(proId);
		project.setStatus(1);
		projectService.updateProject(project);
		inputStream = new ByteArrayInputStream("1".getBytes("UTF-8"));
		System.out.println(project);
		return "adminCheckProject";
	}
	
	
	
	
	public ProjectDataResponse getProjectDataResponse() {
		return projectDataResponse;
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
