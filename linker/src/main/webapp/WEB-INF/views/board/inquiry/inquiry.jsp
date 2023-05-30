<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<title>문의사항</title>
<link rel="stylesheet" type="text/css" href="../css/user/inquiry.css">
</head>
<body>
	<div id="inquiry">
		<h1 align="center">문의사항</h1>
	</div>

	<div id="search" class="table-spacing ">
		<form action="search" >
			<select name="searchn" id="searchn">
				<option value="0">제목</option>
				<option value="1">작성자</option>
			</select>
		<input type="text" id="search_text" name="search" size="15"
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
<c:if test="${count > 0 }">
    <!-- count 값이 0보다 클 경우에만 아래 내용이 실행됩니다. -->

    <c:forEach items="${iList }" var="inquiry">
    <!-- forEach 루프를 사용하여 iList에 있는 아이템들을 반복합니다. -->

        <tr>
            <td>
                <c:out value="${start}" />
                <!-- 'start' 변수 값을 현재 셀에 출력하기 위한 태그입니다. -->

                <c:set var="start" value="${start+1 }" />
                <!-- 'start' 변수 값을 1 증가시키기 위한 태그입니다. -->
            </td>

            <td><a href="content/${inquiry.inquirypostid }">
                    <c:if test="${inquiry.relevel > 0 }">
                    <!-- 답변글이 있는 경우(relevel 값이 0보다 클 경우), 다음 내용을 실행합니다. -->

                        <span class="icon">
                        <img src="/img/level.gif" width="${inquiry.relevel * 10 }">
                        <!-- relevel 값에 10을 곱한 결과에 따라 이미지의 너비를 조절합니다. -->

                        <img src="/img/re.gif" alt="답변" />
                        <!-- alt 속성은 이미지가 표시되지 못할 경우 이미지 대신 사용할 대체 텍스트를 정의합니다. -->
                        </span>
                    </c:if>
                    ${inquiry.title }
                    <c:if test="${inquiry.readcount >= 20 }">
                    <!-- 조회수(readcount)가 20 이상인 경우 다음 내용을 실행합니다. -->

                        <span class="icon">
                        <img src="/img/hot.gif" alt="인기글" />
                        <!-- 인기글을 나타내는 'hot' 이미지를 표시합니다. -->
                        </span>
                    </c:if>
                </a>
            </td>

            <!-- 글 작성자의 ID를 출력합니다. -->
            <td>${inquiry.userid }</td>

            <!-- 글 생성일을 출력합니다. -->
            <td><fmt:formatDate value="${inquiry.creationdate }" /></td>
        </tr>

    </c:forEach>
</table>
</c:if>

	<div class="center-align" id="page " align="center"><!-- 페이지 번호 -->
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

	<div id="write" class="write_ty">
		<input type="button" id="write" value="글쓰기"
			onclick="location.href='write'" />
	</div>

</body>
</html>