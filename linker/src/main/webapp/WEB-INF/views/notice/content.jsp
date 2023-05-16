<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--JSP 페이지에서 JSTL(Core Tag Library)을 사용하기 위해 선언하는 태그 라이브러리 
	이 선언을 통해 JSTL Core 태그 라이브러리에 정의된 태그들을 사용할 수 있음
-->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
<head>
<title>글 상세보기</title>
<style>
table{
	width: 100%;
}
</style>
</head>
<body>

<div id="container">
<table border="1">

	<tr>
		<td>제목</td><td>${dto.title }</td>
	</tr>
	<tr>
		<td>작성자</td><td>${dto.userid }</td>
	</tr>
	<tr>
		<td>내용</td><td>${dto.content }</td>
	</tr>
	<tr>
		<td>작성일</td><td><fmt:formatDate value="${dto.creationdate }"/></td>
	</tr>
	
	<tr>
		<td colspan="2" align="right">
		<c:if test="${user.userid == dto.userid }">
			<!-- test속성은 조건식을 정의하는 부분
				이 속성은 해당 조건식을 평가하여 참 또는 거짓을 결정
			 -->
			<a href="/notice/update/${dto.noticepostid}">수정</a>
			<a id="${dto.noticepostid}" href="#">삭제</a>
			<!-- <a>: 링크를 생성하며, 클릭하면 해당에 맞게 동작을 수행함
				href: 링크의 목적지를 나타냄
				href="#": 현재 페이지의 상단으로 이동하는 빈 링크를 나타냄
				=> 이 링크는 클릭하면 현재 페이지의 위치를 유지한 채로 페이지의 맨 위로 스크롤 됨 
			 -->
		</c:if>
		
		<a href="../notice">목록 이동</a>
		</td>
	</tr>
		


</table>

</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(function(){
		$("a[id]").click(function(){ // a[id]: a 태그 중에서 'id' 속성을 가진 모든 요소들을 선택하는 것을 의미
			let no = $(this).attr("id"); //삭제하려는 글번호. attr(): 선택된 요소의 속성 값을 가져오거나 설정하는 메소드
			$.ajax({url: "/notice/delete",
					data: "noticepostid=" + no,
					method: "delete"
			}).done(function(){
				location.href="/notice/notice";
			})
			return false; //하이퍼링크 이동 x
		}) //click
	})


</script>


</body>
</html>