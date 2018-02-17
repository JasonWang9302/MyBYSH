package com.gddr.mybysj.dao;

import com.gddr.mybysj.entities.Dealing;

public interface DealingDao {
    //
	public void addDealing(Dealing dealing);
	
	public void updateDealing(Dealing dealing);
	
	public Dealing getDealingByProIdAndName(Integer proId,String dealName);
}
