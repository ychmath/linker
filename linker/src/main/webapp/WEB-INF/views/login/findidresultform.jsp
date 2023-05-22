<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 결과</title>
</head>
<body>
	<h1>아이디 찾기 결과</h1>
	<c:choose>
		<c:when test="${not empty userid}">
			<p>찾으신 아이디: ${userid}</p>
		</c:when>
		<c:otherwise>
			<p>입력하신 정보로 가입된 아이디가 없습니다.</p>
		</c:otherwise>
	</c:choose>
	<a href="/loginform">로그인 페이지로 이동</a>
</body>
</html>