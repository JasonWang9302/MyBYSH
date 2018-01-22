<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<h4>修改员工信息</h4>
<s:debug>debug</s:debug>
<s:form action="employee_edit">
<s:hidden label="id" name="id"></s:hidden>
<s:textfield label="lastName" name="lastName" disabled="true"></s:textfield>
<s:hidden label="lastName" name="lastName"></s:hidden>
<s:textfield label="email" name="email"></s:textfield>
<s:textfield label="birth" name="birth"></s:textfield>
<s:hidden label="createTime" name="createTime"></s:hidden>
<%-- <s:textfield label="department" name="department.departmentName"></s:textfield> --%>
<s:select list="#request.departmentList" listKey="id" listValue="departmentName" name="department.id"></s:select>
<s:submit value="submit"></s:submit>
</s:form>

</body>
</html>