package com.gddr.mybysj.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gddr.mybysj.dao.EmployeeDao;
import com.gddr.mybysj.entities.Employee;

@Repository
public class EmployeeDaoImpl implements EmployeeDao {

	@Autowired
	private SessionFactory sessionFactory;

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	@Override
	public List<Employee> getAll() {
		String hql = "from Employee e left outer join fetch e.department";
		List list = (List) getSession().createQuery(hql).list();
		// System.out.println(list);
		
		return list;
	}

	@Override
	public Employee getEmployeeById(Integer id) {
		String hql = "From Employee where id=?";
		Employee employee=(Employee) getSession().createQuery(hql).setInteger(0, id).uniqueResult();
        System.out.println("employee:"+employee);
		return employee;
	}

	@Override
	public Boolean add(Employee employee) {
		/* String hql="insert into Employee "; */
		getSession().save(employee);
		return true;
	}

	@Override
	public Boolean update(Employee employee) {
		getSession().update(employee);
		return true;
	}

	@Override
	public Boolean delete(Integer id) {
		String hql = "delete Employee where id=?";
		System.out.println("---");
		int result = getSession().createQuery(hql).setInteger(0, id).executeUpdate();
		System.out.println(result);
		if (result == 0) {
			return false;
		}
		return true;
	}

	@Override
	public Boolean isExistByName(String name) {
		String hql = "From Employee where lastName=?";
		
		
		int num = getSession().createQuery(hql).setString(0, name).list().size();
		System.out.println(num);

		if (num >= 1) {
			return true;
		}
		return false;
	}

}
