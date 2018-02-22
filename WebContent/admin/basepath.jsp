    <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<base href="<%=basePath%>"></base>
<link rel="stylesheet" href="resource/plugins/layui/css/layui.css" media="all">
<link rel="stylesheet" href="resource/build/css/app.css" media="all">
<script src="resource/plugins/layui/layui.js"></script>
