package com.gddr.mybysj.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gddr.mybysj.dao.BidDao;
import com.gddr.mybysj.entities.Bid;
import com.gddr.mybysj.entities.Project;
import com.gddr.mybysj.entities.User;
import com.gddr.mybysj.service.BidService;

@Service
public class BidServiceImpl implements BidService {
	@Autowired
	private BidDao bidDao;

	@Override
	public void addBid(Bid bid) {

		bidDao.addBid(bid);
	}

	@Override
	public List<Bid> showBidList(Integer proId) {
		return bidDao.getBidListByProId(proId);
	}

	@Override
	public List<Project> getProjectByServicer(User servicer) {
		// TODO Auto-generated method stub
		return bidDao.getProjectByServicer(servicer);
	}

	@Override
	public List<Bid> getBidListByServicer(User servicer) {
		return bidDao.getBidListByServicer(servicer);
	}

	@Override
	public Bid getBidById(Integer bidId) {
		// TODO Auto-generated method stub
		return bidDao.getBidById(bidId);
	}

	@Override
	public void updateBid(Bid bid) {
		bidDao.updateBid(bid);
	}

}
