<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Spring Web MCV</title>
</head>
<body>
	<h2>Edit User</h2>
	<form:form modelAttribute="user">
		<table>
			<tr>
				<td>ID</td>
				<td><form:input path="id" readonly="true" /></td>
				<td></td>
			</tr>
			<tr>
				<td>First Name</td>
				<td><form:input path="firstName" /></td>
				<td><form:errors path="firstName" /></td>
			</tr>
			<tr>
				<td>Last Name</td>
				<td><form:input path="lastName" /></td>
				<td><form:errors path="lastName" /></td>
			</tr>
			<tr>
				<td>E-Mail</td>
				<td><form:input path="email" /></td>
				<td><form:errors path="email" /></td>
			</tr>
		</table>
		<form:button>Edit</form:button>
	</form:form>
</body>
</html>