<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="basepath.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- 用户:${currUser.userName} --%>
	<br><br>
	<!-- 支付密码 -->
	<form class="layui-form" action="">


		<div class="layui-form-item">
			<label class="layui-form-label">充值金额</label>
			<div class="layui-input-block">
				<input type="text" id="CZJE" style="width: 200px"
					 autocomplete="off" lay-verify=czje placeholder="请输入充值金额"
					class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">银行卡号</label>
			<div class="layui-input-block">
				<input type="text" name="YHKH" style="width: 200px"
					lay-verify="yhkh" autocomplete="off" placeholder="请输入银行卡号"
					class="layui-input">
			</div>
		</div>

		<div class="layui-form-item">
			<label class="layui-form-label">支付密码</label>
			<div class="layui-input-inline">
				<input type="password" style="width: 200px"
					value="${myInfo.payPassword}" name="payPassword"
					placeholder="请输入密码" lay-verify="pass" autocomplete="off" class="layui-input">
			</div>
		</div>

		<div class="layui-form-item" style="margin-left:140px">
			<button class="layui-btn" lay-submit="" lay-filter="ch">充  值</button>
		</div>



	</form>
</body>
<script>
	layui
			.use(
					[ 'form', 'layedit', 'laydate' ],
					function() {
						var form = layui.form, layer = layui.layer, layedit = layui.layedit, laydate = layui.laydate, $ = layui.jquery;
						
						
						
						  //自定义验证规则
						  form.verify({
						    pass: [/(.+){6,12}$/, '密码必须6到12位']
						    ,content: function(value){
						      layedit.sync(editIndex);
						    }
						    ,yhkh: function(value){
						    	if(value ==""){
						    	return '请输入卡号!';
						    	}
						    }
						    ,czje: function(value){
						    	if(value ==""){
						    	return '请输入充值金额!';
						    	}
						    }
						    
						  });
						form.on('submit(ch)', function(data){
							    /* layer.alert(JSON.stringify(data.field), {
							      title: '最终的提交信息'
							    }) */
							  /*   alert(data); */
							    var CZJE=$("#CZJE").val();
							    alert(CZJE);
							    $.ajax({
						              url: "user-recharge",
						              type: "POST",
						              data:{"CZJE":CZJE},
						              dataType: "json",
						              success: function(data){

						                  if(data!=-1){
						                     //关闭弹框
						                      var index=parent.layer.getFrameIndex(window.name);
						                     //修改父窗口账户余额的值
						                      window.parent.document.getElementById("zhye").value=data;
						                      parent.layer.msg("充值成功", {icon: 6});
						                      parent.layer.close(index);
						                  }else{
						                	  parent.layer.msg("充值失败", {icon: 5});
						                  }
						              }
						          });
							    
							    
							    return false;
							  });
					
					});
</script>




</html>