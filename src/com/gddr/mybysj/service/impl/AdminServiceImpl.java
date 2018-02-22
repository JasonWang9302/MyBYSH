package com.gddr.mybysj.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gddr.mybysj.dao.AdminDao;
import com.gddr.mybysj.entities.Admin;
import com.gddr.mybysj.service.AdminService;
@Service
public class AdminServiceImpl implements AdminService {
     @Autowired 
     private AdminDao adminDao;
	
	@Override
	public boolean adminLogin(String name, String password) {
         Admin admin=adminDao.getAdminByName(name);
         
         if(admin.getPassword().equals(password)){
        	 return true;
         }
         else return false;
	}
}
