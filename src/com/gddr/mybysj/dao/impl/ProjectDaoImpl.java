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
		String hql="From Project  p left outer join fetch p.category left outer join fetch p.publisher left outer join fetch p.servicer";
		List<Project> proList=getSession().createQuery(hql).list();
		return proList;
	}


	@Override
	public List<Project> getCheckedProject() {
		String hql="From Project p left outer join fetch p.category left outer join fetch p.publisher left outer join fetch p.servicer where status>0 and p.deleteFlag!=?";
		List<Project> proList=getSession().createQuery(hql).setInteger(0, 1).list();
		System.out.println(proList);
		return proList;
	}


	@Override
	public List<Project> getProjectByPubAndStatus(User user, Integer status) {
		String hql="From Project p left outer join fetch p.category left outer join fetch p.publisher left outer join fetch p.servicer  where p.publisher=? and Status=? and p.deleteFlag != ?";
		List<Project> proList=getSession().createQuery(hql).setEntity(0, user).setInteger(1, status).setInteger(2, 1).list();
		return proList;
	}


	@Override
	public List<Project> getProjectBySerAndStatus(User user, Integer status) {
		String hql="From Project p left outer join fetch p.category left outer join fetch p.publisher left outer join fetch p.servicer where p.servicer=? and Status=?";
		List<Project> proList=getSession().createQuery(hql).setEntity(0, user).setInteger(1, status).list();
		return proList;
	}


	@Override
	public Project getProjectById(Integer id) {
		String hql="From Project p left outer join fetch p.category left outer join fetch p.publisher left outer join fetch p.servicer where  p.proId=?";
		Project project=(Project) getSession().createQuery(hql).setInteger(0, id).uniqueResult();
		return project;
	}
	
	
	
	//
	/*public List getProjectWithBidCountById(Integer id){
   String hql="select count(b.project.proId),p from Project p,Bid b where p.proId=b.project.proId and p.proId=? group by b.project.proId";		
     //  String hql="select Count(b.project.proId) from Bid b where b.project.proId=? group by b.project.proId";		
      //  String hql="select  count(b.project_id),p.* from t_project p  join t_bid b where p.PRO_ID=b.PROJECT_id and p.pro_id=? GROUP BY b.PROJECT_id;";		
		
		List<Object> list=getSession().createQuery(hql).setInteger(0, id).list();
		for (Object object : list) {
             
             System.out.println(object);
         }
		return list;
	}*/
	
	
	
}
