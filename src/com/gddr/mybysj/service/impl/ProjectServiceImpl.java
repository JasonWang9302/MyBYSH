package com.gddr.mybysj.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gddr.mybysj.dao.ProjectDao;
import com.gddr.mybysj.entities.Project;
import com.gddr.mybysj.entities.User;
import com.gddr.mybysj.service.ProjectService;

@Service
public class ProjectServiceImpl implements ProjectService {
	@Autowired
	private ProjectDao projectDao;

	@Override
	public void publishPro(User publisher, Project project) {

		// 补充发布方和发布时间
		project.setPublisher(publisher);
		project.setCreateTime(new Date());

		projectDao.addProject(project);
	}

	@Override
	public void logicDel(Integer proId) {
		Project project=projectDao.getProjectById(proId);
		project.setDeleteFlag(1);
		projectDao.update(project);
	}

	@Override
	public void updateProject(Project project) {

		projectDao.update(project);

	}

	@Override
	public List<Project> getAllProject() {
		return projectDao.getAllProject();
	}

	@Override
	public List<Project> getCheckedProject() {
		return projectDao.getCheckedProject();
	}

	@Override
	public List<Project> getProjectByPubAndStatus(User user, Integer status) {
		return projectDao.getProjectByPubAndStatus(user, status);
	}

	@Override
	public List<Project> getProjectBySerAndStatus(User user, Integer status) {
		return projectDao.getProjectBySerAndStatus(user, status);
	}

	@Override
	public Project getProjectById(Integer id) {
		return projectDao.getProjectById(id);
	}

}
