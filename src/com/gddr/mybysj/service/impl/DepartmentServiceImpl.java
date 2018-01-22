package com.gddr.mybysj.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gddr.mybysj.dao.DepartmentDao;
import com.gddr.mybysj.entities.Department;
import com.gddr.mybysj.service.DepartmentService;

@Service
public class DepartmentServiceImpl implements DepartmentService {
	@Autowired
	private DepartmentDao departmentDao;

	@Override
	public List<Department> getDepartmentList() {
		return departmentDao.getDepartmentList();
	}

}
