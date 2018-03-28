package com.gddr.mybysj.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gddr.mybysj.dao.ProjectDao;
import com.gddr.mybysj.dao.UserDao;
import com.gddr.mybysj.entities.Project;
import com.gddr.mybysj.entities.User;
import com.gddr.mybysj.service.ProjectService;

@Service
public class ProjectServiceImpl implements ProjectService {
	@Autowired
	private ProjectDao projectDao;
	@Autowired
	private UserDao userDao;

	@Override
	public void publishPro(User publisher, Project project) {

		// 补充发布方和发布时间
		project.setPublisher(publisher);
		project.setCreateTime(new Date());

		projectDao.addProject(project);
	}

	//发布者对项目的逻辑删
	@Override
	public void logicDel(Integer proId) {
		Project project=projectDao.getProjectById(proId);
		project.setDeleteFlag(1);
		projectDao.update(project);
	}
	//服务者对项目的逻辑删
	public void servicerLogicDel(Integer proId) {
		Project project=projectDao.getProjectById(proId);
		project.setDeleteFlag(2);
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

	@Override
	public void chooseServicer(Integer proId, Integer userId) {
		        System.out.println("chooserServicer.......chooserServicer.......chooserServicer.......");
		        //把此项目servicer 投标者
				Project project=projectDao.getProjectById(proId);
				System.out.println("mmmm.............."+project);
				User servicer=userDao.getUserById(userId);
				project.setServicer(servicer);
				//把此项目status设成2 已选标 待开始
				project.setStatus(2);
				projectDao.update(project);
				System.out.println(project);
	}

	@Override
	public List<Project> getProjectWithPage(Integer first, Integer count) {
		return projectDao.getProjectWithPage(first, count);
	}

	@Override
	public List<Project> getAllProjectUnchecked() {
		// TODO Auto-generated method stub
		return projectDao.getAllProjectUnchecked();
	}

	@Override
	public List<Project> getProjectWithPageByRequirement(Integer first, Integer count, Integer cateId, Integer status,
			String keyword) {
		return projectDao.getProjectWithPageByRequirement(first,count,cateId,status,keyword);
	}

	/*@Override
	public List getProjectWithBidCountById(Integer id) {
		return projectDao.getProjectWithBidCountById(id);
	}*/

}
