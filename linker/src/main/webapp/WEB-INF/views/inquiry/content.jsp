<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<title>글 상세보기</title>
<style>
table{
	border-collapse: collpase;
	width: 100%;
}
</style>
</head>
<body>
	<div id="container">
		<table border="1">
			<tr>
				<td>제목</td>
				<td>${dto.title }</td>
			</tr>
			<tr>
				<td>작성자</td>
				<td>${dto.userid }</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>${dto.content }</td>
			</tr>
			<tr>
				<td>작성일</td>
				<td><fmt:formatDate value="${dto.creationdate }" /></td>
			</tr>
			
			<tr>
				<td colspan="2" align="right">
				<c:if test="${user.userid == dto.userid }">
				<a href="/inquiry/update/${dto.inquirypostid }">수정</a>
				
				</c:if>
				</td>

			</tr>
	
	
	</table>
	
	
	</div>



</body>
</html>