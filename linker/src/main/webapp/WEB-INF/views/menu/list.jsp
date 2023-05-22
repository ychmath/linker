<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 목록</title>
<style>
#center {
	width: 700px;
	margin-left: auto;
	margin-right: auto;
}

table {
	border: 1px solid black;
	width: 700px;
	border-collapse: collapse;
}

th {border: 1px solid black;
	background-color: orange;
	width: 150px;
}
td{border: 1px solid black;}
a {
	margin: 10px auto;
}

#page {
	text-align: center;
}
</style>
</head>
<body>
	<div id="center">
		<h1>게시글 목록</h1>
		<div align="right">
			<a href="write">새 글 등록</a>
		</div>
		<c:if test="${ count != 0 }">
			<table>
				<tr>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
				</tr>
				<c:forEach items="${ menuList }" var="menu">
					<tr>
						<td><a href ="content/${ menu.menuID }">${ menu.title }</a></td>
						<td>${ menu.userID }</td>
						<td><fmt:formatDate value="${ menu.creationDate }" dateStyle="short"/></td>
					</tr>
				</c:forEach>
			</table>
			<div id="page">
				<c:if test="${ begin > pageNum }">
					<a href="list?p=${ begin-1 }">[이전]</a>
				</c:if>
				<c:forEach begin="${ begin }" end="${end}" var="i">
					<a href="list?p=${i}">${i}</a>
				</c:forEach>
				<c:if test="${end < totalPages }">
					<a href="list?p=${ end+1 }">[다음]</a>
				</c:if>
			</div>

		</c:if>
		<c:if test="${count == 0 }">
	아직 입력한 글이 없습니다.
</c:if>
	</div>
</body>
</html>