package com.gddr.mybysj.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gddr.mybysj.dao.ProgressReportDao;
import com.gddr.mybysj.entities.ProgressReport;
import com.gddr.mybysj.service.ProgressReportService;
@Service
public class ProgressReportServiceImpl implements ProgressReportService {
@Autowired
   private ProgressReportDao progressReportDao;
	@Override
	public void addProgressReport(ProgressReport pgre) {
		progressReportDao.saveProgressReport(pgre);
	}

	@Override
	public List<ProgressReport> getProgressReportListByProId(Integer proId) {
		return progressReportDao.getProgressReportListByProId(proId);
	}

}
