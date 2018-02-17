package com.gddr.mybysj.dao.impl;

import org.springframework.stereotype.Repository;
import com.gddr.mybysj.dao.BaseDao;
import com.gddr.mybysj.dao.DealingDao;
import com.gddr.mybysj.entities.Dealing;

@Repository
public class DealingDaoImpl extends BaseDao implements DealingDao {

	@Override
	public void addDealing(Dealing dealing) {
		getSession().save(dealing);
	}
	
	@Override
	public void updateDealing(Dealing dealing) {
		getSession().update(dealing);
	}

	@Override
	public Dealing getDealingByProIdAndName(Integer proId, String dealName) {
		String hql="From Dealing d where d.project.proId=? and dealingName=?";
		Dealing dealing=(Dealing) getSession().createQuery(hql).setInteger(0, proId).setString(1, dealName).uniqueResult();
		return dealing;
	}
}
