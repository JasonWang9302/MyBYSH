package com.gddr.mybysj.action;

import java.util.Date;

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
	private String pf;

	public String getPf() {
		return pf;
	}

	public void setPf(String pf) {
		this.pf = pf;
	}

	public Integer getZfPassword() {
		return zfPassword;
	}

	public void setZfPassword(Integer zfPassword) {
		this.zfPassword = zfPassword;
	}

	// 需求方去验收支付
	public String qrys() {
		System.out.println("payAdvance.." + request.getParameter("proId"));
		Integer proId = Integer.parseInt(request.getParameter("proId"));
		Project project = projectService.getProjectById(proId);
		project.setEndTime(new Date());
		User user = project.getServicer();
		User pt = userService.getUserByName("平台账户");
		request.setAttribute("project", project);
		if (zfPassword.equals(Integer.parseInt(user.getPayPassword()))) {
			// 之前项目金平台担保的记录状态跟新 保证金退还 已在service层写了 在此只写平台转钱到服务者就行
			dealingService.addDealing(project, "发布者确认验收", project.getProjectFund(), pt, user);

			User servicer = project.getServicer();
			Double grades = servicer.getGrades() + Double.parseDouble(pf);
			servicer.setGrades(grades);
			userService.saveOrUpdate(servicer);
			request.setAttribute("paySuccessTip", "已验收！");
			System.out.println("完成");
			return "qrys";
		} else {
			request.setAttribute("payFailTip", "密码错误！");
			return "cw";
		}
	}

	// 需求方去验收支付
	public String toQRYS() {
		Integer proId = Integer.parseInt(request.getParameter("proId"));
		Project project = projectService.getProjectById(proId);
		System.out.println("............................." + project);
		request.setAttribute("project", project);
		return "toQRYS";
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
		System.out.println("payAdvance.." + request.getParameter("proId"));
		Integer proId = Integer.parseInt(request.getParameter("proId"));
		Project project = projectService.getProjectById(proId);
		User user = (User) session.getAttribute("currUser");
		User pt = userService.getUserByName("平台账户");
		request.setAttribute("project", project);
		if (user.getPayPassword() == null) {

			request.setAttribute("payFailTip", "支付失败！请确认支付密码已设置");
			return "payAdvance";
		}
		if (zfPassword != null && zfPassword.equals(Integer.parseInt(user.getPayPassword()))) {
			dealingService.addDealing(project, "项目金平台担保", project.getProjectFund(), user, pt);
			request.setAttribute("paySuccessTip", "支付成功！");
			System.out.println("完成");
			return "payAdvance";
		} else if (user.getBalance() < project.getProjectFund()) {

			request.setAttribute("payFailTip", "支付失败！余额不足");
			return "payAdvance";
		} else {
			request.setAttribute("payFailTip", "支付失败！支付密码错误");
			return "payAdvance";
		}

	}

	// 服务方缴纳保证金
	public String payMargin() {
		System.out.println("payAdvance.." + request.getParameter("proId"));
		Integer proId = Integer.parseInt(request.getParameter("proId"));
		Project project = projectService.getProjectById(proId);
		User user = (User) session.getAttribute("currUser");
		User pt = userService.getUserByName("平台账户");
		request.setAttribute("project", project);
		if (user.getPayPassword() == null) {

			request.setAttribute("payFailTip", "支付失败！请确认支付密码已设置");
			return "payMargin";
		}
		
		if (zfPassword != null && zfPassword.equals(Integer.parseInt(user.getPayPassword()))) {
			dealingService.addDealing(project, "保证金平台担保", project.getCompensationRate(), user, pt);
			request.setAttribute("paySuccessTip", "支付成功！");
			System.out.println("完成");
			return "payMargin";
		} else if (user.getBalance() < project.getCompensationRate()) {

			request.setAttribute("payFailTip", "支付失败！余额不足");
			return "payMargin";
		} else {
			request.setAttribute("payFailTip", "支付失败！支付密码错误");
			return "payMargin";
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
