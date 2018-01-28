package com.gddr.mybysj.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Controller;

import com.gddr.mybysj.util.FileResponse;
import com.gddr.mybysj.util.FileUploadTools;

@Controller
public class FileUploadAction extends BaseAction {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private File file;
	private String fileContentType;
	private String fileFileName;
	private FileResponse fileResponse;

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
		//保存的名字
		String toDir = context.getRealPath("/WEB-INF/upload/");
		fileResponse=FileUploadTools.upload(file,fileFileName, toDir);
		System.out.println("--------upload-----------");
		return "upload";
	}

	@Override
	public void prepare() throws Exception {

	}

}
