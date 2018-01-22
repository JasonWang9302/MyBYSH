package com.gddr.mybysj.dao;



import java.util.List;

import com.gddr.mybysj.entities.Employee;



public interface EmployeeDao {
	
	
	public List<Employee> getAll();
	
	Employee getEmployeeById(Integer id);
	
	Boolean add(Employee employee);
	
	Boolean update(Employee employee);
	
	Boolean delete(Integer id);
	
	Boolean isExistByName(String name);

}
