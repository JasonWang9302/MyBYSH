<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<base href="<%=basePath%>"></base>

<title>Insert title here</title>

</head>
<body>
	<div class="header">
		<div class="box1">
			<div class="logo">
				<a href="#"><img src="resource/img/logo1.png" /></a>
			</div>
			<div class="dh">
				<ul>
					<li><a href="index.jsp"><img id="navimg1"
							src="resource/img/navimg_12.png" /></a></li>
					<li><a href="index.jsp"><img onMouseOver="nav(this)"
							onMouseOut="nav1(this)" id="navimg3"
							src="resource/img/navimg_31.png" /></a></li>
					<li><a href="index.jsp"><img onMouseOver="nav(this)"
							onMouseOut="nav1(this)" id="navimg4"
							src="resource/img/navimg_41.png" /></a></li>
					<li><a href="work.jsp"><img onMouseOver="nav(this)"
							onMouseOut="nav1(this)" id="navimg2"
							src="resource/img/navimg_21.png" /></a></li>
					<li><a href="contact.jsp"><img onMouseOver="nav(this)"
							onMouseOut="nav1(this)" id="navimg6"
							src="resource/img/navimg_61.png" /></a></li>
					<li><div style="margin: auto; padding: 30px 10px;">

							
							<s:if test="#session.currUser==null">
							<a href="user-toLogin">登录/注册 </a>
							</s:if>
							<s:else>
                       <a style="size: 30px;" href="personal/index.jsp">${session.currUser.userName}</a> 

							</s:else>


						</div></li>
				</ul>
			</div>


		</div>
	</div>
</body>
</html>