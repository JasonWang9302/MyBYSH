package com.gddr.mybysj.service;

import java.util.List;

import com.gddr.mybysj.entities.Project;
import com.gddr.mybysj.entities.User;

public interface ProjectService {
	//发布项目
	void publishPro(User publisher,Project project);
	
	//各种修改操作 状态改变 选标等
	void updateProject(Project project);
	
	//用户逻辑删
	void logicDel(Integer proId);
	
	//供管理员得到所有项目
	List<Project> getAllProject();
	

	// 得到已审核通过项目 主要用于网站显示
	List<Project> getCheckedProject();

	// 用于个人中心我的发布显示 ,对应状态的项目
	List<Project> getProjectByPubAndStatus(User user, Integer status);

	// 用于个人中心我的发布显示 ,对应状态的项目
	List<Project> getProjectBySerAndStatus(User user, Integer status);
	
	//
	Project getProjectById(Integer id);
	
	//服务者对项目的逻辑删
	void servicerLogicDel(Integer proId);
	/*
	public List getProjectWithBidCountById(Integer id);*/
	
    void chooseServicer(Integer proId,Integer userId);
}
