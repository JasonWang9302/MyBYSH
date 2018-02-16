package com.gddr.mybysj.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.gddr.mybysj.dao.BaseDao;
import com.gddr.mybysj.dao.ProgressReportDao;
import com.gddr.mybysj.entities.ProgressReport;

@Repository
public class ProgressReportDaoImpl extends BaseDao implements ProgressReportDao {

	@Override
	public void saveProgressReport(ProgressReport pgre) {
		getSession().save(pgre);
	}

	@Override
	public List<ProgressReport> getProgressReportListByProId(Integer proId) {
		String hql = "From ProgressReport p left outer join fetch p.project left outer join fetch p.project.category left outer join fetch p.project.publisher left outer join fetch p.project.servicer where p.project.proId=?";
		List<ProgressReport> pgreList = getSession().createQuery(hql).setInteger(0, proId).list();
		return pgreList;
	}

}
