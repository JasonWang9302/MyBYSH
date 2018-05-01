<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%-- <%@ taglib prefix="s" uri="/struts-tags"%> --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="resource/plugins/layui/css/layui.css"
	media="all">
<link rel="stylesheet" href="resource/build/css/app.css" media="all">
<script src="resource/plugins/layui/layui.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="resource/css/projectList.css" rel="stylesheet"
	type="text/css" />

<title>Insert title here</title>
</head>
<body>
	<!-- 引入导航 -->
	<%@ include file="comm-nav.jsp"%>
<%--    
   
   <c:if test="${1==1}">
    111

</c:if> --%>

	<!-- 搜素功能开始  -->
	<div
		style="width: 1000px; margin: 20px auto 20px; background-color: #dbdbdb; padding-top: 20px;">

		<form class="layui-form" action="">
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">类别</label>
					<div class="layui-inline" style="width: 50%">
						<select id="cateId">
							<option value="-1" selected="">全部</option>
							<!-- <option value="0">写作</option> -->
							<option value="1">网站开发</option>
							<option value="2">管理系统开发</option>
							<option value="3">手机App开发</option>
							<option value="4">微信开发</option>
							<option value="5">游戏开发</option>
						</select>
					</div>
				</div>

				<div class="layui-inline" style="margin-left: -100px;">
					<label class="layui-form-label">状态</label>
					<div class="layui-inline" style="width: 50%">
						<select id="status" lay-filter="aihao">
							<option value="-1" selected="">全部</option>
							<!-- <option value="0">写作</option> -->
							<option value="1">招标中</option>
							<option value="2">已选标</option>
							<option value="3">进行中</option>
							<option value="4">待验收</option>
							<option value="5">已完成</option>
						</select>
					</div>
				</div>



				<div class="layui-inline" style="padding-left: 80px;">
					<input type="text" name="title" id="keyWord" autocomplete="off"
						placeholder="请输入关键字" class="layui-input">
				</div>
				<div class="layui-inline">
					<button class="layui-btn" lay-submit="" lay-filter="ss">搜索</button>
				</div>
			</div>
		</form>
	</div>
	<!-- 搜素功能结束  -->

	<div id="con"></div>
	<div id="demo4" style="width: 1000px; margin: 0 auto;"></div>


	<!-- 搜索功能js -->
	<script>
layui.use(['form', 'layedit', 'laydate'], function(){
  var form = layui.form
  ,layer = layui.layer
  ,layedit = layui.layedit
  ,laydate = layui.laydate
  ,$ = layui.jquery;
   
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
  });
  
  //监听指定开关
  form.on('switch(switchTest)', function(data){
    layer.msg('开关checked：'+ (this.checked ? 'true' : 'false'), {
      offset: '6px'
    });
    layer.tips('温馨提示：请注意开关状态的文字可以随意定义，而不仅仅是ON|OFF', data.othis)
  });
});
</script>
	<script>
	/* 总条数 */
	/* var count1="${requestScope.count}"; */
	//首此加载渲染首页
layui.use(['laypage', 'layer','form', 'layedit', 'laydate'], function(){
  var form = layui.form,laypage = layui.laypage,layer = layui.layer,$ = layui.jquery,layedit = layui.layedit ,laydate = layui.laydate;
 
  var cateId=$('#cateId').val();
  var status=$("#status").val();
  var keyWord=$("#keyWord").val();

  $.ajax({
	　　url:'jsonProject-showProjectListByPage',
	　　data:{
	　　curr:1,
	　　limit:5,
	   cateId:cateId,
	　　status:status,
	   keyWord:keyWord
	　　},
	　　type:'post',
	　　success:function(data){
	/* 	alert(obj.curr);
		alert(obj.limit); */
	　　//向页面渲染后台传过来的数据
	
        var projectList=data.data;
		/* alert(projectList); */
		var con="";
		 $.each(projectList, function(index, item){
			/*  int status=item.status; */
			/*  alert(status); */
			con += "<a class='proItemLefta' href='project-showDetail?proId="+item.proName+"' style='text-decoration: none;'>";
			con += "<div class='proListItem'>";
			con += "<div class='proItemLeft'>";
			con += "<font style='font-size: 20px;'>"+item.proName+"</font>&nbsp;&nbsp;&nbsp; ";
		    con += "<font style='font-size: 10px'>"+item.createTime+"发布</font> <br><br> ";
			con += "<div class='proDesc'><font Style='font-size: 13px'>"+item.proDesc+"</font></div><br><br>";
			con += "<font style='font-size: 20px;'>"+item.category.cateName+"</font></div>";
			con += "<div class='proItemRigth'>"; 
			con += "<div style='float: right;margin-right: 40px;'>"; 
			con += "<font style='font-size: 25px; color: red;'>¥ "+item.projectFund+"元</font></div><div style='margin-top: 8px; float: right; clear: both;margin-right: 40px;'><font style='font-size: 25px; text-align: right;'>";  
			 if(item.status==1){
				con+="招标中";
			 } 
			 else if(item.status==2){
				con+="已选标";
			} 
			 else if(item.status==3){
				con+="进行中";
			} 
			 else if(item.status==4){
				con+="待验收";
			} 
			 else if(item.status==5){
				con+="已完成";
			} 
			 else{}
			con += "</font></div></div></div></a>"; 
			
		});
		 $("#con").html(con);
	　　},
	　　error:function(){
	　　console.log('网络错误，通信失败');
	　　}
	　　})
	  //分页
  laypage.render({
	  elem: 'demo4'
	  ,count:${requestScope.count}  //数据总数，从服务端得到
	  ,limit:5
	  ,jump: function(obj, first){
	    //obj包含了当前分页的所有参数，比如：
	    console.log(obj.curr); //得到当前页，以便向服务端请求对应页的数据。
	    console.log(obj.limit); //得到每页显示的条数
	    var cateId=$('#cateId').val();
	    var status=$("#status").val();
	    var keyWord=$("#keyWord").val();
	    $.ajax({
	    	　　url:'jsonProject-showProjectListByPage',
	    	　　data:{
	    	　　curr:obj.curr,
	    	　　limit:obj.limit,
	    	   cateId:cateId,
	    	　　 status:status,
	    	   keyWord:keyWord
	    	　　},
	    	　　type:'post',
	    	　　success:function(data){
	    	/* 	alert(obj.curr);
	    		alert(obj.limit); */
	    	　　//向页面渲染后台传过来的数据
	    		/* console.log(data); */
	            var projectList=data.data;
	    		/* alert(projectList); */
	    		var con="";
	    		 $.each(projectList, function(index, item){
	    			con += "<a class='proItemLefta' href='project-showDetail?proId="+item.proId+"' style='text-decoration: none;'>";
	    			con += "<div class='proListItem'>";
	    			con += "<div class='proItemLeft'>";
	    			con += "<font style='font-size: 20px;'>"+item.proName+"</font>&nbsp;&nbsp;&nbsp; ";
	    		    con += "<font style='font-size: 10px'>"+item.createTime+"发布</font> <br><br> ";
	    			con += "<div class='proDesc'><font Style='font-size: 13px'>"+item.proDesc+"</font></div><br><br>";
	    			con += "<font style='font-size: 20px;'>"+item.category.cateName+"</font></div>";
	    			con += "<div class='proItemRigth'>"; 
	    			con += "<div style='float: right;margin-right: 40px;'>"; 
	    			con += "<font style='font-size: 25px; color: red;'>¥ "+item.projectFund+"元</font></div><div style='margin-top: 8px; float: right; clear: both;margin-right: 40px;'><font style='font-size: 25px; text-align: right;'>";  
	   			 if(item.status==1){
	   				con+="招标中";
	   			 } 
	   			 else if(item.status==2){
	   				con+="已选标";
	   			} 
	   			 else if(item.status==3){
	   				con+="进行中";
	   			} 
	   			 else if(item.status==4){
	   				con+="待验收";
	   			} 
	   			 else if(item.status==5){
	   				con+="已完成";
	   			} 
	   			 else{}
	   			con += "</font></div></div></div></a>"; 
	    		});
	    		 $("#con").html(con);
	    	　　},
	    	　　error:function(){
	    	　　console.log('网络错误，通信失败');
	    	　　}
	    	　　});
	   
	    if(!first){
	      //do something
	     /*  alert("first"); */
	    }
	  }
	});
//监听提交
  form.on('submit(ss)', function(data){
	  var cateId=$('#cateId').val();
	  var status=$("#status").val();
	  var keyWord=$("#keyWord").val();
    /* layer.alert(cateId, {
      title: '最终的提交信息'
    }) */
    $.ajax({
  	　　url:'jsonProject-showProjectListByPage',
  	　　data:{
  	　　curr:1,
  	　　limit:5,
  	   cateId:cateId,
  	　　status:status,
  	   keyWord:keyWord
  	　　},
  	　　type:'post',
  	　　success:function(data){
  	/* 	alert(obj.curr);
  		alert(obj.limit); */
  	　　//向页面渲染后台传过来的数据
  		/* console.log(data); */
  		
          var projectList=data.data;
  		/* alert(projectList); */
  		var con="";
  		 $.each(projectList, function(index, item){
  			con += "<a class='proItemLefta' href='project-showDetail?proId="+item.proName+"' style='text-decoration: none;'>";
  			con += "<div class='proListItem'>";
  			con += "<div class='proItemLeft'>";
  			con += "<font style='font-size: 20px;'>"+item.proName+"</font>&nbsp;&nbsp;&nbsp; ";
  		    con += "<font style='font-size: 10px'>"+item.createTime+"发布</font> <br><br> ";
  			con += "<div class='proDesc'><font Style='font-size: 13px'>"+item.proDesc+"</font></div><br><br>";
  			con += "<font style='font-size: 20px;'>"+item.category.cateName+"</font></div>";
  			con += "<div class='proItemRigth'>"; 
  			con += "<div style='float: right;margin-right: 40px;'>"; 
  			con += "<font style='font-size: 25px; color: red;'>¥ "+item.projectFund+"元</font></div><div style='margin-top: 8px; float: right; clear: both;margin-right: 40px;'><font style='font-size: 25px; text-align: right;'>";  
			 if(item.status==1){
				con+="招标中";
			 } 
			 else if(item.status==2){
				con+="已选标";
			} 
			 else if(item.status==3){
				con+="进行中";
			} 
			 else if(item.status==4){
				con+="待验收";
			} 
			 else if(item.status==5){
				con+="已完成";
			} 
			 else{}
			con += "</font></div></div></div></a>"; 
  		});
  		 $("#con").html(con);
  	
  	//测试是否可行  	 
  		laypage.render({
  		  elem: 'demo4'
  		  ,count:data.count //数据总数，从服务端得到
  		  ,limit:5
  		  ,jump: function(obj, first){
  		    //obj包含了当前分页的所有参数，比如：
  		    console.log(obj.curr); //得到当前页，以便向服务端请求对应页的数据。
  		    console.log(obj.limit); //得到每页显示的条数
  		    var cateId=$('#cateId').val();
  		    var status=$("#status").val();
  		    var keyWord=$("#keyWord").val();
  		  /* alert(data.count); */
  		    $.ajax({
  		    	　　url:'jsonProject-showProjectListByPage',
  		    	　　data:{
  		    	　　curr:obj.curr,
  		    	　　limit:obj.limit,
  		    	   cateId:cateId,
  		    	　　 status:status,
  		    	   keyWord:keyWord
  		    	　　},
  		    	　　type:'post',
  		    	　　success:function(data){
  		    	/* 	alert(obj.curr);
  		    		alert(obj.limit); */
  		    	　　//向页面渲染后台传过来的数据
  		    		/* console.log(data); */
  		            var projectList=data.data;
  		    		/* alert(projectList); */
  		    		var con="";
  		    		 $.each(projectList, function(index, item){
  		    			con += "<a class='proItemLefta' href='project-showDetail?proId="+item.proId+"' style='text-decoration: none;'>";
  		    			con += "<div class='proListItem'>";
  		    			con += "<div class='proItemLeft'>";
  		    			con += "<font style='font-size: 20px;'>"+item.proName+"</font>&nbsp;&nbsp;&nbsp; ";
  		    		    con += "<font style='font-size: 10px'>"+item.createTime+"发布</font> <br><br> ";
  		    			con += "<div class='proDesc'><font Style='font-size: 13px'>"+item.proDesc+"</font></div><br><br>";
  		    			con += "<font style='font-size: 20px;'>"+item.category.cateName+"</font></div>";
  		    			con += "<div class='proItemRigth'>"; 
  		    			con += "<div style='float: right;margin-right: 40px;'>"; 
  		    			con += "<font style='font-size: 25px; color: red;'>¥ "+item.projectFund+"元</font></div><div style='margin-top: 8px; float: right; clear: both;margin-right: 40px;'><font style='font-size: 25px; text-align: right;'>";  
  		 			 if(item.status==1){
  		 				con+="招标中";
  		 			 } 
  		 			 else if(item.status==2){
  		 				con+="已选标";
  		 			} 
  		 			 else if(item.status==3){
  		 				con+="进行中";
  		 			} 
  		 			 else if(item.status==4){
  		 				con+="待验收";
  		 			} 
  		 			 else if(item.status==5){
  		 				con+="已完成";
  		 			} 
  		 			 else{}
  		 			con += "</font></div></div></div></a>"; 
  		    		});
  		    		 $("#con").html(con);
  		    	　　},
  		    	　　error:function(){
  		    	　　console.log('网络错误，通信失败');
  		    	　　}
  		    	　　});
  		   
  		    if(!first){
  		      //do something
  		     /*  alert("first"); */
  		    }
  		  }
  		});
  	　　},
  	　　error:function(){
  	　　console.log('网络错误，通信失败');
  	　　}
  	　　})
   return false;
  });
});
</script>
	<!-- 引入底部 -->
	<%@ include file="comm-foot.jsp"%>
</body>
</html>