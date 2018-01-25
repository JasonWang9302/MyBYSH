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
			<li><a id="xuanzhong" class="dh2" href="work_qiyewangzhan.jsp">企业网站</a></li>
		    <li><a class="dh2" href="work_menhuwangzhan.jsp">门户网站</a></li>
			<li><a  class="dh2" href="work_duomeiti.jsp">多媒体互动</a></li>
			<li><a  class="dh2" href="work_wangluowangzhan.jsp">网络工程</a></li>
			<li><a  class="dh2" href="work_qitawangzhan.jsp">其他类型</a></li>
		</ul>
	</div>
</div>






<!--第一行-->
<div class="work_content">
		<div class="box02">
			<ul>
				<li> <a href="anli.jsp"> <div id="">
					<img src="resource/img/work_img3.jpg"/><br />
						<span class="title1">
							<b>巴楚天宇科技有限公司</b> 
						</span><br />
						<span class="title2">
							日期：2017-01-01
						</span>
				</div></a>
				</li>
				<li class="center_li">
					<a href="anli.jsp"> <div id="">
				<img src="resource/img/work_img1.jpg"/><br />
						<span class="title1">
							<b>新疆西昆仑骨明胶有限公司</b> 
						</span><br />
						<span class="title2">
							日期：2017-01-01
						</span>
				</div></a>
				</li>
				<li>
					<a href="anli.jsp"> <div id="">
					<img src="resource/img/work_img4.jpg"/><br />
						<span class="title1">
							<b>深圳市春风旅行社南山总社</b> 
						</span><br />
						<span class="title2">
							日期：2017-01-01
						</span>
				</div></a>
				</li>
			</ul>
		</div>
		
			
		
		<!--第二行-->
		<div class="box02">
			<ul>
				<li> <a href="anli.jsp"> <div id="">
					<img src="resource/img/work_img4.jpg"/><br />
						<span class="title1">
							<b>深圳市春风旅行社南山总社</b> 
						</span><br />
						<span class="title2">
							日期：2017-01-02
						</span>
				</div></a>
				</li>
				<li class="center_li">
					<a href="anli.jsp"> <div id="">
					<img src="resource/img/ttt2.jpg"/><br />
						<span class="title1">
							<b>英吾斯坦乡19村PPT</b> 
						</span><br />
						<span class="title2">
							日期：2017-01-02
						</span>
				</div></a>		
				</li>
				
		  </ul>
	</div>
	
	
	
	
	<div class="box03">
	<a href="work.jsp"><input type="button" name="" id="" value="1" /></a>
	</div>
	
	
	
	</div>
	<!--	中间区域结束-->
	
	
	
	
	
	
	
<!--	footer区域开始-->	
	<!-- 引入底部 -->
<%@ include file="comm-foot.jsp" %>
	<!--	footer区域结束-->	
	
	
</body>
</html>