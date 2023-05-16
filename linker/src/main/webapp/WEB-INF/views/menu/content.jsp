<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 상세보기</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.5/css/bootstrap.min.css">
</head>
<body>
<table border="1">
	<tr><td>제목</td><td>${dto.title}</td>
	<tr><td>작성자</td><td>${dto.userID}</td>
	<tr><td>내용</td><td>${ dto.content }</td>
	<tr><td>등록일</td><td><fmt:formatDate value="${dto.creationDate}" dateStyle="long"/></td>
	<tr><td colspan="2" align="right">
	<a href="/menu/update/${ dto.menuID }">글 수정</a>
	<a id="delete" href="/menu/delete/${dto.menuID}">글 삭제</a>
	<a href="../list">목록 이동</a> 
	</td></tr>
</table>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(function(){
		$("#delete").click(function(){
			var menuID = ${ dto.menuID };
			
			$.ajax({
				url: "/menu/delete/" + ${ dto.menuID },
				method: "delete",
				data:{menuID:menuID}
			}).done(function(result){
				alert("삭제가 완료되었습니다.");
				location.replace(result);
			});
			return false;
		});
			
	});
</script>
</body>
</html>