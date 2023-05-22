<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<title>공지사항</title>
<style>
#notice{
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

#inquiry{
	background-color: white;
}

th{
	border: 1px solid black;
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
	<div id="notice">
	<h1>공지사항</h1>
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
			<th>공지사항</th>
			<th id="inquiry" onclick="location.href='../inquiry/inquiry'">문의사항</th>
		</tr>
	</table>
	
	<table>
		<tr>
			<th>게시글 번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
		</tr>	
		<c:forEach items="${nList }" var="notice">
		<!-- "items" 속성에는 반복할 컬렉션 또는 배열을 지정함
			"var" 속성에는 현재 반복 항목을 참조할 변수명을 지정함 
			"${nList}: 모덜에 저장된 nList라는 속성을 참조함. nList는 반복할 컬렉션이나 배열을 의미함
			notice라는 변수로 참조하여 사용할 수 있는 반복문을 나타냄
		 -->
		
			<tr>
				<td>${notice.noticepostid}</td>
				<td><a href="content/${notice.noticepostid}">${notice.title }</a></td>
				<td>${notice.userid }</td>
				<td><fmt:formatDate value="${notice.creationdate }" dateStyle="short"/></td>
			</tr>
		</c:forEach>
	</table>
	<div id="page">
		<c:if test="${begin > pageNum}">
			<a href="notice?p=${begin-1 }">[이전]</a>
			<!-- '?'는 URL에서 쿼리 문자열을 나타내는 부분의 시작을 표시하는 데 사용되는 특수 문자 -->
		</c:if>
		<c:forEach begin="${begin }" end="${end }" var="i">
			<a href="notice?p=${i }">${i }</a>
		</c:forEach>
		<c:if test="${end < totalPages }">
			<a href="notice?p=${end+1 }">[다음]</a>
		</c:if>
	</div>
	<c:if test="${count == 0 }">
	아직 입력한 글이 없습니다.
	</c:if>
	
	
	
	
	
	<div id="write">
		<a href="write">글쓰기</a>
	</div>
		
</body>
</html>