package com.gddr.mybysj.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.gddr.mybysj.dao.BaseDao;
import com.gddr.mybysj.dao.ProjectDao;
import com.gddr.mybysj.entities.Project;
import com.gddr.mybysj.entities.User;
@Repository
public class ProjectDaoImpl extends BaseDao implements ProjectDao {

	@Override
	public void addProject(Project project) {
		getSession().save(project);
	}


	@Override
	public void update(Project project) {
		getSession().update(project);
	}


	@Override
	public List<Project> getAllProject() {
		String hql="From Project";
		List<Project> proList=getSession().createQuery(hql).list();
		return proList;
	}


	@Override
	public List<Project> getCheckedProject() {
		String hql="From Project where status>0";
		List<Project> proList=getSession().createQuery(hql).list();
		return proList;
	}


	@Override
	public List<Project> getProjectByPubAndStatus(User user, Integer status) {
		String hql="From Project where publisher=? and Status>?";
		List<Project> proList=getSession().createQuery(hql).setEntity(0, user).setInteger(1, status).list();
		return proList;
	}


	@Override
	public List<Project> getProjectBySerAndStatus(User user, Integer status) {
		String hql="From Project where servicer=? and Status>?";
		List<Project> proList=getSession().createQuery(hql).setEntity(0, user).setInteger(1, status).list();
		return proList;
	}
	
}
