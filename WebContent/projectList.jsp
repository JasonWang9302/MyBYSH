<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="resource/css/projectList.css" rel="stylesheet"
	type="text/css" />

<title>Insert title here</title>
</head>
<body>
	<!-- 引入导航 -->
	<%@ include file="comm-nav.jsp"%>


	<!-- 	内容区 开始 -->

	<%-- <s:iterator value="#request.projectList" >

	<!-- 循环 -->
	<a class="proItemLefta" href="project-showDetail?proId=${proId}" style="text-decoration: none;">
		<div class="proListItem">
			<div class="proItemLeft">
				<font style="font-size: 20px;">${proName}</font>&nbsp;&nbsp;&nbsp; <font
					style="font-size: 10px">${createTime} 发布</font> <br>
				<br> 
			<div class="proDesc"><font Style="font-size: 13px">${proDesc} </font> </div>	
				<br>
				<br> <font style="font-size: 20px;">${category.cateName}</font>
			</div>
			<div class="proItemRigth">
				<font style="font-size: 25px; color: red;">¥ ${projectFund} 元</font> <font
					style="font-size: 30px; text-align: right;">已完成</font>
			</div>
		</div>
		
		
	</a>
</s:iterator>
 --%>
	<!-- 分页 -->
	<!-- <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
  <legend>不显示首页尾页</legend>
</fieldset> -->
	<div id="con"></div>
	<div id="demo4" style="width: 1000px; margin: 0 auto;"></div>

	<script>
	/* 总条数 */
	var count1="${requestScope.count}";
layui.use(['laypage', 'layer'], function(){
  var laypage = layui.laypage,layer = layui.layer,$ = layui.jquery;
  
  $.ajax({
	　　url:'jsonProject-showProjectListByPage',
	　　data:{
	　　curr:1,
	　　limit:5
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
			con += "<font style='font-size: 20px;'>"+item.proId+"</font>&nbsp;&nbsp;&nbsp; ";
		    con += "<font style='font-size: 10px'>"+item.createTime+"发布</font> <br><br> ";
			con += "<div class='proDesc'><font Style='font-size: 13px'>"+item.proDesc+"</font></div><br><br>";
			con += "<font style='font-size: 20px;'>"+item.category.cateName+"</font></div>";
			con += "<div class='proItemRigth'>"; 
			con += "<font style='font-size: 25px; color: red;'>¥ "+item.projectFund+"元</font><font style='font-size: 30px; text-align: right;'>已完成</font>";  
			con += "</div></div></a>"; 
		});
		 $("#con").html(con);
		
	　　},
	　　error:function(){
	　　console.log('网络错误，通信失败');
	　　}
	　　})
  
  
 
//不显示首页尾页
  laypage.render({
	  elem: 'demo4'
	  ,count:count1  //数据总数，从服务端得到
	  ,limit:5
	  ,jump: function(obj, first){
	    //obj包含了当前分页的所有参数，比如：
	    console.log(obj.curr); //得到当前页，以便向服务端请求对应页的数据。
	    console.log(obj.limit); //得到每页显示的条数
	    $.ajax({
	    	　　url:'jsonProject-showProjectListByPage',
	    	　　data:{
	    	　　curr:obj.curr,
	    	　　limit:obj.limit
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
	    			con += "<font style='font-size: 20px;'>"+item.proId+"</font>&nbsp;&nbsp;&nbsp; ";
	    		    con += "<font style='font-size: 10px'>"+item.createTime+"发布</font> <br><br> ";
	    			con += "<div class='proDesc'><font Style='font-size: 13px'>"+item.proDesc+"</font></div><br><br>";
	    			con += "<font style='font-size: 20px;'>"+item.category.cateName+"</font></div>";
	    			con += "<div class='proItemRigth'>"; 
	    			con += "<font style='font-size: 25px; color: red;'>¥ "+item.projectFund+"元</font><font style='font-size: 30px; text-align: right;'>已完成</font>";  
	    			con += "</div></div></a>"; 
	    		});
	    		 $("#con").html(con);
	    	　　},
	    	　　error:function(){
	    	　　console.log('网络错误，通信失败');
	    	　　}
	    	　　})
	    //首次不执行
	    if(!first){
	      //do something
	     /*  alert("first"); */
	    }
	  }
	});
});
</script>
	<!-- jump:function(obj,first){ //当我点击跳转页面时会执行另一个ajax
　　console.log(obj.curr) //当前页数
　　console.log(obj.limit) //每页显示条数
　　$.ajax({
　　url:'../diyfenye',
　　data:{
　　curr:obj.curr,
　　limit:obj.limit
　　},
　　type:'post',
　　success:function(data){
　　//向页面渲染后台传过来的数据
　　},
　　error:function(){
　　console.log('网络错误，通信失败');
　　}
　　}) -->
	<!-- 	内容区 结束 -->

	<!-- 引入底部 -->
	<%@ include file="comm-foot.jsp"%>

</body>
</html>