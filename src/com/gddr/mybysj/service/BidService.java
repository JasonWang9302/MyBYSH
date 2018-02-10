package com.gddr.mybysj.service;

import java.util.List;

import com.gddr.mybysj.entities.Bid;

public interface BidService {

	 void addBid(Bid bid);
	 
	 List<Bid> showBidList(Integer  proId);
}
