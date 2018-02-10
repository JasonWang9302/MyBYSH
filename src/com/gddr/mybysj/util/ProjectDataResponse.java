package com.gddr.mybysj.util;

import java.util.List;
import com.gddr.mybysj.entities.Project;

public class ProjectDataResponse {
	private int code;
	private String msg;
	private int count;
	private List data;
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public List getData() {
		return data;
	}
	public void setData(List data) {
		this.data = data;
	}
	@Override
	public String toString() {
		return "projectDataResponse [code=" + code + ", msg=" + msg + ", count=" + count + ", data=" + data + "]";
	}
	
	

}
