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
layui.use('layer', function(){ 
	var layer = layui.layer; 
	var msg = "${saveSuccessTipMessage}";
	if (msg != "") {
		layer.msg(msg, {icon: 6});
	}
});
</script>

<title>我的信息</title>
</head>

<body>

	<div class="person">
		<div class="person-xdh">
			<a><font>账户管理</font></a> > <font>我的信息</font>
		</div>
		<div class="content">
			<form class="layui-form" action="user-updateMyInfo">
			     <div class="layui-form-item">
					<div class="layui-inline" style="width: 190px;">
						<input type="hidden" name="userId"
							autocomplete="off"  value="${myInfo.userId}" class="layui-input">
					</div>
				</div>
				<!-- 昵称 -->
				<div class="layui-form-item">
					<label class="layui-form-label">昵称</label>
					<div class="layui-inline" style="width: 190px;">
						<input type="text" name="userName"
							autocomplete="off" disabled="disabled" value="${myInfo.userName}" placeholder="请输入标题" class="layui-input">
					</div>
				</div>
				<!-- <div class="layui-form-item">
					<label class="layui-form-label">验证必填项</label>
					<div class="layui-input-block">
						<input type="text" name="username" lay-verify="required"
							placeholder="请输入" autocomplete="off" class="layui-input">
					</div>
				</div> -->



				<!-- 手机和邮箱	 -->
				<div class="layui-form-item">
					<div class="layui-inline">
						<label class="layui-form-label">手机号</label>
						<div class="layui-input-inline">
							<input type="tel" name="phone" lay-verify="required|phone"
								autocomplete="off" value="${myInfo.phone}" class="layui-input">
						</div>
					</div>
				</div>
				<div class="layui-form-item">
					<div class="layui-inline">
						<label class="layui-form-label">邮箱</label>
						<div class="layui-input-inline">
							<input type="text"  name="email" lay-verify="email" placeholder="请输入邮箱"
								autocomplete="off" value="${myInfo.email}"  class="layui-input">
						</div>
					</div>
				</div>
				<!-- 登录密码 -->
				<div class="layui-form-item">
					<div class="layui-inline">
						<label class="layui-form-label">登录密码</label>
						<div class="layui-input-inline">
							<input type="password" name="password" lay-verify="pass" value="${myInfo.password}"
								placeholder="请输入登录密码" autocomplete="off"
								<%-- value="${myInfo.password}" --%> class="layui-input">
							<input type="password" lay-verify="rePassword"  placeholder="二次确认"
								autocomplete="off" value="${myInfo.password}"
								class="layui-input">
						</div>

						<!-- <div class="layui-form-mid layui-word-aux">请两次相同</div> -->
					</div>
				</div>
                


				<!-- 支付密码 -->
				<div class="layui-form-item">
					<label class="layui-form-label">支付密码</label>
					<div class="layui-input-inline">
						<input type="password" value="${myInfo.payPassword}"
							name="payPassword" placeholder="请输入支付密码" lay-verify="pass" autocomplete="off"
							class="layui-input"> <input type="password"
						    placeholder="二次输入"  lay-verify="rePayPassword" autocomplete="off"
							value="${myInfo.payPassword}" class="layui-input">
					</div>
				</div>
				
				<!-- 账户余额 -->
                <div class="layui-form-item">
					<div class="layui-inline">
						<label class="layui-form-label">账户余额</label>
						<div class="layui-input-inline">
							<input type="text" id="zhye" name="balance" disabled="disabled"  value="${myInfo.balance}" class="layui-input">
						</div><a href="javascript:;" id="cz"><font size="4px" color="blue">去充值</font></a>
					</div>
				</div>
				
				<!-- 服务满意度-->
                <div class="layui-form-item">
					<div class="layui-inline">
						<label class="layui-form-label">评分</label>
						<div class="layui-input-inline">
							<input type="text" name="grades" disabled="disabled"  value="${myInfo.grades}" class="layui-input">
						</div>
					</div>
				</div>


				<!-- 自我简介 -->
				<div class="layui-form-item layui-form-text">
					<label class="layui-form-label">自我简介</label>
					<div class="layui-input-block" 
						style="width: 600px;">
						<textarea placeholder="请输入自我介绍，如特长、技能、项目经验等利于您竞标的信息" name="introduction" 
							class="layui-textarea">${myInfo.introduction}</textarea>
					</div>
				</div>
				<!-- 保存 -->
				<div class="layui-form-item">
					<div class="layui-input-block">
						<button class="layui-btn" lay-submit="" lay-filter="demo1">保存</button>
					</div>
				</div>


			</form>
		</div>
	</div>
	
	
	
	<script>
  layui.use(['form', 'layedit', 'laydate'], function(){
   var form = layui.form
  ,layer = layui.layer
  ,layedit = layui.layedit
  ,laydate = layui.laydate
  ,$ = layui.jquery;

  
   $("#cz").on("click", function() {
		layer.open({
			type : 2,
			title : '使用银行卡充值',
			shade : [ 0.3, '#000' ],
			maxmin : false, //开启最大化最小化按钮
			area : [ '350px', '300px' ],
			content : 'user-toRecharge'
		}); 
	});
  
   
  
  
  
  
  
  
  
  //日期
  laydate.render({
    elem: '#date'
  });
  laydate.render({
    elem: '#date1'
  });
  
  //创建一个编辑器
  var editIndex = layedit.build('LAY_demo_editor');
 
  //自定义验证规则
  form.verify({
    title: function(value){
      if(value.length < 5){
        return '标题至少得5个字符啊';
      }
    }
    ,pass: [/(.+){6,12}$/, '密码必须6到12位']
    ,content: function(value){
      layedit.sync(editIndex);
    }
    ,rePayPassword: function(value){
    	var passwordValue = $('input[name=payPassword]').val();
    	if(value != passwordValue){
    	return '两次输入的支付密码不一致!';
    	}
    }
    ,rePassword: function(value){
    	var passwordValue = $('input[name=password]').val();
    	if(value != passwordValue){
    	return '两次输入的密码不一致!';
    	}
    }
    
  });
  
  //监听指定开关
  form.on('switch(switchTest)', function(data){
    layer.msg('开关checked：'+ (this.checked ? 'true' : 'false'), {
      offset: '6px'
    });
    layer.tips('温馨提示：请注意开关状态的文字可以随意定义，而不仅仅是ON|OFF', data.othis)
  });
  
  //监听提交
 /*  form.on('submit(demo1)', function(data){
    layer.alert(JSON.stringify(data.field), {
      title: '最终的提交信息'
    })
    
  });
   */
  
});
</script>
</body>
</html>