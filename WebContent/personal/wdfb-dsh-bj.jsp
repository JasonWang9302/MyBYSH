<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 引入基路径设置(内包括layui) -->
<%@ include file="basepath.jsp"%>
<link rel="stylesheet" type="text/css"
	href="resource/css/person-comm.css" />
<link rel="stylesheet" type="text/css" href="resource/css/wdfb-dsh.css" />
<title>Navbar组件</title>
</head>

<body>


	<div class="person">

		<div class="person-xdh">
			<a><font>我的发布</font></a> > <font>修改</font>
		</div>
		<div class="content"></div>
        
        ${proId} 
        ${proName}
            呵呵呵回复 额返回
	</div>
</body>

</html>