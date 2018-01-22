package com.gddr.mybysj.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gddr.mybysj.dao.EmployeeDao;
import com.gddr.mybysj.entities.Employee;
import com.gddr.mybysj.service.EmployeeService;


@Service
public class EmployeeServiceImpl implements EmployeeService{
	@Autowired
	private EmployeeDao employeeDao;

	@Override
	public List<Employee> getAll() {
		
		return employeeDao.getAll();
	}

	@Override
	public Boolean updateEmployee(Employee employee) {
		
		return employeeDao.update(employee);
	}

	@Override
	public Boolean deleteEmployee(Integer id) {
		return employeeDao.delete(id);
	}

	@Override
	public Boolean addEmployee(Employee employee) {
		 employeeDao.add(employee);
		 return true;
	}

	@Override
	public Boolean isExistByName(String name) {
		return employeeDao.isExistByName(name);
	}

	@Override
	public Employee getEmployeeById(Integer id) {
		return employeeDao.getEmployeeById(id);
	}
  
	
}
