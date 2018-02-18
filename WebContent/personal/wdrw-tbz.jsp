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
		<a href="wdrw-showTBZ2">dddd</a>
<table class="layui-table" lay-data="{url:'wdrw-showTBZ2', id:'idTest'}" lay-filter="demo">
  <thead>
    <tr>
      <th lay-data="{field:'project', width:100,templet:'<div>{{d.project.proName}}</div>'}">项目名称</th>
      <th lay-data="{field:'project', width:60,templet:'<div>{{d.project.publisher.userName}}</div>'}">发布人</th>
      <th lay-data="{field:'project', width:150,templet:'<div>{{d.project.proDesc}}</div>'}">项目描述</th>
      <th lay-data="{field:'bidTime', width:160}">投标时间</th>
      <th lay-data="{field:'bidReason', width:155, sort: true}">投标理由</th>
      <th lay-data="{field:'status', width:80, sort: true}">状态</th>
      <th lay-data="{fixed:'right',title: '操作', width:120, toolbar: '#barDemo'}"></th> -->
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
              url: "bid-logicDeleteBid",
              type: "POST",
              data:{"bidId":data.bidId},
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
      window.location.href = "project-toEditProject?proId="+data.proId; 
      
    }
  });
  
  
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