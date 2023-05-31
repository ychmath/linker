<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>Linker</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<!-- Favicon -->
<link href="../../img/favicon.ico" rel="icon">

<!-- Icon Font Stylesheet -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="../../lib/animate/animate.min.css" rel="stylesheet">
<link href="../../lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link href="../../lib/lightbox/css/lightbox.min.css" rel="stylesheet">

<!-- Customized Bootstrap Stylesheet -->
<link href="../../css/bootstrap.min.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="../../css/style.css" rel="stylesheet">

<style>
.content {
	width: 100%;
}

.InvenList {
	width: 100%;
	border: 1px solid gray;
	border-collapse: collapse;
	margin-top: 30px;
	text-align: center;
}

th {
	text-align: center;
	border-bottom: 1px solid gray;
}

td {
	padding : 8px;
}

.searchController {
	width: 100%;
	align-self: flex-start;
	border: 1px solid gray;
	padding: 15px;
}

.title {
	width: 700px;
	margin-bottom: 30px;
}

.pageController {
	width: 500px;
	margin-left: auto;
	margin-right: auto;
	text-align: center;
}

.content {
	width: 100%;
	align-content: center;
}

#Order {
	margin-top: 10px;
}

#UseDetail {
	margin-top: 10px;
}
</style>
</head>
<body>
<body>

<!--     Spinner Start
 -->    <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner-grow text-primary" style="width: 3rem; height: 3rem;" role="status">
            <span class="sr-only">Loading...</span>
        </div>
    </div>
<!--     Spinner End
 -->    
        <!-- Topbar Start -->
    <div class="container-fluid bg-light p-0">
        <div class="row gx-0 d-none d-lg-flex">
            <div class="col-lg-7 px-5 text-start">
                <div class="h-100 d-inline-flex align-items-center py-3 me-4">
                    <small class="fa fa-map-marker-alt text-primary me-2"></small>
                    <small>서울특별시 종로구 종로12길 15 코아빌딩1</small>
                </div>
                <div class="h-100 d-inline-flex align-items-center py-3">
                    <small class="far fa-clock text-primary me-2"></small>
                    <small>월 - 일 : 09.30 AM - 10.00 PM</small>
                </div>
            </div>
            <div class="col-lg-5 px-5 text-end">
                <div class="h-100 d-inline-flex align-items-center py-3 me-4">
                    <small class="fa fa-phone-alt text-primary me-2"></small>
                    <small>02-6901-7001</small>
                </div>
            </div>
        </div>
    </div>
    <!-- Topbar End -->

<div id="page">

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
					<a href="/" class="nav-item nav-link active">Home</a>
					<a href="/notice/notice" class="nav-item nav-link">공지사항</a>
					<a href="/inquiry/inquiry" class="nav-item nav-link">문의사항</a>
					<a href="/menu/list" class="nav-item nav-link">식단표</a>
					<a href="/loginform" class="nav-item nav-link">로그인</a>
					<a href="/joinform" class="nav-item nav-link">회원가입</a>
				</c:if>
				<c:if test="${ user.role == 'seller' }">
					<a href="/" class="nav-item nav-link ">Home</a>
					<a href="/notice/notice" class="nav-item nav-link">공지사항</a>
					<a href="/inquiry/inquiry" class="nav-item nav-link">문의사항</a>
					<a href="/menu/write" class="nav-item nav-link">식단표 관리</a>
					<div class="nav-item dropdown">
						<div class="nav-link dropdown-toggle active" data-bs-toggle="dropdown">식자재 관리</div>
						<div class="dropdown-menu fade-up m-0">
							<a href="/ingredient/ingredientList" class="dropdown-item">식자재 목록</a>
							<a href="/inventory/inventoryList" class="dropdown-item active">재고현황</a> 
							<a href="/" class="dropdown-item">발주내역</a> 
							<a href="/" class="dropdown-item">사용내역</a>
						</div>
					</div>
					<div class="nav-item dropdown">
						<div class="nav-link dropdown-toggle" data-bs-toggle="dropdown">비용 관리</div>
						<div class="dropdown-menu fade-up m-0">
							<a href="/profitChart" class="dropdown-item">요약</a> 
							<a href="/finance/sales" class="dropdown-item">매출내역</a> 
							<a href="/finance/expenditure" class="dropdown-item">지출내역</a>
						</div>
					</div>
					<div class="nav-item dropdown">
						<div class="nav-link dropdown-toggle" data-bs-toggle="dropdown">나의 정보</div>
						<div class="dropdown-menu fade-up m-0">
							<a href="/updateform" class="dropdown-item">회원정보 수정</a> 
							<a href="/deleteform" class="dropdown-item">회원탈퇴</a>
						</div>
					</div>
					<span class="nav-item nav-link">${user.userid} 판매자님 환영합니다.</span>
					<a href="logout" class="nav-item nav-link">로그아웃</a>
				</c:if>
			</div>
		</div>
	</nav>
    <!-- Navbar End -->	

		<span id="role" style="display: none;">${ user.role }</span>

		<div id="fh5co-about" class="fh5co-section">
			<div class="fh5co-cover" style="height: 50px"></div>
			<div class="container">
				<div class="about-text">
					<h1 class="title">
						<a href="/inventory/inventoryList">재고 목록</a>
					</h1>
					<div class="searchController">
						<form id="searchByName" action="/inventory/searchbyname/result"
							method="get" style="display: inline-block;">
							<p>
								<b>이름별 검색</b>
							</p>
							<input type="search" name="ingredientname" id="ingredientname">
							<input class="btn btn-primary" type="button" id="search-name" value="검색">
						</form>
						&nbsp; &nbsp;
						<form id="searchByReceive" action="/inventory/searchbyreceive/result"
							method="get" style="display: inline-block;">
							<p>
								<b>수령기간별 검색</b>
							</p>
							<input type="date" id="startDay" name="startDay"> <span>-</span> <input type="date" id="endDay" name="endDay">
							<input class="btn btn-primary" type="button" id="search-receive" value="검색">
						</form>
					</div>
					<div class="content">
						<c:if test="${ count != 0 }">
							<table class="InvenList" id="InvenList">
								<thead>
									<tr>
										<th>식자재명</th>
										<th>수량</th>
										<th>유통기한</th>
										<th>수령일</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach items="${ invenList }" var="invenList">
									<tr>
										<td>${ invenList.ingredientname }</td>
										<td>${ invenList.quantity }</td>
										<td><fmt:formatDate dateStyle="long" value="${ invenList.exp }"></fmt:formatDate></td>
										<td><fmt:formatDate dateStyle="long" value="${ invenList.receivedate }"></fmt:formatDate></td>
									</tr>
								</c:forEach>
								</tbody>
							</table>
							<input class="btn btn-primary" type="button" id="Order" value="발주 내역"
								onclick="location.href='change';" />
							<input class="btn btn-primary" type="button" id="UseDetail" value="사용 내역"
								onclick="location.href='change';" />
							<div class="pageController">
								<c:if test="${ begin > end }">
									<a href="inventoryList?p=${ begin-1 }">[이전]</a>
								</c:if>
								<c:forEach begin="${ begin }" end="${ end }" var="i">
									<a href="invetoryList?p=${ i }">${ i }</a>
								</c:forEach>
								<c:if test="${ end < totalPages }">
									<a href="inventoryList?p=${ end + 1 }">[다음]</a>
								</c:if>
							</div>
						</c:if>
						<c:if test="${ count == 0 }">
							입력된 재고가 존재하지 않습니다.
							<input class="btn" type="button" id="changeIngredient" value="목록 추가 / 삭제" onclick="location.href='change';" style="color: black;" />
						</c:if>
					</div>
					<%-- main > content end --%>
				</div>
			</div>
		</div>

		<!-- Footer Start -->
		<div
			class="container-fluid bg-dark text-light footer mt-5 pt-5 wow fadeIn"
			data-wow-delay="0.1s">
			<div class="container">
				<div class="copyright">
					<div class="row">
						<div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
							&copy; <a class="border-bottom" href="#">Linker</a>, All Right
							Reserved.
						</div>
						<div class="col-md-6 text-center text-md-end">
							<!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you'd like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
							Designed By <a class="border-bottom" href="https://htmlcodex.com">HTML
								Codex</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Footer End -->

		<!-- Back to Top -->
		<a href="#"
			class="btn btn-lg btn-primary btn-lg-square rounded-0 back-to-top"><i
			class="bi bi-arrow-up"></i></a>


		<!-- JavaScript Libraries -->
		<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
		<script src="/lib/wow/wow.min.js"></script>
		<script src="/lib/easing/easing.min.js"></script>
		<script src="/lib/waypoints/waypoints.min.js"></script>
		<script src="/lib/counterup/counterup.min.js"></script>
		<script src="/lib/owlcarousel/owl.carousel.min.js"></script>
		<script src="/lib/isotope/isotope.pkgd.min.js"></script>
		<script src="/lib/lightbox/js/lightbox.min.js"></script>

		<!-- Template Javascript -->
		<script src="/js/main.js"></script>
	</div>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(function() {
			// 권한 가져오기
			var role = $("#role").text();

			// 열람 권한이 없다면 페이지 이동.
			if (!(role != 'seller' || role != 'admin')) {
				alert("열람 권한이 없는 페이지입니다.");
				location.href = "/main";
			}

			$("#search-name").click(function() {

				let name = $("#ingredientname").val();

				if (!name || name.replace(/\s+/g, "") == "") {
					alert("검색값을 입력해 주세요.");
					$("#ingredientname").focus();
					return false;
				}

				$("#searchByName").submit();

			}); // search click end

			$("#search-receive").click(function() {

				let startDay = $("#startDay").val();
				let endDay = $("#endDay").val();

				if (!startDay || !endDay || endDay < startDay) {
					alert("올바른 날짜값을 입력해 주세요.");
					$("#startDay").focus();
					return false;
				}

				$("#searchByReceive").submit();

			}); // search click end

		}); // ready end
	</script>
</body>
</html>