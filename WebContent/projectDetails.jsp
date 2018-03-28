<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="resource/css/comm.css" />
<link rel="stylesheet" type="text/css"
	href="resource/css/projectDetails.css" />
<link rel="stylesheet" href="resource/plugins/layui/css/layui.css"
	media="all">
<title>Insert title here</title>
</head>
<body>
	<!-- 引入导航 -->
	<%@ include file="comm-nav.jsp"%>

	<!-- 内容部分开始 -->
	<!-- 小导航 -->
	<div id="wzdhDiv">
		<a style="font-size: 18px;" href="javascript:history.back(-1)">任务列表
			></a>任务详情
	</div>
	<!-- 上面属性 -->
	<div class="proListItem">
		<div class="proItemLeft">
			<font style="font-size: 20px;">${request.project.proName}</font> <br>
			<br>
			<table style="cellspacing: 100px;">
				<tr>
					<td><font> 发布人：${request.project.publisher.userName}</font></td>
					<td style="line-height: 50px;"><font
						style="margin-left: 50px;">发布时间：${request.project.createTime}</font></td>
				</tr>
				<tr>
					<td><font>需交保证金：${request.project.compensationRate} </font></td>
					<td><font style="margin-left: 50px;">完成时限至：${request.project.preDeliveryTime}</font></td>
				</tr>
			</table>

		</div>

		<div class="proItemRigth">
			<div style="float: right;margin-right: 40px;">
				<font style="font-size: 25px; color: red; ">¥
					${request.project.projectFund} 元</font>
			</div>
			<div
				style="margin-top: 8px; float: right; clear: both;margin-right: 40px;">
				<font style="font-size: 30px; text-align: right;">
				<c:if test="${request.project.status==2}">选标中</c:if>
				<c:if test="${request.project.status==1}">招标中</c:if>
				<c:if test="${request.project.status==3}">进行中</c:if>
				<c:if test="${request.project.status==4}">待验收</c:if>
				<c:if test="${request.project.status==5}">已完成</c:if>
				</font>
			</div>
		</div>
	</div>
	<!-- 具体详情 -->
	<div id="projectDetails">
		<font style="font-size: 18px;">任务详情 </font>
		<div style="padding: 10px; font-size: 16px;">
			<font>${request.project.category.cateName}</font><br><br> <font
				style="font-size: 15px;">描述:</font><br>&nbsp;&nbsp;&nbsp;&nbsp;
			${request.project.proDesc}
		</div>
		<hr />
		<font style="font-size: 18px;">下载招标书 </font><br> <img
			style="padding: 10px;" alt="" src="resource/images/fj.png"><a
			href="uploadAction-downloadFile?fileName=${request.project.rfp}">${request.project.rfp}<a>

				<br> <br>
<!-- 				<button id="ceshi">参与竞标</button> -->
				<a class="layui-btn  layui-btn-xs" id="ceshi" lay-event="edit">参与竞标</a>
	</div>
	</div>



	<!-- 测试 -->
	<script>
		layui
				.use(
						[ 'form', 'layedit', 'laydate', 'upload' ],
						function() {
							var form = layui.form, layer = layui.layer, layedit = layui.layedit, laydate = layui.laydate;
							//为上传文件加的
							var $ = layui.jquery, upload = layui.upload;

							$("#ceshi")
									.on(
											"click",
											function() {
												//弹窗
												layer
														.open({
															type : 2,
															title : '请上传您的标书及联系电话参与竞标!',
															shade : [ 0.3,
																	'#000' ],
															maxmin : false, //开启最大化最小化按钮
															area : [ '600px',
																	'500px' ],
															content : 'bid-toBid?proId='
																	+ '${request.project.proId}'
														});

											});
						});
		<!--测试-->
	</script>

	<!-- 内容部分结束 -->

	<!-- 引入底部 -->
	<%@ include file="comm-foot.jsp"%>

</body>
</html>