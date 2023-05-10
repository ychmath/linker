<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<title>검색 글 목록</title>
</head>
<body>
	<div id="search">
		<h1>${search }로 검색한 결과입니다.</h1>
	</div>
	
	<c:if test="${count != 0 }">
		<tr>
			<th>게시글 번호</th>
			<th>제목</th>
			<th>작성자</th>
		</tr>
			
</body>
</html>