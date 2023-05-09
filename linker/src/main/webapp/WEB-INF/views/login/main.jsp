<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<h3>${user.userid}님이 로그인하셨습니다.</h3>
	
	<a href="update">회원 정보 수정</a>
	<a href="delete">회원 탈퇴</a>
	<a href="logout">로그아웃</a>
	<a href="/notice/notice">공지사항</a>
	<a href="/inquiry/inquiry">문의사항</a>
	
</body>
</html>