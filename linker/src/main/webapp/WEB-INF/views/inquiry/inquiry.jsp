<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<title>문의사항</title>
<style>
#inquiry{
	margin-left: auto;
	margin-right: auto;
	width: 700px;
}

#search{
	margin-left: 680px;
}

table{
	border: 1px solid black;
	width: 700px;
	border-collapse: collapse;
	margin-left: auto;
	margin-right: auto;
}

#notice{
	background-color: white;
}

th{
	border: 1px solid black;
	margin-left: auto;
	margin-right: auto;
	background-color: gray;
}

a{
	margin-left: 10px auto;
}

td{
	border: 1px solid black;
}

#page{
	text-align: center;
}

#write{
	margin-left: 860px;
}


</style>


</head>
<body>
	<div id="inquiry">
		<h1>문의사항</h1>
	</div>

	<div id="search">
		<form action="search">
			<select name="searchn">
				<option value="0">제목</option>
				<option value="1">작성자</option>
			</select>
			<input type="text" name="search" size="15" maxlength="40" />
			<input type="submit" value="검색" />
		</form>
	</div>
	

	<table>
		<tr>
			<th id="notice">공지사항</th>
			<th>문의사항</th>
		</tr>
	</table>


	<table>
		<tr>
			<th>게시글 번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
		</tr>
	
	
	<c:if test="${count > 0 }">
		<c:forEach items="${iList }" var="inquiry">
		<tr>
			<td>
				<c:out value="${start}" />
				<!-- jsp 페이지 상에서 출력할 변수 값을 표시해주는 역할 -->
				<c:set var="start" value="${start+1 }" />
				<!-- 변수에 값을 할당할 때 사용하는 태그 -->
			</td>
					
			<td><a href="content/${inquiry.inquirypostid }">
					<c:if test="${inquiry.relevel > 0 }">
					<!-- 답변글이있으면 -->
					<span class="icon">
					<img src="/img/level.gif" width="${inquiry.relevel * 10 }">
					<img src="/img/re.gif" alt="답변" />
					<!-- alt: 이미지가 표시되지 못한 경우에 이미지 대신 사용할 대체 텍스트를 정의하는 속성 -->
					</span>
					</c:if>
					${inquiry.title }
					<c:if test="${inquiry.readcount >= 20 }">
					<span class="icon">
					<img src="/img/hot.gif" alt="인기글" />
					</span>
					</c:if>
				</a>
			</td>
			<td>${inquiry.userid }</td>
			<td><fmt:formatDate value="${inquiry.creationdate }" /></td>
		</tr>
		</c:forEach>
	</table>
	</c:if>
	
	<div id="page"><!-- 페이지 번호 -->
		<c:if test="${begin > pageNum}">
			<a href="inquiry?p=${begin - 1 }">[이전]
		</c:if>	
		<c:forEach begin="${begin }" end="${end }" var="i">
			<a href="inquiry?p=${i }">${i }</a>
		</c:forEach>
		<c:if test="${end < totalPages }">
			<a href="inquiry?p=${end+1}">[다음]</a>
		</c:if>
			</div>

	
	
	
	
	<div id="write">
		<a href="write">글쓰기</a>
	</div>

</body>
</html>