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
<script type="text/javascript">
	var msg = "${requestScope.tipMessage}";
	if (msg != "") {
		alert(msg);
	}
</script>

<title>招标中</title>
</head>

<body>
<!-- <a href="bid-showBidList">heheh</a> -->

	<div class="person">

		<div class="person-xdh">
			<a><font>我的发布</font></a> > <font>招标中</font>
		</div>
		<div class="content">
			<table class="layui-table"
				lay-data="{url:'wdfb-showZBZ1', id:'idTest'}"
				lay-filter="demo">
				<thead>
					<tr>
						 <!--   <th lay-data="{field:'proId', width:80}">项目名称</th> -->
      <th lay-data="{field:'proName', width:150}">项目名称</th>
      <th lay-data="{field:'proDesc', width:150}">描述</th>
      <th lay-data="{field:'createTime', width:120}">创建时间</th>
<!--       <th lay-data="{field:'category', width:160}">项目分类</th> 
 -->     
      <th lay-data="{field:'projectFund', width:80}">酬金</th>
      <th lay-data="{field:'preDeliveryTime', width:120}">预定交付时间</th>
      
      <th lay-data="{field:'rfp', width:80}">招标书文件</th>
 <!--      <th lay-data="{field:'guaranteeStatus', width:80}">担保状态</th>
      <th lay-data="{field:'status', width:135, sort: true}">状态</th> -->
<!--       <th lay-data="{field:'endTime', width:135, sort: true}">状态</th> -->
      <th lay-data="{field:'compensationRate', width:100}">赔付</th>
						<th
							lay-data="{fixed:'right',title: '操作', width:220, toolbar: '#barDemo'}"></th>

					</tr>
				</thead>
			</table>


			<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">下载招标书</a>
  <a class="layui-btn layui-btn-xs" lay-event="edit">去选标</a>
</script>
<!--   <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a> -->
			<script>
				layui
						.use(
								'table',
								function() {
									var table = layui.table;
									var $ = layui.jquery;
									//监听工具条
									table
											.on(
													'tool(demo)',
													function(obj) {
														var data = obj.data;
														if (obj.event === 'detail') {
															window.location.href='uploadAction-downloadFile?fileName='+data.rfp;
														} else if (obj.event === 'edit') {
														/* 	layer.alert('编辑行：<br>'+ data.proId); */
																	layer.open({
																		type : 2,
																		title : '投标列表',
																		/* shade : [ 0.3, '#000' ], */
																		maxmin : false, //开启最大化最小化按钮
																		area : [ '900px', '450px' ],
																		content : 'bid-showBidList?proId='+data.proId
																	});
																	
																	
															/*  
															  $.get("user-toLogin", { "proId": data.proId}, function (data) {
															   
															   window.location.href = "data";
															   
															})
															 */

														}
													});
									$('.demoTable .layui-btn')
											.on(
													'click',
													function() {
														var type = $(this)
																.data('type');
														active[type] ? active[type]
																.call(this)
																: '';
													});
								});
			</script>












		</div>

	</div>
</body>

</html>