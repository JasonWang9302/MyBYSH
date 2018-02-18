package com.gddr.mybysj.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.gddr.mybysj.dao.BaseDao;
import com.gddr.mybysj.dao.BidDao;
import com.gddr.mybysj.entities.Bid;
import com.gddr.mybysj.entities.Project;
import com.gddr.mybysj.entities.User;

@Repository
public class BidDaoImpl extends BaseDao implements BidDao {

	@Override
	public void addBid(Bid bid) {
		getSession().save(bid);
	}

	@Override
	public List<Bid> getBidListByProId(Integer proId) {

		String hql = "From Bid b left outer join fetch b.project left outer join fetch b.project.category left outer join fetch b.project.publisher left outer join fetch b.project.servicer  left outer join fetch b.servicer where b.project.proId=? and b.deleteFlag!=?";
		List<Bid> bidList = getSession().createQuery(hql).setInteger(0, proId).setInteger(1, 1).list();
		return bidList;
	}

	@Override
	public List<Project> getProjectByServicer(User servicer) {
		String hql = "Select project From Bid b left outer join fetch b.project left outer join fetch b.project.category left outer join fetch b.project.publisher left outer join fetch b.project.servicer left outer join fetch b.servicer where b.servicer=? and b.deleteFlag!=?";
		List<Project> projectList = getSession().createQuery(hql).setEntity(0, servicer).setInteger(1, 1).list();
		return projectList;
	}

	@Override
	public List<Bid> getBidListByServicer(User servicer) {
		String hql = "From Bid b left outer join fetch b.project left outer join fetch b.project.category left outer join fetch b.project.publisher left outer join fetch b.project.servicer left outer join fetch b.servicer where b.servicer=? and b.deleteFlag!=?";
		List<Bid> bidList = getSession().createQuery(hql).setEntity(0, servicer).setInteger(1, 1).list();
		return bidList;
	}

	@Override
	public Bid getBidById(Integer bidId) {
		String hql = "From Bid b left outer join fetch b.project left outer join fetch b.project.category left outer join fetch b.project.publisher left outer join fetch b.project.servicer  left outer join fetch b.servicer where b.bidId=?";
        Bid bid = (Bid) getSession().createQuery(hql).setInteger(0, bidId).uniqueResult();
		return bid;
	}

	@Override
	public void updateBid(Bid bid) {
		getSession().update(bid);
		
	}
}
