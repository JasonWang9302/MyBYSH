package com.gddr.mybysj.dao.impl;

import org.springframework.stereotype.Repository;

import com.gddr.mybysj.dao.BaseDao;
import com.gddr.mybysj.dao.UserDao;
import com.gddr.mybysj.entities.User;
@Repository
public class UserDaoImpl extends BaseDao implements UserDao {

	@Override
	public Boolean addOrUpdate(User user) {
		try {
			getSession().saveOrUpdate(user);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@Override
	public User getUserById(Integer id) {
		String hql = "from User where userId=?";
		User user = (User) getSession().createQuery(hql).setInteger(0, id).uniqueResult();
		return user;
	}

	@Override
	public User getUserByName(String name) {
		String hql = "from User where userName=?";
		User user= (User) getSession().createQuery(hql).setString(0, name).uniqueResult();
		return user;
	}

	@Override
	public User getUserByPhone(String phone) {
		String hql = "from User where phone=?";
		User user = (User) getSession().createQuery(hql).setString(0, phone).uniqueResult();
		return user;
	}

	@Override
	public Boolean deleteUser(User user) {
		// TODO Auto-generated method stub
		return null;
	}

}
