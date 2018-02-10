package com.gddr.mybysj.dao;

import java.util.List;

import com.gddr.mybysj.entities.Bid;

public interface BidDao {

	void addBid(Bid bid);
	
	
	List<Bid> getBidListByProId(Integer proId);	
}
