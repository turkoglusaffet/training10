<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Spring Web Flow</title>
</head>
<body>
	<h3>Spring Web Flow STEP 1</h3>
	<sf:form action="${flowExecutionUrl}">
		<input id="next" name="_eventId_next" type="submit" value="To Step 2">
		<input id="cancel" name="_eventId_cancel" type="submit" value="Cancel">
	</sf:form>
</body>
</html>