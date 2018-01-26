package com.gddr.mybysj.service;

import java.util.List;

import com.gddr.mybysj.entities.Category;

public interface CategoryService {

	List<Category> getAll();

	void add(Category cate);

	void del(Category cate);
}
