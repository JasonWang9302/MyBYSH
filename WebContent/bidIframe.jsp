<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="s" uri="/struts-tags" %>
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
<title>Insert title here</title>
<base href="<%=basePath%>"></base>
</head>
<body>
	<!-- 引入导航 -->

	<!-- 内容部分开始 -->
	<form class="layui-form" action="bid-doBid"  style="margin-top: 20px;">
	   <input type="hidden" value="${proId}" name="project.proId" />
	      <!-- 文件上传的 -->
		<!-- 标书 -->
		<div class="layui-form-item">
			<label class="layui-form-label"><!-- <img
				alt="" src="resource/images/must.png"> -->上传标书</label>
			<br>
			<div class="layui-upload">
				<div class="layui-input-block">
					<button type="button" class="layui-btn layui-btn-normal" id="test8">选择文件</button>
					<button type="button" class="layui-btn" id="test9">上传</button>
				</div>
			</div>
		</div>
		<!-- 标书的saveName -->
		<input type="hidden" id="bidDoc"  name="bidDoc" />
	
	
	
	
	
	
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">联系电话</label>
				<div class="layui-input-inline">
					<input type="tel" name="contactNumber" lay-verify="required|phone"
						autocomplete="off" class="layui-input" value="${currUser.phone}">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">邮箱</label>
				<div class="layui-input-inline">
					<input type="text" name="email" lay-verify="email"
						autocomplete="off" class="layui-input" value="${currUser.email}">
				</div>
			</div>
		</div>

		



		<div class="layui-form-item layui-form-text">
			<label class="layui-form-label">竞标理由</label>
			<div class="layui-input-block">
				<textarea placeholder="请输入内容" name="bidReason" class="layui-textarea"></textarea>
			</div>
		</div>




		<!--  提交 -->
		<div class="layui-form-item"  style="margin-left: 100px;">
			<button id="tj-btu" class="layui-btn" lay-submit="" lay-filter="demo2">提交竞标信息</button>
		</div>
	</form>









	<!-- 内容部分结束 -->

	<script>
		layui
				.use(
						[ 'form',/*  'layedit', 'laydate', */ 'upload' ],
						function() {
							var form = layui.form/* , layer = layui.layer, layedit = layui.layedit, laydate = layui.laydate */;
							//为上传文件加的
							var $ = layui.jquery, upload = layui.upload;

							/* 	//时间
								laydate.render({
									elem : '#date'
								});
								laydate.render({
									elem : '#date1'
								}); */

							//创建一个编辑器
					/* 		var editIndex = layedit.build('LAY_demo_editor'); */

							/* //自定义验证规则
							form.verify({
								title : function(value) {
									if (value.length < 2) {
										return '标题至少得2个字符啊';
									}
								},
								pass : [ /(.+){1,12}$/, '金额必须1到12位' ],
								content : function(value) {
									layedit.sync(editIndex);
								}
							}); */

						/* 	//监听指定开关
							form.on('switch(switchTest)', function(data) {
								layer.msg('开关checked：'
										+ (this.checked ? 'true' : 'false'), {
									offset : '6px'
								});
								layer.tips('温馨提示：请注意开关状态的文字可以随意定义，而不仅仅是ON|OFF',
										data.othis)
							}); */

							$("#tj-btu").on('click',function(){
							
							});
							
							/* 注册成功的提示 */
							var msg = "${requestScope.tip}";
							if (msg != "") {
								var index=parent.layer.getFrameIndex(window.name);
								parent.layer.close(index);
								alert(msg);
								//刷新
								window.parent.location.reload();
							}
							
							
							
							
							//监听提交
							form.on('submit(demo1)', function(data) {
								layer.alert(JSON.stringify(data.field), {
									title : '最终的提交信息'
								})
								return false;
							});

							//选完文件后不自动上传
							upload.render({
								elem : '#test8',
								url : 'uploadAction-upload',
								auto : false,
								multiple : true,
								accept : 'file',
								size : 100 * 1024,
								bindAction : '#test9',
								done : function(res, index, upload) {
									//假设code=0代表上传成功
									if (res.code == 0) {
										//do something （比如将res返回的图片链接保存到表单的隐藏域）
										console.log(res.data[0].src);
										$("#test8").after(res.msg);
										//为rfp隐藏域赋值
										$("#bidDoc").val(res.data[0].src);
									}

								}
							});
						});
	</script>
</body>
</html>