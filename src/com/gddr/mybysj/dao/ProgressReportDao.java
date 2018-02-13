package com.gddr.mybysj.dao;

import java.util.List;

import com.gddr.mybysj.entities.ProgressReport;

public interface ProgressReportDao {
      
	void saveProgressReport(ProgressReport pgre);
	
	List<ProgressReport> getProgressReportListByProId(Integer proId);
}
