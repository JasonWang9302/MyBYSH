<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="resource/css/comm.css" />
<link rel="stylesheet" type="text/css"
	href="resource/css/projectDetails.css" />
<link rel="stylesheet" href="resource/plugins/layui/css/layui.css"
	media="all">
<title>Insert title here</title>
<%%>
</head>
<body>
	<!-- 引入导航 -->
	<%@ include file="comm-nav.jsp"%>

	<!-- 内容部分开始 -->
	<!-- 小导航 -->
	<div id="wzdhDiv">
		<a style="font-size: 18px;" href="javascript:history.back(-1)">任务列表 ></a>任务详情
	</div>
	<!-- 上面键鼠 -->
	<div class="proListItem">
		<div class="proItemLeft">
			<font style="font-size: 20px;">${request.project.proName}</font>&nbsp;&nbsp;&nbsp; <font
				style="font-size: 10px">${request.project.createTime} 发布</font> <br> <br>
			<div class="proDesc">
				<font Style="font-size: 13px">${request.project.proDesc} </font>
			</div>
			<br> <br> <font style="font-size: 20px;">${request.project.category.cateName}</font>
		</div>
		<div class="proItemRigth">
			<font style="font-size: 25px; color: red;">¥ ${request.project.projectFund} 元</font>
			<font style="font-size: 30px; text-align: right;">已完成</font>
		</div>
	</div>
	<!-- 具体详情 -->
	<div id="projectDetails">
		<font style="font-size: 18px;">任务详情 </font>
		<div style="padding: 10px; font-size: 16px;">
			<font>${request.project.category.cateName}</font><br> <font style="font-size: 15px;">描述:</font><br>
			${request.project.proDesc}
		</div>
		<hr />
		<font style="font-size: 18px;">下载招标书 </font><br> <img
			style="padding: 10px;" alt="" src="resource/images/fj.png"><a
			href="uploadAction-downloadFile?fileName=${request.project.rfp}">${request.project.rfp}<a>
	</div>



	<!-- 内容部分结束 -->

	<!-- 引入底部 -->
	<%@ include file="comm-foot.jsp"%>

</body>
</html>