<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../css/user/notice.css">
<title>공지사항</title>

</head>
<body>
	<div id="notice">
		<h1 align="center">공지사항</h1>
	</div>

	<div id="search" class="table-spacing ">
		<form action="search">
			<select name="searchn" id="searchn">
				<option value="0">제목</option>
				<option value="1">작성자</option>
			</select> <input type="text" id="search_text" name="search" size="15"
				maxlength="40" /> <input type="submit" id="search_btn"
				name="search_btn" value="검색" />
		</form>
	</div>

	<table class="table-spacing table-center">

		<tr>
			<th class="custom-button" onclick="location.href='../notice/notice'">공지사항</th>
			<th id="inquiry" class="custom-button" onclick="location.href='../inquiry/inquiry'">
				문의사항</th>
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
    <!-- 이 태그는 "forEach" 루프를 사용하여 nList에 있는 아이템들을 반복합니다
    "items" 속성에는 반복할 컬렉션 또는 배열을 지정합니다. 여기서는 "${nList}"를 지정했습니다.
    "var" 속성에는 현재 반복 항목을 참조할 변수명을 지정합니다. 여기서는 "notice"를 사용합니다.
    "${nList}"는 모델에 저장된 nList 속성을 참조합니다. nList는 반복할 컬렉션이나 배열을 의미합니다.
    "notice" 변수로 참조합니다. 이는 반복문 내에서 사용할 수 있는 변수입니다.
     -->

    <tr>
        <td>${notice.noticepostid}</td>
        <!-- 'noticepostid'를 가져와서 테이블의 첫 번째 셀에 표시합니다. -->
        <td><a href="content/${notice.noticepostid}">${notice.title }</a></td>
        <!-- 제목을 가져와서 하이퍼링크로 표시하고, 클릭 시 content/noticepostid 페이지로 연결합니다. -->
        <td>${notice.userid }</td>
        <!-- 사용자 ID를 가져와서 테이블의 세 번째 셀에 표시합니다. -->
        <td><fmt:formatDate value="${notice.creationdate }"
                dateStyle="short" /></td>
        <!-- 'creationdate'를 가져와서 "short" 형식으로 날짜를 표시하는 태그입니다. -->
    </tr>
</c:forEach>

	</table>
	<div class="center-align" id="page " align="center">
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
	<c:if test="${count == 0 }"> 아직 입력한 글이 없습니다. </c:if>

	<div id="write">
		<input type="button" id="write" value="글쓰기"
			onclick="location.href='write'" />
	</div>
</body>
</html>
