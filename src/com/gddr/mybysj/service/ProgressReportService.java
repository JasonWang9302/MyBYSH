package com.gddr.mybysj.service;

import java.util.List;

import com.gddr.mybysj.entities.ProgressReport;

public interface ProgressReportService {
   void addProgressReport(ProgressReport pgre );
	
	List<ProgressReport> getProgressReportListByProId(Integer proId);
}
