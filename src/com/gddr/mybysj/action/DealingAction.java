package com.gddr.mybysj.action;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.gddr.mybysj.dao.UserDao;
import com.gddr.mybysj.entities.Dealing;
import com.gddr.mybysj.entities.Project;
import com.gddr.mybysj.entities.User;
import com.gddr.mybysj.service.DealingService;
import com.gddr.mybysj.service.ProjectService;
import com.gddr.mybysj.service.UserService;
import com.opensymphony.xwork2.ModelDriven;

@Controller
public class DealingAction extends BaseAction implements ModelDriven<Dealing> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Dealing model;
	@Autowired
	private DealingService dealingService;
	@Autowired
	private ProjectService projectService;
	@Autowired
	private UserService userService;
	private Integer zfPassword;

	public Integer getZfPassword() {
		return zfPassword;
	}

	public void setZfPassword(Integer zfPassword) {
		this.zfPassword = zfPassword;
	}

	// 需求方去缴纳预付金
	public String toPayAdvance() {
		Integer proId = Integer.parseInt(request.getParameter("proId"));
		Project project = projectService.getProjectById(proId);
		System.out.println("............................." + project);
		request.setAttribute("project", project);
		System.out.println("toPayAdvance......" + project);
		return "toPayAdvance";
	}
	
	public String toPayMargin() {
		Integer proId = Integer.parseInt(request.getParameter("proId"));
		Project project = projectService.getProjectById(proId);
		System.out.println("............................." + project);
		request.setAttribute("project", project);
		System.out.println("toPayAdvance......" + project);
		return "toPayMargin";
	}

	// 需求方缴纳预付金
	public String payAdvance() {
		System.out.println("payAdvance.."+request.getParameter("proId"));
		Integer proId=Integer.parseInt(request.getParameter("proId"));
		Project project=projectService.getProjectById(proId);
		User user=(User) session.getAttribute("currUser");
		User pt=userService.getUserByName("平台账户");
		if(zfPassword.equals(Integer.parseInt(user.getPayPassword()))){
			dealingService.addDealing(project, "预付项目金", project.getProjectFund(), user, pt);
			request.setAttribute("paySuccessTip", "支付成功！");
			System.out.println("完成");
			return "payAdvance";
		}
		else{
			request.setAttribute("payFailTip", "支付失败！");
			return "cw";
		}
	}
	// 需求方缴纳预付金
	public String payMargin() {
		System.out.println("payAdvance.."+request.getParameter("proId"));
		Integer proId=Integer.parseInt(request.getParameter("proId"));
		Project project=projectService.getProjectById(proId);
		User user=(User) session.getAttribute("currUser");
		User pt=userService.getUserByName("平台账户");
		if(zfPassword.equals(Integer.parseInt(user.getPayPassword()))){
			dealingService.addDealing(project, "保证金", project.getProjectFund(), user, pt);
			request.setAttribute("paySuccessTip", "支付成功！");
			System.out.println("完成");
			return "payMargin";
		}
		else{
			request.setAttribute("payFailTip", "支付失败！");
			return "cw";
		}
	}

	@Override
	public void prepare() throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public Dealing getModel() {
		// TODO Auto-generated method stub
		return model;
	}

}
