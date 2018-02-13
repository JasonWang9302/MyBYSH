package com.gddr.mybysj.service.impl;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.gddr.mybysj.dao.DealingDao;
import com.gddr.mybysj.dao.ProjectDao;
import com.gddr.mybysj.dao.UserDao;
import com.gddr.mybysj.entities.Dealing;
import com.gddr.mybysj.entities.Project;
import com.gddr.mybysj.entities.User;
import com.gddr.mybysj.service.DealingService;

@Controller
public class DealingServiceImpl implements DealingService {
	@Autowired
	private DealingDao dealingDao;
	@Autowired
	private UserDao userDao;
	@Autowired
	private ProjectDao projectDao;

	@Override
	public void addDealing(Project project, String dealingName, Double dealingAmount, User payer, User payee) {
		//payer账户减dealingAmount
		Double balance1=payer.getBalance()-dealingAmount;
		System.out.println("balance...."+balance1);
		payer.setBalance(balance1);
		userDao.addOrUpdate(payer);
		
		//payee账户加dealingAmount
		Double balance2=payee.getBalance()+dealingAmount;
		System.out.println("balance...."+balance2);
		payee.setBalance(balance2);
		userDao.addOrUpdate(payee);
		//增加交易记录
		Dealing dealing = new Dealing(project, dealingName, dealingAmount, new Date(), payer, payee, 0);
		dealingDao.addDealing(dealing);
		
		//以上都成功 更改项目担保状态
		Integer guaranteeStatus=project.getGuaranteeStatus();
		System.out.println("guaranteeStatus="+guaranteeStatus);
		System.out.println("project.getPublisher()="+project.getPublisher());
		System.out.println("payer="+payer);
		
		if(guaranteeStatus.equals(0)){
			if(project.getPublisher().getUserId()==payer.getUserId()){
				project.setGuaranteeStatus(2);
			}
			if(project.getServicer().getUserId()==payer.getUserId()){
				project.setGuaranteeStatus(1);
			}
		}
		else if(guaranteeStatus.equals(1)||guaranteeStatus.equals(2)){
			project.setGuaranteeStatus(3);
			//状态改为进行中
			project.setStatus(3);
		}
		else{
			System.out.println("else");
		}
		projectDao.update(project);
	}

	@Override
	public void deleteDealing(Dealing dealing) {
		dealing.setStatus(1);
		dealingDao.updateDealing(dealing);
	}

}
