<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Spring MVC</title>
<style type="text/css">
	.alert {
		padding: 5px;
	}
	.alert-error {
		color: red;
		font-weight: bold;
	}
	.alert-success {
		color: green;
		font-weight: bold;
	}
</style>
</head>
<body>
	<form action="${loginUrl}" method="post" style="width:400px; margin: auto">
		<fieldset>
			<legend><h4>Please Login</h4></legend>
			<c:if test="${param.error != null}">
				<div class="alert alert-error">Invalid username and password.</div>
			</c:if>
			<c:if test="${param.logout != null}">
				<div class="alert alert-success">You have been logged out.</div>
			</c:if>
			<table>
				<tr>
					<td>
						<b><label for="username">Username</label></b>
					</td>
					<td>
						<input type="text" id="username" name="username" /> 
					</td>
				</tr>
				<tr>	
					<td>
						<b><label for="password">Password</label></b>
					</td>
					<td>
						<input type="password" id="password" name="password" />
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<center>
							<button type="submit" class="btn">Log in</button>
						</center>
					</td>
				</tr>
			</table>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		</fieldset>
	</form>
</body>
</html>