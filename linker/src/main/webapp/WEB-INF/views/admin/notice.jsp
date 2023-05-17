<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 목록</title>
<style>
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
</style>
</head>
<body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>

</script>
	<div class="title">
		<h1>공지사항 관리</h1>
	</div>
	<div class="content">
		<div id="noticeTable">
			<c:if test="${ noticeCount != 0 }">
				<table>
					<tr>
						<th>글쓴이</th>
						<th>제목</th>
						<th>작성일자</th>
					</tr>
					<c:forEach items="${ noticeList }" var="notice">
						<tr>
							<td>${ notice.userid }</td>
							<td><a href="noticeContent/${ notice.noticepostid }">${ notice.title }</a></td>
							<td><fmt:formatDate value="${ notice.creationdate }" dateStyle="short"/></td>
						</tr>
					</c:forEach>
				</table>
				<div id="page">
					<c:if test="${ begin > pageNum }">
						<a href="notice?p=${ begin - i }">이전</a>
					</c:if>
					<c:forEach begin="${ begin }" end="${ end }" var="i">
						<a href="notice?p=${ i }">${ i }</a>
					</c:forEach>
					<c:if test="${ end < totalPages }">
						<a href="notice?p=${ end + 1 }">[다음]</a>
					</c:if>
					<c:if test="${ noticeCount == 0 }">
						게시물이 존재하지 않습니다.
					</c:if>
				</div>
			</c:if>
		</div>
		<a href="/admin">목록으로 돌아가기</a>
	</div>
</body>
</html>