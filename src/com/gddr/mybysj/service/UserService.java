package com.gddr.mybysj.service;

import com.gddr.mybysj.entities.User;

public interface UserService {
	
	User userLogin(String userName,String password);
	
	Boolean userRegister(User user);
	
	//验证用户名是否可用 可用true
	Boolean verifyUserName(String userName);
	
	
	User getUserById(Integer id);

}
