package com.gddr.mybysj.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gddr.mybysj.dao.CategoryDao;
import com.gddr.mybysj.entities.Category;
import com.gddr.mybysj.service.CategoryService;
@Service
public class CategoryServiceImpl implements CategoryService{

	@Autowired
	private CategoryDao categoryDao;
	@Override
	public List<Category> getAll() {
		return categoryDao.getAll();
	}

	@Override
	public void add(Category cate) {
       categoryDao.add(cate);		
	}

	@Override
	public void del(Category cate) {
		categoryDao.del(cate);
	}

	
	
}
