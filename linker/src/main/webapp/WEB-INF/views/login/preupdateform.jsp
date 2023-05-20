<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>현재 비밀번호 확인</title>
</head>
<body>
	<h1>현재 비밀번호 확인</h1>
	<form action="/check-current-password" method="post">
		<label for="userid">User ID:</label> <input type="text" name="userid" required>
		<br> <label for="password">현재 비밀번호:</label> <input
			type="password" name="password" required> <br> <input
			type="submit" value="확인">
	</form>
	<c:if test="${not empty errorMessage}">
		<div style="color: red;">${errorMessage}</div>
	</c:if>
</body>
</html>