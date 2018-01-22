<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<script type="text/javascript" src="scripts/jquery-1.7.2.js" ></script>

<script type="text/javascript">
$(function() {
	//点击删除时弹出确定要删除XX的询问框
	$(".delete").click(function() {
		var employeeName=$(this).next(":hidden").val();
		var tr=$(this).parent().parent();
		var flag=confirm("确定要删除"+employeeName+"的信息吗？");
		if(flag){
			var url=this.href;
			var args={"time":new Date()}
			$.post(url,args,function(data){
				if(data == "1"){
					alert("删除成功！");
					tr.remove();
					}
				});
		}
		return false;//取消超链接的行为
	});
})
</script>

<%-- 

<script type="text/javascript">
	
	$(function(){
		//1. 点击 delete 时, 弹出 确定是要删除 xx 的信息吗 ? 若确定, 执行删除, 若不确定, 则取消
		$(".delete").click(function(){
			var lastName = $(this).next(":hidden").val();
			var flag = confirm("确定要删除" + lastName + "的信息吗?");
			if(flag){
				var $tr = $(this).parent().parent();
				//删除, 使用 ajax 的方式
				var url = this.href;
				var args = {"time":new Date()};
				$.post(url, args, function(data){
					//若 data 的返回值为 1, 则提示 删除成功, 且把当前行删除
					if(data == "1"){
						alert("删除成功!");
						$tr.remove();
					}else{
						//若 data 的返回值不是 1, 提示删除失败. 
						alert("删除失败!");
					}
				});	
			}
			
			//取消超链接的默认行为
			return false;
		});		
	})
	
</script>
		 --%>

<title>Insert title here</title>
</head>
<body>

	<table>
		<tr>
			<td>id</td>
			<td>lastname</td>
			<td>email</td>
			<td>birth</td>
			<td>createtime</td>
			<td>dept</td>
			<td>delete</td>
			<td>edit</td>
		</tr>


		<s:iterator value="#request.employeeList">
			<tr>
				<td>${id}</td>
				<td>${lastName}</td>
				<td>${email}</td>
				<%-- <td>${birth}</td> --%>
				<td>
				<s:date name="birth" format="yyyy-MM-dd"/>
				</td>
				<td>${createTime}</td>
				<td>${department.departmentName}</td>
				<td><a href="employee_delete?id=${id}" class="delete">删除</a> <input
					type="hidden" value="${lastName}" /></td>
				<td><a href="employee_toEdit?id=${id}">${id}编辑</a></td>
			</tr>

		</s:iterator>

	</table>
	
	<a href="index">回首页</a>

</body>
</html>