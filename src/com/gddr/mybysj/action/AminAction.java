package com.gddr.mybysj.action;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.gddr.mybysj.entities.Admin;
import com.gddr.mybysj.service.AdminService;
import com.opensymphony.xwork2.ModelDriven;

@Controller
public class AminAction extends BaseAction implements ModelDriven<Admin> {
	@Autowired
	private AdminService adminService;
	private Admin model;

	public void prepareAdminLogin() {
		model = new Admin();
	}

	public String adminLogin() {
		if (adminService.adminLogin(model.getAdminName(), model.getPassword())) {
			session.setAttribute("currAdmin", model);
			return "adminLogin";
		} else {
			request.setAttribute("failMsgTip", "用户名或密码错误");
			return "toAdminLogin";
		}
	}

	@Override
	public void prepare() throws Exception {
	}

	@Override
	public Admin getModel() {
		return model;
	}

	public void setModel(Admin model) {
		this.model = model;
	}
}
