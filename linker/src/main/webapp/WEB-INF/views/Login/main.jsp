<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<title>Insert title here</title>
</head>
<body>
	<h3><a href="update"><i class="bi bi-person-fill"></i>${user.userid}</a>님이 로그인하셨습니다.</h3>
	
	<a href="/checkPassword">회원 정보 수정</a>
	<a href="delete">회원 탈퇴</a>
	<a href="logout">로그아웃</a>
	<a href="/notice/notice">공지사항</a>
	<a href="/inquiry/inquiry">문의사항</a>
	
</body>
</html>