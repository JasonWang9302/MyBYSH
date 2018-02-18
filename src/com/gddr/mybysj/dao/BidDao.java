package com.gddr.mybysj.dao;

import java.util.List;

import com.gddr.mybysj.entities.Bid;
import com.gddr.mybysj.entities.Project;
import com.gddr.mybysj.entities.User;


public interface BidDao {

	void addBid(Bid bid);
	
	List<Bid> getBidListByProId(Integer proId);	
	
	List<Bid> getBidListByServicer(User servicer);
	
	List<Project> getProjectByServicer(User servicer);
	
	Bid getBidById(Integer bidId);
	
	void updateBid(Bid bid);
}
