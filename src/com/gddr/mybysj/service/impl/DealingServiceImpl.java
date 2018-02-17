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
		payer.setBalance(balance1);
		userDao.addOrUpdate(payer);
		
		//payee账户加dealingAmount
		Double balance2=payee.getBalance()+dealingAmount;
		payee.setBalance(balance2);
		userDao.addOrUpdate(payee);
		//增加交易记录
		Dealing dealing = new Dealing(project, dealingName, dealingAmount, new Date(), payer, payee, 0);
		dealingDao.addDealing(dealing);
		
		//以上都成功 更改项目担保状态
		Integer guaranteeStatus=project.getGuaranteeStatus();
		
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
		
		//说明是验收时添加的交易记录  需要合并 发布者—>平台->服务者   成 发布者->服务者   （更给旧记录状态为1   插入新虚拟合并记录 ）  并返还服务者保证金
		else if(project.getStatus().equals(4)){
			//获取旧记录  修改状态为1  表示失效（保留真实转账流程记录）
			Dealing publisherDealing=dealingDao.getDealingByProIdAndName(project.getProId(), "项目金平台担保");
			//Dealing servicerDealing=dealingDao.getDealingByProIdAndName(project.getProId(), "保证金平台担保");
		    publisherDealing.setStatus(1);
		    dealing.setStatus(1);
		    //servicerDealing.setStatus(1);
			dealingDao.updateDealing(publisherDealing);
			dealingDao.updateDealing(dealing);
			//dealingDao.updateDealing(servicerDealing);
			//插入合并虚拟记录
			Dealing hbDealing = new Dealing(project, "项目金到账", dealingAmount, new Date(), project.getPublisher(), payee, 0);
			dealingDao.addDealing(hbDealing);
			//平台返还服务者保证金 并记录
			//payer(此时是平台)账户减compensationRate
			payer.setBalance(payer.getBalance()-project.getCompensationRate());
			//payee（此时是服务者）账户加compensationRate
			payee.setBalance(payee.getBalance()+project.getCompensationRate());
			dealingDao.addDealing(new Dealing(project, "保证金退还", project.getCompensationRate(), new Date(), payer, payee, 0));
		    //设置项目状态为5 已完成
			project.setStatus(5);
		}
		else{
			System.out.println("进入了else   检查dealingSerice addDaling是否有误！！！！");
		}
		projectDao.update(project);
	}

	@Override
	public void deleteDealing(Dealing dealing) {
		dealing.setStatus(1);
		dealingDao.updateDealing(dealing);
	}

	@Override
	public Dealing getDealingByProIdAndName(Integer proId, String dealName) {
		return dealingDao.getDealingByProIdAndName(proId, dealName);
	}

}
