<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../css/admin/adminuser.css">

<title>회원 관리</title>

</head>
<body>
	<div class="title">
		<h1 align="center">회원 관리</h1>
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
							<td><fmt:formatDate value="${ user.signupdate }"
									dateStyle="short" /></td>
							<%-- a 태그의 id값을 userid 값으로 가져온다. --%>
							<td><a class="delete"
								href="/admin/user/delete/${ user.userid }" id=${ user.userid }>삭제</a></td>
						</tr>
					</c:forEach>
				</table>
				<div id="page" align="center">
					<c:if test="${ begin > pageNum }">
						<a href="user?p=${ begin - i }" style="text-decoration: none">이전</a>
					</c:if>
					<c:forEach begin="${ begin }" end="${ end }" var="i">
						<a href="user?p=${ i }" style="text-decoration: none">${ i }</a>
					</c:forEach>
					<c:if test="${ end < totalPages }">
						<a href="user?p=${ end + 1 }" style="text-decoration: none">[다음]</a>
					</c:if>
					<c:if test="${ userCount == 0 }">
						사용자가 존재하지 않습니다.
					</c:if>
				</div>
			</c:if>
		</div>
		<p align="center">
			<a href="/admin" style="text-decoration: none">관리자 페이지로 돌아가기</a>
		</p>
	</div>
	<!-- Footer Start -->
	<div class="container-fluid bg-dark text-light footer mt-0 pt-0">
		<div class="container">
			<div class="copyright">
				<div class="row">
					<div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
						&copy; <a class="border-bottom" href="#">Linker</a>, All Right
						Reserved.
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Footer End -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script>
		$(function() {
			$(".delete").click(function() {
				// 회원 id 가져오기
				var userid = $(this).attr("id");

				// ajax 데이터를 delete 전달
				$.ajax({
					url : "/admin/user/delete/" + userid,
					method : "delete",
					data : {
						"userid" : userid
					}
				}).done(function(result) {
					alert("사용자 삭제가 완료되었습니다.");
					location.replace(result);

				});
				return false;
			});
		});
	</script>
</body>
</html>