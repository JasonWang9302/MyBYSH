<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
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

<table class="layui-table"
				lay-data="{url:'jsonBid-showBidList?proId='+${proId}, id:'idTest'}"
				lay-filter="demo">
				<thead>
					<tr>
						<th lay-data="{field:'servicer', width:80,templet:'<div>{{d.servicer.userName}}</div>'}">投标者</th>
						<th lay-data="{field:'f', width:80,templet:'<div>{{d.servicer.grades}}</div>', sort: true}">服务者评分</th>
						<th lay-data="{field:'bidDoc', width:150,templet:'#titleTpl'}">标书下载</th>
						<th lay-data="{field:'bidReason', width:180, sort: true}">竞标理由</th>
						<th lay-data="{field:'contactNumber', width:120, sort: true}">联系电话</th>
						<th lay-data="{field:'bidTime', width:100}">投标时间</th>
						<th lay-data="{fixed:'right',title: '操作', width:70, toolbar: '#barDemo'}"></th>
					</tr>
				</thead>
			</table>
<script type="text/html" id="titleTpl">
    <a href="uploadAction-downloadFile?fileName={{d.bidDoc}}" class="layui-table-link">{{d.bidDoc}}</a>
</script>
<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
  <a class="layui-btn layui-btn-xs" lay-event="edit">选他中标</a>
</script>
			<script>
				layui
						.use(
								'table',
								function() {
									var table = layui.table;
									var $ = layui.jquery;
									//监听表格复选框选择
									table.on('checkbox(demo)', function(obj) {
										console.log(obj)
									});

									//监听工具条
									table
											.on(
													'tool(demo)',
													function(obj) {
														var data = obj.data;
														if (obj.event === 'detail') {
															//查看操作
															
														} else if (obj.event === 'del') {
															
														//删除操作
														} else if (obj.event === 'edit') {
															
															layer.confirm('确定选'+data.servicer.userName+'来接此项目吗？', {
																  btn: ['确定','取消'] //按钮
																}, function(){
																	window.location.href='project-chooseServicer?userId='+data.servicer.userId+'&proId='+data.project.proId;
																	
																	var index=parent.layer.getFrameIndex(window.name);
																    layer.msg('选标成功', {icon: 1});
																	parent.layer.close(index);
																	//刷新
																 	window.parent.location.reload();
																}, function(){
																  layer.msg('也可以这样', {
																    time: 20000, //20s后自动关闭
																    btn: ['明白了', '知道了']
																  });
																});
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
</body>
</html>