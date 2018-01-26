package com.gddr.mybysj.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.gddr.mybysj.dao.BaseDao;
import com.gddr.mybysj.dao.CategoryDao;
import com.gddr.mybysj.entities.Category;

@Repository
public class CategoryDaoImpl extends BaseDao implements CategoryDao {

	@Override
	public List<Category> getAll() {
		String hql = "From Category";
		List<Category> list = getSession().createQuery(hql).list();
		return list;
	}

	@Override
	public void add(Category cate) {
        getSession().save(cate);
	
	}

	@Override
	public void del(Category cate) {
		getSession().delete(cate);

	}

}
