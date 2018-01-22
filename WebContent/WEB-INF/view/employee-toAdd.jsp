<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script type="text/javascript" src="scripts/jquery-1.7.2.js">
	
</script>

<script type="text/javascript">
	$(function() {
		$("#lastName").change(function() {
			/*  alert("发送ajax请求"); */
			var val = $(this).val().trim();
            var $this=$(this);
			if (val != "") {
                $this.nextAll("font").remove();
				var url = "employee_verifyName?lastName=" + val;
				var args = {
					"time" : new Date()
				};
				$.post(url, args, function(data) {

					if (data == "1") {
						$this.after("<font color='red'>用户名不可用</font>");
						
					/* 	ts.val("用户名"); */
					} 
					else {
						$this.after("<font color='green'>用户名可用</font>");

					}
				})

			}

		})

	})
</script>












































<title>Insert title here</title>
</head>
<body>
	<h4>添加员工</h4>
	<s:form action="employee_add">
		<%-- <s:textfield label="id" name="id"></s:textfield> --%>
		<s:textfield label="lastname" name="lastName" id="lastName"></s:textfield>
		<label id="ts"></label>
		<s:textfield label="email" name="email"></s:textfield>
		<s:textfield label="birth" name="birth"></s:textfield>
		<%-- <s:textfield label="createTime" name="createTime"></s:textfield> --%>


		<%-- <s:textfield label="DepartmentName" name="departmentName"></s:textfield> --%>
		<s:select label="department" list="#request.departmentList"
			listKey="id" listValue="departmentName" name="department.id">
		</s:select>


		<s:submit name="submit"></s:submit>
	</s:form>

</body>
</html>