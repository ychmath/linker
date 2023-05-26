<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
		<input type="hidden" name="_method" value="put"/>
		<input type="text" id="userid" name="userid" style="display: none;"/>
			<table>
				<tr>
					<th>사용자명</th>
					<th>아이디</th>
					<th>전화번호</th>
					<th>이메일</th>
					<th>가입일자</th>
					<th> </th>
				</tr>
				<c:forEach items="${ tempList }" var="temp">
					<tr>
						<td>${ temp.name }</td>
						<td>${ temp.userid }</td>
						<td>${ temp.phone }</td>
						<td>${ temp.email }</td>
						<td>${ temp.signupdate }</td>
						<td><button type="button" class="approve" id="${ temp.userid }">승인</button></td>
					</tr>
				</c:forEach>
			</table>
		</form>
		</div>
		<p align="center">
		<a href="/admin" style="text-decoration:none">관리자 페이지로 돌아가기</a>
		</p>
	</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	$(function(){
		$(".approve").on("click", function(){

			var userid = $(this).attr("id");
			
			$("#tempList").attr("action", "/admin/user/approve/" + userid);
			
			$("input[name=userid]").attr("value", userid);
			
			if(confirm("해당 사용자를 승인하시겠습니까?") == true) {
				alert("사용자 승인이 완료되었습니다.");
				$("#tempList").submit();
			} else {
				alert("사용자 승인이 취소되었습니다.");
			}
		});	// approve click end
	});	// ready end
</script>
</body>
</html>