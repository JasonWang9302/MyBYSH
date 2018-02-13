package com.gddr.mybysj.service;

import java.util.Date;

import com.gddr.mybysj.entities.Dealing;
import com.gddr.mybysj.entities.Project;
import com.gddr.mybysj.entities.User;

public interface DealingService {
	  void addDealing(Project project, String dealingName, Double dealingAmount,User payer, User payee);
	  
	  void deleteDealing(Dealing dealing);
}
