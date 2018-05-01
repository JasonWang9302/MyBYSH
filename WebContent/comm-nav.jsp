<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="resource/css/comm.css" />
<link rel="stylesheet" href="resource/plugins/layui/css/layui.css"
	media="all">

<script src="resource/plugins/layui/layui.js"></script>

<script>
	layui.use('element', function() {
		var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块

		//监听导航点击
		element.on('nav(demo)', function(elem) {
			//console.log(elem)
			layer.msg(elem.text());
		});
	});
</script>

<base href="<%=basePath%>"></base>

<title>Insert title here</title>

</head>
<body>
	<div class="header">
		<div class="box1">
			<div class="logo">
				<a href="#"><img src="resource/img/logo1.png" /></a>
			</div>
			
			
			<!-- 	第三块   登录    -->
			<div id="login">
				
					<s:if test="#session.currUser==null">
					<div id="dlzc">
						<a href="user-toLogin">登录/注册 </a>
						</div>
					</s:if>
					
					<s:else>
						<%-- <a style="size: 30px;" href="personal/index.jsp">${session.currUser.userName}</a> --%>
						<ul class="layui-nav" id="yh">
							<li class="layui-nav-item" lay-unselect=""><a
								href="javascript:;"  style="color:#3d3d3d"><img src="resource/img/tximg.jpg"
									class="layui-nav-img">${session.currUser.userName}</a>
								<dl class="layui-nav-child">
									<dd>
										<a href="javascript:;">修改信息</a>
									</dd>
									<dd>
										<a href="personal/index.jsp">个人中心</a>
									</dd>
									<dd>
										<a href="user-logout">退了</a>
									</dd>
								</dl></li>
						</ul>
					</s:else>
			
			</div>
			<!-- 	第三块   登录-->
			<!-- 导航条 -->
			<div class="dh">
				<ul>
					<li><a href="index.jsp"><img id="navimg1" onMouseOver="nav(this)"
							onMouseOut="nav1(this)"
							src="resource/img/navimg_11.png" /></a></li>
					<li><a href="project-toPublish"><img onMouseOver="nav(this)"
							onMouseOut="nav1(this)" id="navimg4"
							src="resource/img/navimg_41.png" /></a></li>
					<li><a href="project-showProjectList"><img onMouseOver="nav(this)"
							onMouseOut="nav1(this)" id="navimg3"
							src="resource/img/navimg_31.png" /></a></li>
					<li><a href="work.jsp"><img onMouseOver="nav(this)"
							onMouseOut="nav1(this)" id="navimg2"
							src="resource/img/navimg_21.png" /></a></li>
					<li><a href="contact.jsp"><img onMouseOver="nav(this)"
							onMouseOut="nav1(this)" id="navimg6"
							src="resource/img/navimg_61.png" /></a></li>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>