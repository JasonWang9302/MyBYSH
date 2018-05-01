package com.gddr.mybysj.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

public class FileUploadTools{
	// toDir 哪个路径下
	
	public static FileResponse upload(File file,String fileName,String toDir) {
		FileOutputStream out = null;
		FileInputStream in = null;
		//返回对应json的对象
		FileResponse result=new  FileResponse();
		
		List<Map<String, String>> list = new ArrayList<Map<String, String>>();
		//map 封装到返回信息里  src 地址
		Map<String, String> map = new HashMap<>();
		
		File dir=new File(toDir);
		if(!dir.exists()){
			dir.mkdirs();
		}
		System.out.println("dir:"+dir);
		//原来的文件名
		System.out.println("fileName:"+fileName);
		//处理生成保存的文件名
		String saveName=getRandomName(fileName);
		System.out.println("saveName:"+saveName);
		try {
			out = new FileOutputStream(toDir+"/"+saveName);
			
			System.out.println(toDir+"/"+saveName);
			in = new FileInputStream(file);

			byte[] buffer = new byte[1024];
			int len = 0;

			while ((len = in.read(buffer)) != -1) {
				out.write(buffer, 0, len);
			}
			if (out != null) {
				out.close();
			}
			if (in != null) {
				in.close();
			}
			
			
		   //上传成功   code:0
			result.setCode(0);
			result.setMsg("文件"+fileName+"上传成功！");
			
			map.put("src", saveName);
			list.add(map);
			result.setData(list);
			
			
			
			return result;
		} catch (IOException e) {
			e.printStackTrace();
			//上传失败   code:0
			result.setCode(1);
			result.setMsg("文件"+fileName+"上传失败！请检查文件是否存在重新上传！");
			
			map.put("src", null);
			list.add(map);
			result.setData(list);
			return result;
		}
	}

	public static void main(String[] args) {

		System.out.println(getRandomName("1.jpsndsf"));
		System.out.println(getRandomName("1.jpg"));
		System.out.println(getRandomName("1dsafdsniaho你好.jpsndsf"));
		System.out.println(getRandomName("1.jpsndsf.jps"));
		System.out.println(getRandomName("1..sadf"));
	}

	// 原来的名字+“-”+当前时间+4位随机数
	public static String getRandomName(String fileName) {
		Random rm = new Random();
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMddhhmmss");

		int index = fileName.lastIndexOf(".");
		StringBuffer sb = new StringBuffer();
		sb.append(fileName.substring(0, index) + "-").append(sdf.format(new Date()));
		for (int i = 4; i > 0; i--) {
			sb.append(rm.nextInt(10));
		}
		sb.append(fileName.substring(index));
		return sb.toString();
	}
}
