package com.gddr.mybysj.dao.impl;

import org.springframework.stereotype.Repository;

import com.gddr.mybysj.dao.AdminDao;
import com.gddr.mybysj.dao.BaseDao;
import com.gddr.mybysj.entities.Admin;
@Repository
public class AdminDaoImpl extends BaseDao implements AdminDao {

	@Override
	public Admin getAdminByName(String name) {
       String hql="From Admin where adminName = ?";
       Admin admin= (Admin) getSession().createQuery(hql).setString(0, name).uniqueResult();
       return admin;
	}

}
