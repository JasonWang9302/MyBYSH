package com.gddr.mybysj.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gddr.mybysj.dao.UserDao;
import com.gddr.mybysj.entities.User;
import com.gddr.mybysj.service.UserService;
@Service
public class UserServiceImpl implements UserService {
    @Autowired
	private UserDao userDao;
	
	@Override
	public User userLogin(String userName, String password) {
		User user=userDao.getUserByName(userName);
		if(user==null){
			//或者手机号做账号登录
		   user=userDao.getUserByPhone(userName);
		}
		if(user!=null&&user.getPassword().equals(password)){
			return user;
		}
		else return null;
	}

	@Override
	public Boolean userRegister(User user) {
		if(userDao.getUserByName(user.getUserName())!=null){
			//用户名已存在
			return false;
		}
		return userDao.addOrUpdate(user);
	}

	
	@Override
	public Boolean verifyUserName(String userName) {
		if(userDao.getUserByName(userName)==null){
			return true;
		}
		return false;
	}

	@Override
	public User getUserById(Integer id) {
		
		return userDao.getUserById(id);
	}

}
