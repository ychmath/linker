<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<link rel="stylesheet" type="text/css" href="../css/admin/adminmain.css">
<style>
  .menu {
    padding: auto;;   /* 왼쪽 간격을 조절합니다. 원하는 값으로 지정할 수 있습니다. */
  }
</style>
</head>
<body>
	<div class="title">
		<h1 align="center">관리자 페이지</h1>
	</div>
	<div class="main">
		<div class="menu"  align="center">
			<a href="/admin/user" style="text-decoration:none">회원 관리</a>
			<a href="/admin/notice" style="text-decoration:none" >문의사항 관리</a>
			<a href="/admin/inquiry" style="text-decoration:none" >공지사항 관리</a>
			<a href ="/"">홈으로 돌아가기</a>
		</div>
		<div class="userList">
			<p><b>최근 가입한 사용자</b></p>
			<c:if test="${ userCount != 0 }">
				<table>
					<tr>
						<th>사용자명</th>
						<th>아이디</th>
						<th>이메일</th>
						<th>전화번호</th>
						<th>권한</th>
						<th>가입일자</th>
					</tr>
					<c:forEach items="${ userList }" var="user">
						<tr>
							<td>${ user.name }</td>
							<td>${ user.userid }</td>
							<td>${ user.email }</td>
							<td>${ user.phone }</td>
							<td>${ user.role }</td>
							<td><fmt:formatDate value="${ user.signupdate }" dateStyle="short"/></td>
						</tr>
					</c:forEach>
				</table>
			</c:if>
			<c:if test="${ userCount == 0 }">
				사용자가 존재하지 않습니다.
			</c:if>
		</div>
		<div class="inquiryList">
			<p><b>최근 올라온 문의사항</b></p>
			<c:if test="${ inquiryCount != 0 }">
				<table>
					<tr>
						<th>글쓴이</th>
						<th>제목</th>
						<th>작성일자</th>
					</tr>
					<c:forEach items="${ inquiryList }" var="inquiry">
						<tr>
							<td>${ inquiry.userid }</td>
							<td>${ inquiry.title }</td>
							<td><fmt:formatDate value="${ inquiry.creationdate }" dateStyle="short"/></td>
						</tr>
					</c:forEach>
				</table>
			</c:if>
			<c:if test="${ inquiryCount == 0 }">
				아직 올라온 게시물이 없습니다.
			</c:if>
		</div>
		<div class="noticeList">
			<p><b>최근 올라온 공지사항</b></p>
			<c:if test="${ noticeCount != 0 }">
				<table>
					<tr>
						<th>글쓴이</th>
						<th>제목</th>
						<th>작성일자</th>
					</tr>
					<c:forEach items="${ noticeList }" var="notice">
						<tr>
							<td>${ notice.userid }</td>
							<td>${ notice.title }</td>
							<td><fmt:formatDate value="${ notice.creationdate }" dateStyle="short"/></td>
						</tr>
					</c:forEach>
				</table>
			</c:if>
			<c:if test="${ noticeCount == 0 }">
				아직 올라온 게시물이 없습니다.
			</c:if>
		</div>
	</div>
</body>
</html>