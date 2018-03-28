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
		<div class="person-xdh"></div>
		<div class="content">
			<table class="layui-table"
				lay-data="{url:'wdfb-showAllUnchecked', id:'idTest'}"
				lay-filter="demo">
				<thead>
					<tr>
						<th lay-data="{field:'proName', width:180}">项目名称</th>
						<th lay-data="{field:'proDesc', width:180}">项目描述</th>
						<th lay-data="{field:'publisher', width:120,templet:'<div>{{d.publisher.userName}}</div>'}">发布者</th>
						<th lay-data="{field:'publisher', width:120,templet:'<div>{{d.publisher.phone}}</div>'}">电话</th>
					<!-- 	<th lay-data="{field:'category', width:160}">项目分类</th>  -->
                        <th lay-data="{field:'createTime', width:120}">创建时间</th>
						<th lay-data="{field:'projectFund', width:80, sort: true}">酬金</th>
						<th lay-data="{field:'preDeliveryTime', width:120}">预定交付时间</th>

						<th lay-data="{field:'rfp', width:80}">招标书文件</th>
						<th lay-data="{field:'compensationRate', width:100}">赔付</th>
						<th
							lay-data="{fixed:'right',title: '操作', width:270, toolbar: '#barDemo'}"></th>
					</tr>
				</thead>
			</table>


			<script type="text/html" id="barDemo">
  			<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
 			<a class="layui-btn  layui-btn-xs" lay-event="del">通过</a>
  			<a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="edit">不通过</a>
  
</script>
			<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
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
															window.location.href='uploadAction-downloadFile?fileName='+data.rfp;
														} else if (obj.event === 'del') {
															/*  layer.confirm('真的删除行么', function(index){
															  console.log(data); */
															$.ajax({
																		url : "project-adminCheckProject",
																		type : "POST",
																		data : {
																			"proId" : data.proId
																		},
																		dataType : "json",
																		success : function(
																				data) {

																			if (data == 1) {
																				//删除这一行
																				obj
																						.del();
																				//关闭弹框
																				/*    layer.close(index); */
																				layer
																						.msg(
																								"审核成功",
																								{
																									icon : 6
																								});
																			} else {
																				layer
																						.msg(
																								"审核失败",
																								{
																									icon : 5
																								});
																			}
																		}
																	});
															/*           }); */

														} else if (obj.event === 'edit') {
															window.location.href = "project-toEditProject?proId="
																	+ data.proId;
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