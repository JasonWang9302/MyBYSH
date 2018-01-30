<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="resource/css/projectList.css" rel="stylesheet"
	type="text/css" />
<title>Insert title here</title>
</head>
<body>
	<!-- 引入导航 -->
	<%@ include file="comm-nav.jsp"%>


	<!-- 	内容区 开始 -->

<s:iterator value="#request.projectList" >

	<!-- 循环 -->
	<a class="proItemLefta" href="project-showDetail?proId=${proId}" style="text-decoration: none;">
		<div class="proListItem">
			<div class="proItemLeft">
				<font style="font-size: 20px;">${proName}</font>&nbsp;&nbsp;&nbsp; <font
					style="font-size: 10px">${createTime} 发布</font> <br>
				<br> 
			<div class="proDesc"><font Style="font-size: 13px">${proDesc} </font> </div>	
				<br>
				<br> <font style="font-size: 20px;">${category.cateName}</font>
			</div>
			<div class="proItemRigth">
				<font style="font-size: 25px; color: red;">¥ ${projectFund} 元</font> <font
					style="font-size: 30px; text-align: right;">已完成</font>
			</div>
		</div>
		
		
	</a>
</s:iterator>
	<%-- <a class="proItemLefta" href="#" style="text-decoration: none;">
		<div class="proListItem">
			<div class="proItemLeft">
				<font style="font-size: 20px;">CJPC功能模块开发</font>&nbsp;&nbsp;&nbsp; <font
					style="font-size: 10px">2017-06-20 14:58:19 发布</font> <br>
				<br> <font Style="font-size: 13px">CJPC功能模块开发 需求1 拼车类型
					将以前的 2人拼车 3人拼车 4人拼车统一改成拼车，包车保持不变。 管理端可以自由拼车派单 影响范围： 安卓 客户端：创建订单
					司机端：回显订单 </font> <br>
				<br> <font style="font-size: 20px;">微信开发</font>
			</div>
			<div class="proItemRigth">
				<font style="font-size: 25px; color: red;">¥ 5000 元</font> <font
					style="font-size: 30px; text-align: right;">已完成</font>
			</div>
		</div>
	</a> --%>














	<!-- 	内容区 结束 -->

	<!-- 引入底部 -->
	<%@ include file="comm-foot.jsp"%>

</body>
</html>