package com.gddr.mybysj.action;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.gddr.mybysj.entities.Bid;
import com.gddr.mybysj.entities.Project;
import com.gddr.mybysj.entities.User;
import com.gddr.mybysj.service.BidService;
import com.gddr.mybysj.service.ProjectService;
import com.opensymphony.xwork2.ModelDriven;

@Controller
public class BidAction extends BaseAction implements ModelDriven<Bid> {
	@Autowired
	private BidService bidService;
	@Autowired
	private ProjectService projectService;
	private Bid model;
	/*去填写竞标信息*/
    public String toBid(){
    	System.out.println("hehehhe"+request.getParameter("proId"));
    	request.setAttribute("proId", request.getParameter("proId"));
    	return "toBid";
    }
 
    
    
    
    
 
   /*  做竞标信息提交*/
    public String doBid(){
    	Integer proId=model.getProject().getProId();
        Project project=projectService.getProjectById(proId);
        model.setProject(project);
    	model.setBidTime(new Date());
    	model.setStatus(0);
    	model.setDeleteFlag(0);
    	model.setServicer((User)session.getAttribute("currUser"));
    	System.out.println(model);
    	bidService.addBid(model);
    	response.setContentType("text/hmtl;charset=utf-8");
		request.setAttribute("tip", "竞标信息发送成功！");
    	return "doBid";
    }
    public void prepareDoBid(){
        model=new Bid();
        
    }
    
    
    
    
    
	public void setModel(Bid model) {
		this.model = model;
	}

	@Override 
	public Bid getModel() {
		// TODO Auto-generated method stub
		return model;
	}
	
	
	
	
	
	
	
	

	@Override
	public void prepare() throws Exception {
		// TODO Auto-generated method stub

	}

}
