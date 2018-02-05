package com.gddr.mybysj.dao.impl;

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
}
