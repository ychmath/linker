<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리</title>
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
	<div class="title">
		<h1>회원 관리</h1>
	</div>
	<div class="content">
		<div id="userTable">
			<c:if test="${ userCount != 0 }">
				<table>
					<tr>
						<th>사용자명</th>
						<th>아이디</th>
						<th>이메일</th>
						<th>전화번호</th>
						<th>권한</th>
						<th>가입일자</th>
						<th><a>회원정보 삭제</a></th>
					</tr>
					<c:forEach items="${ userList }" var="user">
						<tr>
							<td>${ user.name }</td>
							<td>${ user.userid }</td>
							<td>${ user.email }</td>
							<td>${ user.phone }</td>
							<td>${ user.role }</td>
							<td><fmt:formatDate value="${ user.signupdate }" dateStyle="short"/></td>
							<%-- a 태그의 id값을 userid 값으로 가져온다. --%>
							<td><a class="delete" href="/admin/user/delete/${ user.userid }" id=${ user.userid } >삭제</a></td>
						</tr>
					</c:forEach>
				</table>
				<div id="page">
					<c:if test="${ begin > pageNum }">
						<a href="user?p=${ begin - i }">이전</a>
					</c:if>
					<c:forEach begin="${ begin }" end="${ end }" var="i">
						<a href="user?p=${ i }">${ i }</a>
					</c:forEach>
					<c:if test="${ end < totalPages }">
						<a href="user?p=${ end + 1 }">[다음]</a>
					</c:if>
					<c:if test="${ userCount == 0 }">
						사용자가 존재하지 않습니다.
					</c:if>
				</div>
			</c:if>
		</div>
		<a href="/admin">관리자 페이지로 돌아가기</a>
	</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	$(function(){
		$(".delete").click(function(){
			// 회원 id 가져오기
			var userid = $(this).attr("id");
			
			$.ajax({
				url: "/admin/user/delete/" + userid,
				method: "delete",
				data:{"userid":userid}
			}).done(function(result){
				
				alert("사용자 삭제가 완료되었습니다.");
				location.replace(result);
				
			});
			return false;
		});
	});
</script>
</body>
</html>