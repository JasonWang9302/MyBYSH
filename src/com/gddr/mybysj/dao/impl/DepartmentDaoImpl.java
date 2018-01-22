package com.gddr.mybysj.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gddr.mybysj.dao.DepartmentDao;
import com.gddr.mybysj.entities.Department;

@Repository
public class DepartmentDaoImpl implements DepartmentDao {
	
	@Autowired
	private SessionFactory sessionFactory;

	private Session getSeesion() {
		

		return sessionFactory.getCurrentSession();
	}

	@Override
	public List<Department> getDepartmentList() {
		String hql = "from Department";
		System.out.println("    ");
		System.out.println("    ");
		System.out.println("    ");
		List<Department> list = getSeesion().createQuery(hql).list();
		return list;
	}

}
