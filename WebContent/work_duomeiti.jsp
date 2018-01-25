<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title></title>

<link rel="stylesheet" type="text/css" href="resource/css/work.css"/>
<script type="text/javascript" src="resource/js/js1.js"/></script>



</head>




<body>
	
	<!-- 引入导航 -->
<%@ include file="comm-nav.jsp" %>
	
	<div class="box01">
	<div class="work_title">
		
		<img src="resource/img/work_title.png"/>
	</div>
</div>
<!--	中间区域开始-->


<div class="flq">
	<div class="ul">
		<ul>
			<li><a  class="dh2" href="work.jsp">全部网页</a></li>
			<li><a  class="dh2" href="work_qiyewangzhan.jsp">企业网站</a></li>
		    <li><a class="dh2" href="work_menhuwangzhan.jsp">门户网站</a></li>
			<li><a  id="xuanzhong" class="dh2" href="work_duomeiti.jsp">多媒体互动</a></li>
			<li><a  class="dh2" href="work_wangluowangzhan.jsp">网络工程</a></li>
			<li><a class="dh2" href="work_qitawangzhan.jsp">其他类型</a></li>
		
		</ul>
	</div>
</div>



<style type="text/css">
	.zwcp{
		width: 80px;
		margin: 30px auto;
		color: #FF0000;
		font-size: 13px;
		margin-bottom: 100px;
	}
</style>


<!--第一行-->
<div class="work_content">
	<div class="zwcp">
		暂无产品...
	</div>
	
	
	</div>
	<!--	中间区域结束-->
	
	
	
	
	
	
	
<!--	footer区域开始-->	
	<!-- 引入底部 -->
<%@ include file="comm-foot.jsp" %>
	<!--	footer区域结束-->	
	
	
</body>
</html>