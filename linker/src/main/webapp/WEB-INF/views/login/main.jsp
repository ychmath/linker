<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<title>Insert title here</title>
</head>
<body>
	<h3><a href="update"><i class="bi bi-person-fill"></i>${ user.userid }</a>님이 로그인하셨습니다.</h3>
	
	<a href="/checkPassword">회원 정보 수정</a>
	<a href="delete">회원 탈퇴</a>
	<a href="logout">로그아웃</a>
	<a href="/notice/notice">공지사항</a>
	<a href="/inquiry/inquiry">문의사항</a>
	
	<a href="/menu/list">식단표</a>
	
	<!-- 권한 따라 출력할 메뉴들 -->
	<hr>
	<p>권한 입력 테스트</p>
	<c:if test="${ user.role == 'seller' }">
		<a href="/ingredient/main">식자재 관리</a>
		<a href="/profitChart">재무 관리 차트</a>
	</c:if>
	<c:if test="${ user.role == 'admin' }">
		<a href="/admin">관리자 페이지</a>
	</c:if>
</body>
</html>