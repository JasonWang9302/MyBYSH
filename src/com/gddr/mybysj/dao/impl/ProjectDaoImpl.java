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
		String hql="From Project where status>0 and deleteFlag!=?";
		List<Project> proList=getSession().createQuery(hql).list();
		System.out.println(proList);
		return proList;
	}


	@Override
	public List<Project> getProjectByPubAndStatus(User user, Integer status) {
		String hql="From Project p left outer join fetch p.category left outer join fetch p.publisher  where p.publisher=? and Status>? and p.deleteFlag != ?";
		List<Project> proList=getSession().createQuery(hql).setEntity(0, user).setInteger(1, status).setInteger(2, 1).list();
		return proList;
	}


	@Override
	public List<Project> getProjectBySerAndStatus(User user, Integer status) {
		String hql="From Project p left outer join fetch p.category where servicer=? and Status>?";
		List<Project> proList=getSession().createQuery(hql).setEntity(0, user).setInteger(1, status).list();
		return proList;
	}


	@Override
	public Project getProjectById(Integer id) {
		String hql="From Project p left outer join fetch p.category left outer join fetch p.publisher where  p.proId=?";
		Project proList=(Project) getSession().createQuery(hql).setInteger(0, id).uniqueResult();
		return proList;
	}
	
}
