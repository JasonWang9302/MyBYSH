package com.gddr.mybysj.action;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.gddr.mybysj.entities.Bid;
import com.gddr.mybysj.entities.Project;
import com.gddr.mybysj.entities.User;
import com.gddr.mybysj.service.BidService;
import com.gddr.mybysj.service.ProjectService;
import com.gddr.mybysj.util.ProjectDataResponse;
import com.opensymphony.xwork2.ModelDriven;

@Controller
public class BidAction extends BaseAction implements ModelDriven<Bid> {
	@Autowired
	private BidService bidService;
	@Autowired
	private ProjectService projectService;
	private Bid model;
	// ajax
	private InputStream inputStream;

	public InputStream getInputStream() {
		return inputStream;
	}
	
	//返回json
		private ProjectDataResponse projectDataResponse;
		public void setProjectDataResponse(ProjectDataResponse projectDataResponse) {
			this.projectDataResponse = projectDataResponse;
		}
	
	
	
	public ProjectDataResponse getProjectDataResponse() {
			return projectDataResponse;
		}



	/*去填写竞标信息*/
    public String toBid(){
    	System.out.println("hehehhe"+request.getParameter("proId"));
    	request.setAttribute("proId", request.getParameter("proId"));
    	return "toBid";
    }
 
    
    //逻辑删除、撤销 投标
    public String logicDeleteBid(){
    	Integer bidId=Integer.parseInt(request.getParameter("bidId"));
    	Bid bid=bidService.getBidById(bidId);
    	bid.setDeleteFlag(1);
    	bidService.updateBid(bid);
    	try {
			inputStream = new ByteArrayInputStream("1".getBytes("UTF-8"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
    	return "logicDeleteBid";
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
    
    
    //显示此项目竞标者列表
    public String showBidList(){
    	Integer proId=Integer.parseInt(request.getParameter("proId"));
    	request.setAttribute("proId", proId);
    	
    	projectDataResponse=new ProjectDataResponse();
    	List<Bid> list=bidService.showBidList(proId);
		projectDataResponse.setCode(0);
		projectDataResponse.setMsg("收到了。。。");
		projectDataResponse.setCount(list.size());
		projectDataResponse.setData(list);
		System.out.println(projectDataResponse);
    	return "showBidList";
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
