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
	<!-- layui 形式表格的实现  自由受限 暂放弃-->
		<table class="layui-hide" id="test"></table>       
	<div class="person">


		<a class="person-xdh">我的产品</a> > <font>我的项目</font><br>
	
		<div class="content">
		
		
		
			<!-- Table goes in the document BODY -->
			<%-- <table class="table-content">
				<!-- 表头 -->
				<tr>
					<th>项目名</th>
					<th>项目描述</th>
					<th>创建时间</th>
					<th>所属类别</th>
					<th>项目金额</th>
					<th>违约金</th>
					<th>预定交付时间</th>
					<th>操 作</th>
				</tr>




				<!-- 表体 -->
				<s:iterator value="#request.projectList">
					<tr>
						<td>${proName}</td>
						<td style="overflow: hidden;width: 40px;height: 30px;"><div style="width: 68px;height: 30px;"> ${proDesc}</div></td>
						<td>${createTime}</td>
						<td>${category.cateName}</td>
						<td>${projectFund}</td>
						<td>${compensationRate}</td>
						<td>${preDeliveryTime}</td>
						<td>查看详情</td>
					</tr>
				</s:iterator>
			</table> --%>










		</div>

	</div>














	<a href="uploadAction-showDSH">qwerthgfsdfd</a>
	<script type="text/html" id="titleTpl">
  {{d.category.cateName}}
</script>
	<script>
		layui.use('table', function() {
			var table = layui.table;

			table.render({
				elem : '#test',
				url : 'uploadAction-showDSH',
				cols : [ [ {
					field : 'proName',
					width : 135,
					title : '项目名'
				}, {
					field : 'proDesc',
					width : 150,
					title : '描述'
				}, {
					field : 'createTime',
					width : 120,
					title : '创建时间',
					sort : true
				}, {
					field : 'category',
					width : 80,
					title : '分类',
					templet: '<div>{{d.category.cateName}}</div>'
				}, {
					field : 'preDeliveryTime',
					title : '预定交付时间',
					minWidth : 150
				}, {
					field : 'rfp',
					width : 80,
					title : '标书文件'
				}, {
					field : 'status',
					width : 80,
					title : '状态'
				}
				, {
					field : 'compensationRate',
					width : 135,
					title : '财富',
					sort : true
				}, {
					field : 'projectFund',
					width : 135,
					title : '项目资金',
					sort : true
				} ] ],
				page : false
			});
		});
	</script>
</body>

</html>