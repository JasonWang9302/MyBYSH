<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%-- <%@ taglib prefix="s" uri="/struts-tags"%> --%>
<%-- <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%> --%>
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
	<div style="padding: 20px;">
		<font>项目名：${project.proName}</font><br> 您需要缴纳<font
			style="color: red; font-size: 10;">${project.projectFund}元</font><br>输入支付密码完成担保。
	</div>
	<%-- <input type="text" name="project.proId" value="${project.proId}" /> --%>
	${project.proId}
	<form class="layui-form"
		action="dealing-payMargin?proId=${project.proId}" method="post"
		style="margin-left: -20px; padding-right: 10px;">
		<!--  项目id隐藏域 -->
		<input type="text" name="project.proId" lay-verify="required"
			value="${request.project.proId}" placeholder="请输入" autocomplete="off"
			class="layui-input">




		<div class="layui-form-item">
			<label class="layui-form-label">支付密码</label>
			<div class="layui-input-inline">
				<input type="password" name="zfPassword" lay-verify="pass"
					placeholder="请输入密码" autocomplete="off" class="layui-input">
			</div>
			<div class="layui-form-mid layui-word-aux">请填写6到12位密码</div>
		</div>


		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
			</div>
		</div>
	</form>

	<script>
		layui
				.use(
						[ 'form', 'layedit' ],
						function() {
							var form = layui.form, layer = layui.layer, layedit = layui.layedit;
							var $ = layui.jquery;

							/* 	$(function(){
							 */
							/* 支付成功的提示 */
							var msg1 = "${requestScope.paySuccessTip}";
							if (msg1 != "") {
								// 关闭layer
								layer.msg("支付成功！", {
									icon : 6,
									time: 1000,
									end : function() {
										var index = parent.layer
												.getFrameIndex(window.name); //获取窗口索引
										parent.layer.close(index);
										window.parent.location.reload();

									}
								});
							}
							/* 错误的提示 */
							var msg2 = "${requestScope.payFailTip}";
							if (msg2 != "") {
								// 关闭layer
								layer.msg(msg2, {
									icon : 5,
									time:3000,
								});
							} 
							//自定义验证规则
							form.verify({
								title : function(value) {
									if (value.length < 5) {
										return '标题至少得5个字符啊';
									}
								},
								pass : [ /(.+){6,12}$/, '密码必须6到12位' ],
								content : function(value) {
									layedit.sync(editIndex);
								}
							});

							//监听提交
							form.on('submit(demo1)', function(data) {
								/* layer.alert(data.zfPassword), {
									title : '最终的提交信息'
								})
								return false;  */
								/* layer.msg("支付成功", {icon: 6}); */

								/*   window.location.href = "dealing-payAdvance?proId="+${project.proId}+"&zfPassword="+data.zfPassword;
								  return false; */
							});

						});
	</script>

</body>