package com.gddr.mybysj.service;

import java.util.List;

import com.gddr.mybysj.entities.Employee;

public interface EmployeeService {
 	
	List<Employee> getAll();
	
	Employee getEmployeeById(Integer id);
	
    Boolean updateEmployee(Employee employee);
   
    Boolean deleteEmployee(Integer id);
	
    Boolean addEmployee(Employee employee);
    
    Boolean isExistByName(String name);

}
