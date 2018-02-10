package com.gddr.mybysj.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.gddr.mybysj.dao.BaseDao;
import com.gddr.mybysj.dao.BidDao;
import com.gddr.mybysj.entities.Bid;

@Repository
public class BidDaoImpl extends BaseDao implements BidDao {

	@Override
	public void addBid(Bid bid) {
		getSession().save(bid);
	}

	@Override
	public List<Bid> getBidListByProId(Integer proId) {

		String hql = "From Bid b left outer join fetch b.project left outer join fetch b.project.category left outer join fetch b.project.publisher left outer join fetch b.project.servicer  left outer join fetch b.servicer where b.project.proId=?";
		List<Bid> bidList = getSession().createQuery(hql).setInteger(0, proId).list();
		return bidList;
	}
}
