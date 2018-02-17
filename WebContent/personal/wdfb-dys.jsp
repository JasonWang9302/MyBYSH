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

	<div class="person">

		<div class="person-xdh">
			<a><font>我的发布</font></a> > <font>待验收</font>
		</div>
		<div class="content">
			<table class="layui-table"
				lay-data="{url:'wdfb-showDYS1', id:'idTest'}"
				lay-filter="demo">
				<thead>
					<tr>
						<!--  <th lay-data="{type:'checkbox', fixed: 'left'}"></th> -->
						<!--   <th lay-data="{field:'proId', width:80}">项目名称</th> -->
						<th lay-data="{field:'proName', width:130}">项目名称</th>
						<th lay-data="{field:'servicer', width:100,templet:'<div>{{d.servicer.userName}}</div>'}">服务者</th>
						<th lay-data="{field:'createTime', width:120}">创建时间</th>
						<th lay-data="{field:'guaranteeStatus', width:100,templet: '#dbztTpl'}">担保状态</th>
						<th lay-data="{field:'status', width:135, sort: true}">状态</th>
						<th lay-data="{field:'compensationRate', width:80, sort: true}">赔率</th>
						<th
							lay-data="{fixed:'right',title: '操作', width:360, toolbar: '#barDemo'}"></th>
					</tr>
				</thead>
			</table>
<script type="text/html" id="dbztTpl">
  {{#  if(d.guaranteeStatus ==0){ }}
   <font style="color: red;">双方未完成担保</font>
  {{#  }if(d.guaranteeStatus ==1){ }}
   <font style="color: red;">发布者未缴纳预付金</font>
  {{#  }if(d.guaranteeStatus ==2){ }}
   <font style="color: red;">服务者未缴纳保证金</font>
  {{#  }if(d.guaranteeStatus ==3){ }}
   <font>双方已完成担保</font>
  {{#  } }}
</script>

			<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="edit">查看进度汇报</a>
<a class="layui-btn  layui-btn-xs" lay-event="del">通过验收</a>
</script>
<!--   <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">提交进度汇报</a> -->
<!--   <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a> -->
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
														/* 通过验收 */
														if (obj.event === 'del') {

															layer.open({
																type : 2,
																title : '确定验收',
																shade : [ 0.3, '#000' ],
																//maxmin : false, //开启最大化最小化按钮
																area : [ '550px', '350px' ],
																content : 'dealing-toQRYS?proId='+data.proId
															});  
																
															
															
														} else if (obj.event === 'edit') {
																	//写操作
															layer.open({
																type : 2,
																title : '进度汇报列表',
																/* shade : [ 0.3, '#000' ], */
																maxmin : false, //开启最大化最小化按钮
																area : [ '900px', '450px' ],
																content : 'pgre-toShowPgReList?proId='+data.proId
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
		</div>
	</div>
</body>
</html>