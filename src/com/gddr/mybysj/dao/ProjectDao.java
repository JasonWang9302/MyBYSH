package com.gddr.mybysj.dao;

import java.util.List;

import com.gddr.mybysj.entities.Project;
import com.gddr.mybysj.entities.User;

public interface ProjectDao {

	void addProject(Project project);

	void update(Project project);

	List<Project> getAllProject();

	// 得到已审核通过项目 主要用于网站显示
	List<Project> getCheckedProject();
	
	//管理员得到未审核项目列表
	List<Project> getAllProjectUnchecked();

	// 主要用于发布者个人中心显示 对应状态的项目
	List<Project> getProjectByPubAndStatus(User user, Integer status);
	
	// 主要用于服务者个人中心显示 对应状态的项目
	List<Project> getProjectBySerAndStatus(User user, Integer status);
//
	Project getProjectById(Integer id);
	
	//带有已投标数的新实体
/*	public List getProjectWithBidCountById(Integer id);*/
	//分页得到项目  first本页起始行   count本页显示多少条
	List<Project> getProjectWithPage(Integer first,Integer count);
	
	
	
	List<Project> getProjectWithPageByRequirement(Integer first,Integer count,Integer cateId,Integer status,String keyword);
}
