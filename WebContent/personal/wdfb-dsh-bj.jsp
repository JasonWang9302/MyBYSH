<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
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




		<!-- 	表单开始 -->
		<form class="layui-form" action="project-updateProject" method="post">
		
		
            <!--  项目id隐藏域 -->
		<input type="hidden" name="proId" lay-verify="required"
						value="${project.proId}" placeholder="请输入" autocomplete="off"
						class="layui-input">
		
			<!-- 项目名称 -->
			<div class="layui-form-item">
				<label class="layui-form-label" style="margin-left: -20px;"><img alt=""
					src="resource/images/must.png">项目名称：</label>
				<div class="layui-input-block" >
					<input type="text" name="proName" lay-verify="required"
						value="${project.proName}" placeholder="请输入" autocomplete="off"
						class="layui-input" disabled="disabled">
				</div>
				<div class="layui-form-mid layui-word-aux" style="margin-left: 120px;">项目名称暂不支持修改</div>
			</div>
<!-- 项目类别 -->
			<div class="layui-form-item">
				<label class="layui-form-label" style="margin-left: -30px;"><img
					alt="" src="resource/images/must.png">项目类别:</label><br> <br>
				<div class="layui-input-block" style="margin-left: 0px;">

					<s:iterator value="%{#request.cateList}" var="pic">
						<input type="radio" name="category.cateId" value="${pic.cateId}"
							title="${pic.cateName}" class="layui-input"
							<c:if test="${cateId eq project.category.cateId}">checked</c:if>>
					</s:iterator>
				</div>
			</div>
			<!-- 交付时间 -->
			<div class="layui-form-item">

				<label class="layui-form-label" style="margin-left: -30px;"><img
					alt="" src="resource/images/must.png">验证日期:</label>
				<div class="layui-input-block" style="margin-left: 0px;">
					<input type="text" name="preDeliveryTime" id="date" value="${project.preDeliveryTime}"
						lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off"
						class="layui-input">
				</div>
			</div>
			<!-- 招标书 -->
			<div class="layui-form-item">
				<label class="layui-form-label" style="margin-left: -30px;"><img
					alt="" src="resource/images/must.png">上传招标:</label><br> <br>
				<div class="layui-upload">

					<div class="layui-input-block" style="margin-left: 0px;">
						<button type="button" class="layui-btn layui-btn-normal"
							id="test8">选择文件</button>原始文件：${project.rfp}
						<button type="button" class="layui-btn" id="test9">开始上传</button>
					</div>
				</div>
			</div>

			<!-- 标书的saveName -->
			<input type="text" id="rfp" name="rfp" value="${project.rfp}" />

			<!-- 项目资金 -->
			<div class="layui-form-item">
				<label class="layui-form-label" style="margin-left: -30px;"><img
					alt="" src="resource/images/must.png">项目资金:</label>
				<div class="layui-input-block" style="margin-left: 0px;">
					<input type="text" name="projectFund" lay-verify="pass" value="${project.projectFund}"
						placeholder="请输入项目报酬" autocomplete="off" class="layui-input">
				</div>
				<div class="layui-form-mid layui-word-aux">项目资金</div>
			</div>
			<!-- 赔偿倍率 -->
			<div class="layui-form-item">
				<label class="layui-form-label" style="margin-left: -30px;"><img
					alt="" src="resource/images/must.png">违约赔率:</label>
				<div class="layui-input-block" style="margin-left: 0px;">
					<input type="text" name="compensationRate" lay-verify="pass" value="${project.compensationRate}"
						placeholder="请输入要求的保证金" autocomplete="off" class="layui-input">
				</div>
				<div class="layui-form-mid layui-word-aux">服务者按时交付任务的保证金</div>
			</div>
			<!-- 其他描述-->
			<div class="layui-form-item layui-form-text">
				<label class="layui-form-label" style="margin-left: -30px;"><img
					alt="" src="resource/images/must.png">简单描述：</label>
				<div class="layui-input-block" style="margin-left: 0px;">
					<textarea placeholder="请输入内容" name="proDesc" class="layui-textarea">${project.proDesc}</textarea>
				</div>
			</div>

			<div class="layui-form-item">
				<button class="layui-btn" lay-submit="" lay-filter="demo2">提交</button>
			</div>
		</form>
		<!-- 	表单结束 -->





		<script>
			layui
					.use(
							[ 'form', 'layedit', 'laydate', 'upload' ],
							function() {
								var form = layui.form, layer = layui.layer, layedit = layui.layedit, laydate = layui.laydate;
								//为上传文件加的
								var $ = layui.jquery, upload = layui.upload;

								//时间
								laydate.render({
									elem : '#date'
								});
								laydate.render({
									elem : '#date1'
								});

								//创建一个编辑器
								var editIndex = layedit
										.build('LAY_demo_editor');

								//自定义验证规则
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
								});

								//监听指定开关
								form
										.on(
												'switch(switchTest)',
												function(data) {
													layer
															.msg(
																	'开关checked：'
																			+ (this.checked ? 'true'
																					: 'false'),
																	{
																		offset : '6px'
																	});
													layer
															.tips(
																	'温馨提示：请注意开关状态的文字可以随意定义，而不仅仅是ON|OFF',
																	data.othis)
												});

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
											$("#rfp").val(res.data[0].src);
										}

									}
								});
							});
		</script>

	</div>
</body>

</html>