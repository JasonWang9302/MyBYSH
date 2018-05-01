<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="resource/css/comm.css" />
<link rel="stylesheet" type="text/css" href="resource/css/pubpro.css" />
<link rel="stylesheet" href="resource/plugins/layui/css/layui.css"
	media="all">
<script src="resource/plugins/layui/layui.js"></script>
<style type="text/css">
.bddq {
	margin-left: 0px;
}
</style>
<script type="text/javascript">
	/* 注册成功的提示 */
	var msg = "${requestScope.tip}";
	if (msg != "") {
		alert(msg);
	}
</script>


<title>Insert title here</title>

</head>
<body>
	<!-- 引入导航 -->
	<%@ include file="comm-nav.jsp"%>

	<!-- 内容部分开始 -->

	<!-- 图片区 -->
	<div id="fb-head"
		style="background-image: url('resource/images/xmfbzs.png');">
		<div id="fbwz">
			<font size="6px" color="#434343">发布您的项目需求</font><br> <br> <br>
			<font size="4px">你有独特的想法吗？你有与众不同的项目吗？您需要大众的帮助吗？<br>说出你的需求，我们帮您实现！
			</font>
		</div>
	</div>

	<!-- 发布信息区 -->
	<div id="fb-div2">

		<!-- 	表单开始 -->
		<form class="layui-form" action="project-publish" method="post">
			<!-- 项目名称 -->
			<div class="layui-form-item">
				<label class="layui-form-label" style="margin-left: -20px;"><img
					alt="" src="resource/images/must.png">项目名称：</label>
				<div class="layui-input-block" style="margin-left: 0px;">
					<input type="text" name="proName" lay-verify="required"
						placeholder="请输入项目名称" autocomplete="off" class="layui-input">
				</div>
			</div>

			<!-- 项目类别 -->
			<!-- 			<div class="layui-form-item">
				<label class="layui-form-label">单行选择框</label>
				<div class="layui-input-block">
					<select name="interest" lay-filter="aihao">
						<option value=""></option>
						<option value="0">写作</option>
						<option value="1" selected="">阅读</option>
						<option value="2">游戏</option>
						<option value="3">音乐</option>
						<option value="4">旅行</option>
					</select>
				</div>
			</div> -->

			<div class="layui-form-item">
				<label class="layui-form-label" style="margin-left: -30px;"><img
					alt="" src="resource/images/must.png">项目类别:</label><br> <br>
				<br>
				<div class="layui-input-block" style="margin-left: 0px;">
					<s:iterator value="%{#request.cateList}" var="cate">
						<input type="radio" name="category.cateId" value="${cate.cateId}"
							title="${cate.cateName}" class="layui-input"
							<c:if test="${cateId eq 1}">checked</c:if>>
					</s:iterator>

				</div>
			</div>
			<!-- 交付时间 -->
			<div class="layui-form-item">

				<label class="layui-form-label" style="margin-left: -30px;"><img
					alt="" src="resource/images/must.png">完成日期:</label>
				<div class="layui-input-block" style="margin-left: 0px;">
					<input type="text" name="preDeliveryTime" id="date"
						lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off"
						class="layui-input">
				</div>
			</div>
			<!-- 招标书 -->
			<div class="layui-form-item">
				<label class="layui-form-label" style="margin-left: -20px;"><img
					alt="" src="resource/images/must.png">上传招标:</label><br> <br>
				<br>
				<div class="layui-upload">

					<div class="layui-input-block" style="margin-left: 0px;">
						<button type="button" class="layui-btn layui-btn-normal"
							id="test8">选择文件</button>
						<button type="button" class="layui-btn" id="test9">开始上传</button>

					</div>
				</div>
			</div>

			<!-- 标书的saveName -->
			<input type="hidden" id="rfp" name="rfp" />

			<!-- 项目资金 -->
			<div class="layui-form-item">
				<label class="layui-form-label" style="margin-left: -20px;"><img
					alt="" src="resource/images/must.png">项目资金:</label>
				<div class="layui-input-block" style="margin-left: 0px;">
					<input type="text" name="projectFund" lay-verify="pass"
						placeholder="请输入项目酬金" autocomplete="off" class="layui-input">
				</div>
				<!-- <div class="layui-form-mid layui-word-aux">项目酬金</div> -->
			</div>
			<!-- 赔偿倍率 -->
			<div class="layui-form-item">
				<label class="layui-form-label" style="margin-left: -20px;"><img
					alt="" src="resource/images/must.png">违约赔付:</label>
				<div class="layui-input-block" style="margin-left: 0px;">
					<input type="text" name="compensationRate" placeholder="请输入违约赔付金" autocomplete="off" class="layui-input">
				</div>
				<div class="layui-form-mid layui-word-aux">用于工期担保</div>
			</div>
			<!-- 其他描述-->
			<div class="layui-form-item layui-form-text">
				<label class="layui-form-label" style="margin-left: -30px;"><img
					alt="" src="resource/images/must.png">其他描述</label>
				<div class="layui-input-block" style="margin-left: 0px;">
					<textarea placeholder="请对项目进行简单描述" name="proDesc" class="layui-textarea"></textarea>
				</div>
			</div>

			<div class="layui-form-item">
				<button class="layui-btn" lay-submit="" lay-filter="demo2">发  布</button>
			</div>
		</form>
		<!-- 	表单结束 -->

	</div>
	<!-- 内容部分结束 -->
<br>


	<!-- 引入底部 -->
	<%@ include file="comm-foot.jsp"%>



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
							var editIndex = layedit.build('LAY_demo_editor');

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
							form.on('switch(switchTest)', function(data) {
								layer.msg('开关checked：'
										+ (this.checked ? 'true' : 'false'), {
									offset : '6px'
								});
								layer.tips('温馨提示：请注意开关状态的文字可以随意定义，而不仅仅是ON|OFF',
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
</body>
</html>




