package com.gddr.mybysj.dao;

import java.util.List;

import com.gddr.mybysj.entities.Category;

public interface CategoryDao {
       List<Category> getAll();
       
       void add(Category cate);
       
       void del(Category cate);
	 
}
