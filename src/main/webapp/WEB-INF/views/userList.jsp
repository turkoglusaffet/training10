<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Spring Web MCV</title>
</head>
<body>
	<h2><spring:message code="page.list" /></h2>
	<table>
		<tr>
			<th><spring:message code="user.id" /> </th>
			<th><spring:message code="user.fname" /></th>
			<th><spring:message code="user.lname" /></th>
			<th><spring:message code="user.email" /></th>
			<th>#</th>
		</tr>
		<c:forEach items="${users}" var="user">
			<tr>
				<td>${user.id}</td>
				<td>${user.firstName}</td>
				<td>${user.lastName}</td>
				<td>${user.email}</td>
				<td>
					<a href="edit-user-${user.id}.html">Edit</a>
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>