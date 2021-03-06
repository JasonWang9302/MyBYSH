package com.gddr.mybysj.dao.impl;

import java.util.List;

import org.hibernate.Query;
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
		String hql = "From Project  p left outer join fetch p.category left outer join fetch p.publisher left outer join fetch p.servicer";
		List<Project> proList = getSession().createQuery(hql).list();
		return proList;
	}

	@Override
	public List<Project> getCheckedProject() {
		String hql = "From Project p left outer join fetch p.category left outer join fetch p.publisher left outer join fetch p.servicer where status>0 and p.deleteFlag!=?";
		List<Project> proList = getSession().createQuery(hql).setInteger(0, 1).list();
		System.out.println("checkedeProject........" + proList.size());
		return proList;
	}

	// delect flay 1 发布者删除的标记
	@Override
	public List<Project> getProjectByPubAndStatus(User user, Integer status) {
		String hql = "From Project p left outer join fetch p.category left outer join fetch p.publisher left outer join fetch p.servicer  where p.publisher=? and Status=? and p.deleteFlag != ?";
		List<Project> proList = getSession().createQuery(hql).setEntity(0, user).setInteger(1, status).setInteger(2, 1)
				.list();
		return proList;
	}

	// delect flay 2 服务者删除的标记
	@Override
	public List<Project> getProjectBySerAndStatus(User user, Integer status) {
		String hql = "From Project p left outer join fetch p.category left outer join fetch p.publisher left outer join fetch p.servicer where p.servicer=? and Status=? and p.deleteFlag != ?";
		List<Project> proList = getSession().createQuery(hql).setEntity(0, user).setInteger(1, status).setInteger(2, 2)
				.list();
		return proList;
	}

	@Override
	public Project getProjectById(Integer id) {
		String hql = "From Project p left outer join fetch p.category left outer join fetch p.publisher left outer join fetch p.servicer where  p.proId=?";
		Project project = (Project) getSession().createQuery(hql).setInteger(0, id).uniqueResult();
		return project;
	}

	@Override
	public List<Project> getProjectWithPage(Integer first, Integer count) {
		String hql = "From Project p left outer join fetch p.category left outer join fetch p.publisher left outer join fetch p.servicer where status>0 and p.deleteFlag!=?";
		Query q = getSession().createQuery(hql).setInteger(0, 1);
		System.out.println("withpage..." + q.list().size());
		q.setFirstResult(first);// 设置起始行
		q.setMaxResults(count);// 每页条数
		List<Project> proList = q.list();

		System.out.println("proList.size():" + proList.size());
		return proList;
	}

/*	@Override
	public List<Project> getProjectWithPageByRequirement(Integer first, Integer count, Integer cateId, Integer status,
			String keyword) {
		String hql = "From Project p left outer join fetch p.category left outer join fetch p.publisher left outer join fetch p.servicer where status>0 and p.deleteFlag!=? and p.category.cateId=? and p.status=? and (p.proName like ? or p.proDesc like ?)";
		Query q = getSession().createQuery(hql).setInteger(0, 1).setInteger(1, cateId).setInteger(2, status)
				.setString(3, "%" + keyword + "%").setString(4, "%" + keyword + "%");
		System.out.println("withpage..." + q.list().size());

		q.setFirstResult(first);// 设置起始行
		q.setMaxResults(count);// 每页条数
		List<Project> proList = q.list();
		System.out.println("proList.size():" + proList.size());
		return proList;
	}*/
	
	@Override
	public List<Project> getProjectWithPageByRequirement(Integer first, Integer count, Integer cateId, Integer status,
			String keyword) {
		String hql = "From Project p left outer join fetch p.category left outer join fetch p.publisher left outer join fetch p.servicer where status>0 and p.deleteFlag!=? and (p.proName like ? or p.proDesc like ?)";
		Query q =null;
		if(cateId!=null){
			hql=hql+" and p.category.cateId=?";
			if(status!=null){
				hql=hql+" and p.status=?  order by p.createTime desc";
				q= getSession().createQuery(hql).setInteger(0, 1).setString(1, "%" + keyword + "%").setString(2, "%" + keyword + "%").setInteger(3, cateId).setInteger(4, status);	
			}
			else{
				hql=hql+" order by p.createTime desc";
				q = getSession().createQuery(hql).setInteger(0, 1).setString(1, "%" + keyword + "%").setString(2, "%" + keyword + "%").setInteger(3, cateId);
			}
			
		}
		else if(status!=null){
				hql=hql+" and p.status=? order by p.createTime desc";
				q= getSession().createQuery(hql).setInteger(0, 1).setString(1, "%" + keyword + "%").setString(2, "%" + keyword + "%").setInteger(3, status);	
		}
		else {
			hql=hql+" order by p.createTime desc";
			    q = getSession().createQuery(hql).setInteger(0, 1).setString(1, "%" + keyword + "%").setString(2, "%" + keyword + "%");
			}
		if(first!=null&&count!=null){
		q.setFirstResult(first);// 设置起始行
		q.setMaxResults(count);// 每页条数
		}
		List<Project> proList = q.list();
		System.out.println("proList.size():" + proList.size());
		return proList;
	}
	@Override
	public List<Project> getAllProjectUnchecked() {
		String hql = "From Project p left outer join fetch p.category left outer join fetch p.publisher left outer join fetch p.servicer where status=0 and p.deleteFlag=?";
		List<Project> proList = getSession().createQuery(hql).setInteger(0, 0).list();
		System.out.println(proList);
		return proList;
	}
	//
	/*
	 * public List getProjectWithBidCountById(Integer id){ String
	 * hql="select count(b.project.proId),p from Project p,Bid b where p.proId=b.project.proId and p.proId=? group by b.project.proId"
	 * ; // String
	 * hql="select Count(b.project.proId) from Bid b where b.project.proId=? group by b.project.proId"
	 * ; // String
	 * hql="select  count(b.project_id),p.* from t_project p  join t_bid b where p.PRO_ID=b.PROJECT_id and p.pro_id=? GROUP BY b.PROJECT_id;"
	 * ;
	 * 
	 * List<Object> list=getSession().createQuery(hql).setInteger(0, id).list();
	 * for (Object object : list) {
	 * 
	 * System.out.println(object); } return list; }
	 */

}
