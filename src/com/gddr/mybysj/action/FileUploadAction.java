package com.gddr.mybysj.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.gddr.mybysj.entities.Project;
import com.gddr.mybysj.entities.User;
import com.gddr.mybysj.service.ProjectService;
import com.gddr.mybysj.util.FileResponse;
import com.gddr.mybysj.util.FileUploadTools;
import com.gddr.mybysj.util.ProjectDataResponse;

@Controller
public class FileUploadAction extends BaseAction {
	/**
	 * 
	 */

	@Autowired
	private ProjectService projectService;
	private ProjectDataResponse projectDataResponse;

	public void setProjectDataResponse(ProjectDataResponse projectDataResponse) {
		this.projectDataResponse = projectDataResponse;
	}

	private static final long serialVersionUID = 1L;

	private File file;
	private String fileContentType;
	private String fileFileName;
	private FileResponse fileResponse;

	// 文件下载的
	private InputStream inputStream;
	private String contentType;
	private long contentLength;
	private String contentDisposition;

	public String getContentType() {
		return contentType;
	}

	public long getContentLength() {
		return contentLength;
	}

	public String getContentDisposition() {
		return contentDisposition;
	}

	public InputStream getInputStream() {
		return inputStream;
	}

	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}

	public String getFileContentType() {
		return fileContentType;
	}

	public void setFileContentType(String fileContentType) {
		this.fileContentType = fileContentType;
	}

	public String getFileFileName() {
		return fileFileName;
	}

	public ProjectDataResponse getProjectDataResponse() {
		return projectDataResponse;
	}

	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}

	public FileResponse getFileResponse() {
		return fileResponse;
	}

	public void setFileResponse(FileResponse fileResponse) {
		this.fileResponse = fileResponse;
	}

	public String upload() throws IOException {

		System.out.println(file);
		System.out.println(fileContentType);
		System.out.println(fileFileName);
		// System.out.println(dir);
		// 保存的名字
		String toDir = context.getRealPath("/WEB-INF/upload/");
		fileResponse = FileUploadTools.upload(file, fileFileName, toDir);
		System.out.println("--------upload-----------");
		return "upload";
	}

	/* 节约时间 暂时把文件下载的action也写着这里 */
	public String downloadFile() throws IOException {
		response.setContentType("text/hmtl;charset=utf-8");

		String filename = request.getParameter("fileName");
		System.out.println("filename :" + filename);
		// 解决空格变+号
		contentDisposition = "attachment;filename=" + new String(filename.getBytes("gbk"), "iso8859-1");
		String fileName = context.getRealPath("/WEB-INF/upload/" + filename);
		inputStream = new FileInputStream(fileName);
		contentLength = inputStream.available();
		return "downloadFile";
	}

	public String showDSH() {

		User user = (User) session.getAttribute("currUser");
		projectDataResponse=new ProjectDataResponse();
		System.out.println(user);
		List<Project> list=projectService.getProjectByPubAndStatus(user, 0);
		projectDataResponse.setCode(0);
		System.out.println(projectDataResponse);
		projectDataResponse.setMsg("收到了。。。");
		System.out.println(projectDataResponse);
		projectDataResponse.setCount(list.size());
		System.out.println(projectDataResponse);
		projectDataResponse.setData(list);
		System.out.println(projectDataResponse);
		return "showDSH";
	}

	@Override
	public void prepare() throws Exception {

	}

}
