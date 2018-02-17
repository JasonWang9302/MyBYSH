package com.gddr.mybysj.action;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.gddr.mybysj.entities.User;
import com.gddr.mybysj.service.UserService;
import com.opensymphony.xwork2.ModelDriven;

@Controller
public class UserAction extends BaseAction implements ModelDriven<User> {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Autowired
	private UserService userService;
	private User model;
	private InputStream inputStream;

	public InputStream getInputStream() {
		return inputStream;
	}

	/* 用户注册 */
	public void prepareDoReg() {
		model = new User();
	}

	public String doReg() throws IOException {
		model.setGrades(5.0);
		if (userService.userRegister(model)) {
			response.setContentType("text/hmtl;charset=utf-8");
			request.setAttribute("tipMessage", "注册成功！请您登陆");
			return "toLogin";
		} else
			return null;
	}

	public String toLogin() {
		System.out.println(request.getParameter("proId"));
		System.out.println("---------toLogin()------------");
		return "toLogin";
	}

	/* 用户登陆 */
	public void prepareDoLogin() {
		model = new User();
	}

	public String doLogin() {
		System.out.println("dologin()");
		User user = userService.userLogin(model.getUserName(), model.getPassword());
		if (user != null) {
			System.out.println("currUser:" + user);
			session.setAttribute("currUser", user);
			return "index";
		} else
			response.setContentType("text/hmtl;charset=utf-8");
		request.setAttribute("tipMessage", "用户名或密码错误！");
		return "toLogin";
	}

	/* 异步验证用户名是否可用 */
	public String verifyUserName() throws UnsupportedEncodingException {
		Boolean isOk = userService.verifyUserName(model.getUserName());
		if (isOk) {
			inputStream = new ByteArrayInputStream("yes".getBytes("UTF-8"));
		} else
			inputStream = new ByteArrayInputStream("no".getBytes("UTF-8"));
		return "verifyName";
	}

	public void prepareVerifyUserName() {
		model = new User();
	}

	public String logout() {
		session.removeAttribute("currUser");
		return "index";
	}

	@Override
	public void prepare() throws Exception {

	}

	@Override
	public User getModel() {
		return model;
	}

}
