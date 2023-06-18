<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>승인 대기 목록</title>
<link rel="stylesheet" type="text/css" href="../css/admin/adminuser.css">
</head>
<body>
	<div class="title" align="center">
		<h1>승인 대기중인 사용자입니다.</h1>
	</div>
	<div class="main">
		<div id="content">
			<form id="tempList" method="post">
				<input type="hidden" name="_method" value="put" /> <input
					type="text" id="userid" name="userid" style="display: none;" />
				<table>
					<tr>
						<th>사용자명</th>
						<th>아이디</th>
						<th>전화번호</th>
						<th>이메일</th>
						<th>가입일자</th>
						<th></th>
					</tr>
					<c:forEach items="${ tempList }" var="temp">
						<tr>
							<td>${ temp.name }</td>
							<td>${ temp.userid }</td>
							<td>${ temp.phone }</td>
							<td>${ temp.email }</td>
							<td><fmt:formatDate value="${ temp.signupdate }"
									dateStyle="short"></fmt:formatDate></td>
							<td><button type="button" class="approve"
									id="${ temp.userid }">승인</button></td>
						</tr>
					</c:forEach>
				</table>
			</form>
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
			$(".approve").on("click", function() {
				// id값으로 각각의 userid를 저장하고, 다시 변수로 가져온다.
				var userid = $(this).attr("id");

				// id가 tempList인 form의 action을 지정한다.
				$("#tempList").attr("action", "/admin/user/approve/" + userid);

				// 전달할 input 태그의 value값을 가져온 userid로 지정한다.
				$("input[name=userid]").attr("value", userid);

				// 사용자 승인 여부를 alert 창으로 확인
				if (confirm("해당 사용자를 승인하시겠습니까?") == true) {
					alert("사용자 승인이 완료되었습니다.");

					$("#tempList").submit();

				} else {
					alert("사용자 승인이 취소되었습니다.");
				}
			}); // approve click end

		}); // ready end
	</script>
</body>
</html>