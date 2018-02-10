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

<title>Navbar组件</title>
</head>

<body>
		

	<div class="person">

		<div class="person-xdh">
			<a><font>我的发布</font></a> > <font>待审核</font>
			
			<a href="wdfb-showZBZ">ceshi</a>
		</div>
		<div class="content">
<table class="layui-table" lay-data="{url:'wdfb-showDSH', id:'idTest'}" lay-filter="demo">
  <thead>
    <tr>
     <!--  <th lay-data="{type:'checkbox', fixed: 'left'}"></th> -->
    
    <!--   <th lay-data="{field:'proId', width:80}">项目名称</th> -->
      <th lay-data="{field:'proName', width:180}">项目名称</th>
      <th lay-data="{field:'proDesc', width:180, sort: true}">项目描述</th>
      <th lay-data="{field:'createTime', width:100}">创建时间</th>
<!--       <th lay-data="{field:'category', width:160}">项目分类</th> 
 -->     
    <!--   <th lay-data="{field:'projectFund', width:80, sort: true}">项目资金</th> -->
     <!--  <th lay-data="{field:'preDeliveryTime', width:80, sort: true}">预定交付时间</th>
      
      <th lay-data="{field:'deleteFlag', width:80}">招标书文件</th> -->
<!--       <th lay-data="{field:'publisher', width:80}">招标书文件</th>
      <th lay-data="{field:'servicer', width:80}">招标书文件</th> -->
   <!--    <th lay-data="{field:'rfp', width:80}">招标书文件</th> -->
      <th lay-data="{field:'guaranteeStatus', width:80}">担保状态</th>
      <th lay-data="{field:'status', width:135, sort: true}">状态</th>
<!--       <th lay-data="{field:'endTime', width:135, sort: true}">状态</th> -->
      <th lay-data="{field:'compensationRate', width:100, sort: true}">赔率</th>
      <th lay-data="{fixed:'right',title: '操作', width:120, toolbar: '#barDemo'}"></th>
      
    </tr>
  </thead>
</table>

 
<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
  <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
               
          

<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
layui.use('table', function(){
  var table = layui.table;
  var $ = layui.jquery;
  //监听表格复选框选择
  table.on('checkbox(demo)', function(obj){
    console.log(obj)
  });
  
  
  //监听工具条
  table.on('tool(demo)', function(obj){
    var data = obj.data;
    if(obj.event === 'detail'){
      layer.msg('ID：'+ data.proId + ' 的查看操作');
    } else if(obj.event === 'del'){
      layer.confirm('真的删除行么', function(index){
       /*  obj.del();
        layer.close(index); */
        
    	  console.log(data);
          $.ajax({
              url: "project-logicDelProject",
              type: "POST",
              data:{"proId":data.proId},
              dataType: "json",
              success: function(data){

                  if(data==1){
                     //删除这一行
                      obj.del();
                     //关闭弹框
                      layer.close(index);
                      layer.msg("删除成功", {icon: 6});
                  }else{
                      layer.msg("删除失败", {icon: 5});
                  }
              }
          });
      });
    } else if(obj.event === 'edit'){
      layer.alert('编辑行：<br>'+ data.proId);
      window.location.href = "project-toEditProject?proId="+data.proId; 
     /*  
       $.get("user-toLogin", { "proId": data.proId}, function (data) {
    	   
    	   window.location.href = "data";
    	   
 })
       */
      
      
    }
  });
  
 /*  var $ = layui.$, active = {
    getCheckData: function(){ //获取选中数据
      var checkStatus = table.checkStatus('idTest')
      ,data = checkStatus.data;
      layer.alert(JSON.stringify(data));
    }
    ,getCheckLength: function(){ //获取选中数目
      var checkStatus = table.checkStatus('idTest')
      ,data = checkStatus.data;
      layer.msg('选中了：'+ data.length + ' 个');
    }
    ,isAll: function(){ //验证是否全选
      var checkStatus = table.checkStatus('idTest');
      layer.msg(checkStatus.isAll ? '全选': '未全选')
    }
  }; */
  
  $('.demoTable .layui-btn').on('click', function(){
    var type = $(this).data('type');
    active[type] ? active[type].call(this) : '';
  });
});
</script>
		
		
		
		
		
		
		
		
		
		
		
		
		</div>

	</div>
</body>

</html>