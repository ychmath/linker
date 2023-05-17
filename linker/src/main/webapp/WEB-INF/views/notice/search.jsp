<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<div id="center">
		<h1>${search }로 검색한 결과입니다.</h1>

		<div id="search">
			<form action="search"> <!-- 검색어를 입력하고 검색을 수행하는 부분 -->
				<select name="searchn"> <!-- select: 검색 조건을 선택하는 드롭다운 메뉴를 생성하는 부분 -->
					<option value="0">제목</option>
					<option value="1">작성자</option>
				</select>
					<input type="text" name="search" size="15" maxlength="50" />
					<input type="submit" value="검색" />
				</form>
			</div>
		</div>
		
		<c:if test="${count != 0 }">
			<table>
				<tr>
					<th>게시글 번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
				</tr>
			<c:forEach items="${nList }" var="notice">
				<tr>
					<td>${notice.noticepostid }</td>
					<td><a href="content/${notice.noticepostid }">${notice.title }</a></td>
					<td>${notice.userid }</td>
					<td><fmt:formatDate value="${notice.creationdate }" dateStyle="short" /></td>
				</tr>
			</c:forEach>
			</table>
			
			<div id="page"> 
				<c:if test="${begin > pageNum }">
					<a href="search?p=${begin-1 }&search=${search }&searchn=${searchn}">[이전]</a>
				</c:if>
				<c:forEach begin="${begin }" end="${end }" var="i">
					<a href="search?p=${end+1 }&search=${search}&searchn=${searchn}">${i }</a>
				</c:forEach>
				<c:if test="${end < totalPages }">
					<a href="search?p=${end+1 }&search=${search}&searchn=${searchn}">[다음]</a>
				</c:if>
	</div>
	</c:if>
	<c:if test="${count == 0 }">
	검색 조건에 맞는 글이 없습니다.
	</c:if>
	
	

</body>
</html>