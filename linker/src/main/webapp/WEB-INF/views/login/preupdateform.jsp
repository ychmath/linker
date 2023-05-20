<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>현재 비밀번호 확인</title>
</head>
<body>
	<h3>현재 비밀번호를 입력해주세요</h3>
	<form action="/checkPassword" method="post">
		<label for="currentPassword">비밀번호</label> <input type="password"
			name="currentPassword" required> <input type="submit"
			value="확인">

		<%
		if (request.getAttribute("errorMessage") != null) {
		%>
		<p style="color: red;"><%=request.getAttribute("errorMessage")%>
			<%
			}
			%>
		
	</form>
</body>
</html>