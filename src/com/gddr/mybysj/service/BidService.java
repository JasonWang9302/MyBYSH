package com.gddr.mybysj.service;

import java.util.List;

import com.gddr.mybysj.entities.Bid;
import com.gddr.mybysj.entities.Project;
import com.gddr.mybysj.entities.User;

public interface BidService {

	 void addBid(Bid bid);
	 
	 List<Bid> showBidList(Integer  proId);
	 
	 List<Project> getProjectByServicer(User servicer);
	 
	 List<Bid> getBidListByServicer(User servicer);
	 
	 Bid getBidById(Integer bidId);
		
	 void updateBid(Bid bid);
	 
}
