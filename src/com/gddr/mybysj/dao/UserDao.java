package com.gddr.mybysj.dao;

import com.gddr.mybysj.entities.User;

public interface UserDao {

	Boolean addOrUpdate(User user);

	User getUserById(Integer id);

	User getUserByName(String name);

	User getUserByPhone(String phone);

	Boolean deleteUser(User user);
}
