package com.gddr.mybysj.action;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.gddr.mybysj.entities.Department;
import com.gddr.mybysj.entities.Employee;
import com.gddr.mybysj.service.DepartmentService;
import com.gddr.mybysj.service.EmployeeService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

@Controller
public class EmployeeAction extends ActionSupport implements RequestAware, ModelDriven<Employee>, Preparable {
	@Autowired
	private EmployeeService employeeService;
	@Autowired
	private DepartmentService departmentService;

	public String all() {
		List<Employee> employeeList = employeeService.getAll();
		System.out.println("");
		request.put("employeeList", employeeList);
		return "all";
	}

	private Integer id;

	public void setId(int id) {
		System.out.println("setId（）......"+id);
		this.id = id;
	}

	private InputStream inputStream;

	public InputStream getInputStream() {
		return inputStream;
	}

	public String delete() throws Exception {

		if (employeeService.deleteEmployee(id)) {
			inputStream = new ByteArrayInputStream("1".getBytes("UTF-8"));
		} else
			inputStream = new ByteArrayInputStream("2".getBytes("UTF-8"));
		return "delete";
	}

	/* to添加 */
	public void prepareAdd(){
		System.out.println("-------preparToAdd");
		model = new Employee();
		
	}
	public String toAdd() {
		List<Department> departmentList = departmentService.getDepartmentList();
		request.put("departmentList", departmentList);
		return "toAdd";
	}

	/* do添加 */
	public String add() {
		model.setCreateTime(new Date());
		employeeService.addEmployee(model);
		return "add";
	}

	/*验证用户名是否可用*/
	public String verifyName() throws Exception {
		if (employeeService.isExistByName(model.getLastName())) {
			inputStream = new ByteArrayInputStream("1".getBytes("UTF-8"));
		} else
			inputStream = new ByteArrayInputStream("2".getBytes("UTF-8"));
		return "verifyName";
	}
	
	
	 public void prepareToEdit(){
		if(id != null){
		    model=employeeService.getEmployeeById(id);
		}
	}
	
    public String toEdit(){
    	List<Department> departmentList=departmentService.getDepartmentList();
    	request.put("employee", employeeService.getEmployeeById(id));
    	request.put("departmentList", departmentList);
    	return "toEdit";
    }
    
    public void prepareEdit(){
    	model=new Employee();
    }
	public String edit(){
		System.out.println("edit()....:"+model);
		employeeService.updateEmployee(model);
		
		return "add";
	}
	
	
	private Map<String, Object> request;

	@Override
	public void setRequest(Map<String, Object> arg0) {
		this.request = arg0;
	}

	private Employee model;

	@Override
	public Employee getModel() {
		System.out.println("getModel:"+model);
		return model;
	}

	@Override
	public void prepare() throws Exception {

	}
}
