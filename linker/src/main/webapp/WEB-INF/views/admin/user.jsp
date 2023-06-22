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

<!-- Favicon -->
<link href="img/favicon.ico" rel="icon">

<!-- Icon Font Stylesheet -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="/lib/animate/animate.min.css" rel="stylesheet">
<link href="/lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link href="/lib/lightbox/css/lightbox.min.css" rel="stylesheet">

<!-- Customized Bootstrap Stylesheet -->
<link href="/css/bootstrap.min.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="/css/style.css" rel="stylesheet">
<link href="/css/comm/table.css" rel="stylesheet">
</head>

<body>

	<!-- Topbar Start -->
	<div class="container-fluid bg-light p-0">
		<div class="row gx-0 d-none d-lg-flex">
			<div class="col-lg-7 px-5 text-start">
				<div class="h-100 d-inline-flex align-items-center py-3 me-4">
					<small class="fa fa-map-marker-alt text-primary me-2"></small> <small>서울특별시
						종로구 종로12길 15 코아빌딩1</small>
				</div>
				<div class="h-100 d-inline-flex align-items-center py-3">
					<small class="far fa-clock text-primary me-2"></small> <small>월
						- 일 : 09.30 AM - 10.00 PM</small>
				</div>
			</div>
			<div class="col-lg-5 px-5 text-end">
				<div class="h-100 d-inline-flex align-items-center py-3 me-4">
					<small class="fa fa-phone-alt text-primary me-2"></small> <small>02-6901-7001</small>
				</div>
			</div>
		</div>
	</div>
	<!-- Topbar End -->

	<!-- Navbar Start -->
	<nav
		class="navbar navbar-expand-lg bg-white navbar-light sticky-top p-0">
		<a href="/"
			class="navbar-brand d-flex align-items-center px-4 px-lg-5">
			<h2 class="m-0 text-primary">Linker</h2>
		</a>
		<button type="button" class="navbar-toggler me-4"
			data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarCollapse">
			<div class="navbar-nav ms-auto p-4 p-lg-0">
				<c:if test="${ user.role == null }">
					<a href="/" class="nav-item nav-link ">Home</a>
					<a href="/notice/notice" class="nav-item nav-link">공지사항</a>
					<a href="/inquiry/inquiry" class="nav-item nav-link active">문의사항</a>
					<a href="/menu/list" class="nav-item nav-link">식단표</a>
					<a href="/loginform" class="nav-item nav-link">로그인</a>
					<a href="/joinform" class="nav-item nav-link">회원가입</a>
				</c:if>
				<c:if test="${ user.role == 'admin' }">
					<a href="/" class="nav-item nav-link ">Home</a>
					<a href="/notice/notice" class="nav-item nav-link">공지사항</a>
					<a href="/admin" class="nav-item nav-link">관리요약</a>
					<a href="/admin/notice" class="nav-item nav-link">공지사항 관리</a>
					<a href="/admin/inquiry" class="nav-item nav-link">문의사항 관리</a>
					<a href="/admin/user" class="nav-item nav-link active">회원 관리</a>
					<span class="nav-item nav-link">${user.userid} 관리자님 환영합니다.</span>
					<a href="/logout" class="nav-item nav-link">로그아웃</a>
				</c:if>
				<c:if test="${ user.role == 'seller' }">
					<a href="/" class="nav-item nav-link ">Home</a>
					<a href="/notice/notice" class="nav-item nav-link">공지사항</a>
					<a href="/inquiry/inquiry" class="nav-item nav-link active">문의사항</a>
					<a href="/menu/write" class="nav-item nav-link">식단표 관리</a>
					<div class="nav-item dropdown">
						<div class="nav-link dropdown-toggle" data-bs-toggle="dropdown">식자재
							관리</div>
						<div class="dropdown-menu fade-up m-0">
							<a href="/ingredient/ingredientList" class="dropdown-item">식자재
								목록</a> <a href="/inventory/inventoryList" class="dropdown-item">재고현황</a>
							<a href="/inventory/orderList" class="dropdown-item">발주내역</a> <a
								href="/inventory/useDetailList" class="dropdown-item">사용내역</a>
						</div>
					</div>
					<div class="nav-item dropdown">
						<div class="nav-link dropdown-toggle" data-bs-toggle="dropdown">비용
							관리</div>
						<div class="dropdown-menu fade-up m-0">
							<a href="/profitChart" class="dropdown-item">요약</a> <a
								href="/finance/sales" class="dropdown-item">매출내역</a> <a
								href="/finance/expenditure" class="dropdown-item">지출내역</a>
						</div>
					</div>
					<div class="nav-item dropdown">
						<div class="nav-link dropdown-toggle" data-bs-toggle="dropdown">나의
							정보</div>
						<div class="dropdown-menu fade-up m-0">
							<a href="/updateform" class="dropdown-item">회원정보 수정</a> <a
								href="/deleteform" class="dropdown-item">회원탈퇴</a>
						</div>
					</div>
					<span class="nav-item nav-link">${user.userid} 판매자님 환영합니다.</span>
					<a href="/logout" class="nav-item nav-link">로그아웃</a>
				</c:if>
				<c:if test="${ user.role == 'buyer' }">
					<a href="/" class="nav-item nav-link ">Home</a>
					<a href="/notice/notice" class="nav-item nav-link">공지사항</a>
					<a href="/inquiry/inquiry" class="nav-item nav-link active">문의사항</a>
					<a href="/menu/list" class="nav-item nav-link">식단표</a>
					<a href="/ticket/buyTicket" class="nav-item nav-link">식권 구매</a>
					<div class="nav-item dropdown">
						<div class="nav-link dropdown-toggle" data-bs-toggle="dropdown">나의
							정보</div>
						<div class="dropdown-menu fade-up m-0">
							<a href="/ticketorder/ticketorderform" class="dropdown-item">식권
								구매내역</a> <a href="/ticketuse/ticketuseform" class="dropdown-item">식권
								사용내역</a> <a href="/updateform" class="dropdown-item">회원정보 수정</a> <a
								href="/deleteform" class="dropdown-item">회원탈퇴</a>
						</div>
					</div>
					<span class="nav-item nav-link">${user.userid} 구매자님 환영합니다.</span>
					<a href="/logout" class="nav-item nav-link">로그아웃</a>
				</c:if>
			</div>
		</div>
	</nav>
	<!-- Navbar End -->
	<div class="content-wrapper" style="background-color: #f5f5f5">
		<p>
			<strong>회원 관리</strong>
		</p>
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
		</div>
		<p align="center">
			<!-- <a href="/admin" style="text-decoration: none">관리자 페이지로 돌아가기</a> -->
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

	<!-- JavaScript Libraries -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="/lib/wow/wow.min.js"></script>
	<script src="/lib/easing/easing.min.js"></script>
	<script src="/lib/waypoints/waypoints.min.js"></script>
	<script src="/lib/counterup/counterup.min.js"></script>
	<script src="/lib/owlcarousel/owl.carousel.min.js"></script>
	<script src="/lib/isotope/isotope.pkgd.min.js"></script>
	<script src="/lib/lightbox/js/lightbox.min.js"></script>

	<script src="/js/main.js"></script>

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