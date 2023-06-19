<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>Linker</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

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
<link href="lib/animate/animate.min.css" rel="stylesheet">
<link href="lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">

<!-- Customized Bootstrap Stylesheet -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="css/style.css" rel="stylesheet">

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
					<a href="/" class="nav-item nav-link active">Home</a>
					<a href="/notice/notice" class="nav-item nav-link">공지사항</a>
					<a href="/inquiry/inquiry" class="nav-item nav-link">문의사항</a>
					<a href="/menu/list" class="nav-item nav-link">식단표</a>
					<a href="/loginform" class="nav-item nav-link">로그인</a>
					<a href="/joinform" class="nav-item nav-link">회원가입</a>
				</c:if>
				<c:if test="${ user.role == 'admin' }">
					<a href="/" class="nav-item nav-link active">Home</a>
					<a href="/notice/notice" class="nav-item nav-link">공지사항</a>
					<a href="/inquiry/inquiry" class="nav-item nav-link">문의사항</a>
					<a href="/admin" class="nav-item nav-link">관리요약</a>
					<a href="/inquiry/inquiry" class="nav-item nav-link">게시글 관리</a>
					<a href="/notice/notice" class="nav-item nav-link">회원 관리</a>
					<span class="nav-item nav-link">${user.userid} 관리자님 환영합니다.</span>
					<a href="/logout" class="nav-item nav-link">로그아웃</a>
				</c:if>
				<c:if test="${ user.role == 'seller' }">
					<a href="/" class="nav-item nav-link active">Home</a>
					<a href="/notice/notice" class="nav-item nav-link">공지사항</a>
					<a href="/inquiry/inquiry" class="nav-item nav-link">문의사항</a>
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
					<a href="/" class="nav-item nav-link active">Home</a>
					<a href="/notice/notice" class="nav-item nav-link">공지사항</a>
					<a href="/inquiry/inquiry" class="nav-item nav-link">문의사항</a>
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

	<!-- Carousel Start -->
	<div class="container-fluid p-0 pb-5">
		<div class="owl-carousel header-carousel position-relative">
			<div class="owl-carousel-item position-relative"
				style="display: flex; justify-content: center;">
				<img class="img-fluid" src="img/breakfast.jpg" alt=""
					style="width: 60%; height: auto;">
				<div
					class="position-absolute top-0 start-0 w-100 h-100 d-flex align-items-center"
					style="background: rgba(53, 53, 53, .7);">
					<div class="container">
						<div class="row justify-content-center">
							<div class="col-12 col-lg-8 text-center">
								<h1 class="display-3 text-white animated slideInDown mb-4">조식</h1>
								<p class="fs-5 fw-medium text-white mb-4 pb-2">오믈렛</p>
								<p class="fs-5 fw-medium text-white mb-4 pb-2">베이컨</p>
								<p class="fs-5 fw-medium text-white mb-4 pb-2">소세지</p>
								<p class="fs-5 fw-medium text-white mb-4 pb-2">감자</p>
								<a href="/menu/list"
									class="btn btn-primary py-md-3 px-md-5 me-3 animated slideInLeft">식단표
									확인</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="owl-carousel-item position-relative"
				style="display: flex; justify-content: center;">
				<img class="img-fluid" src="img/lunch.jpg" alt=""
					style="width: 60%; height: auto;">
				<div
					class="position-absolute top-0 start-0 w-100 h-100 d-flex align-items-center"
					style="background: rgba(53, 53, 53, .7);">
					<div class="container">
						<div class="row justify-content-center">
							<div class="col-12 col-lg-8 text-center">
								<h1 class="display-3 text-white animated slideInDown mb-4">중식</h1>
								<p class="fs-5 fw-medium text-white mb-4 pb-2">자장면</p>
								<p class="fs-5 fw-medium text-white mb-4 pb-2">짬뽕</p>
								<p class="fs-5 fw-medium text-white mb-4 pb-2">볶음밥</p>
								<p class="fs-5 fw-medium text-white mb-4 pb-2">탕수육</p>
								<a href="/menu/list"
									class="btn btn-primary py-md-3 px-md-5 me-3 animated slideInLeft">식단표
									확인</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="owl-carousel-item position-relative"
				style="display: flex; justify-content: center;">
				<img class="img-fluid" src="img/dinner.jpg" alt=""
					style="width: 60%; height: auto;">
				<div
					class="position-absolute top-0 start-0 w-100 h-100 d-flex align-items-center"
					style="background: rgba(53, 53, 53, .7);">
					<div class="container">
						<div class="row justify-content-center">
							<div class="col-12 col-lg-8 text-center">
								<h1 class="display-3 text-white animated slideInDown mb-4">석식</h1>
								<p class="fs-5 fw-medium text-white mb-4 pb-2">스테이크</p>
								<p class="fs-5 fw-medium text-white mb-4 pb-2">해쉬포테이토</p>
								<p class="fs-5 fw-medium text-white mb-4 pb-2">샐러드</p>
								<a href="/menu/list"
									class="btn btn-primary py-md-3 px-md-5 me-3 animated slideInLeft">식단표
									확인</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Carousel End -->

	<!-- Feature Start -->
	<div class="container-xxl py-5">
		<div class="container">
			<div class="row g-5">
				<div class="col-md-6 col-lg-3 wow fadeIn" data-wow-delay="0.1s">
					<div class="d-flex align-items-center justify-content-between mb-2">
						<div
							class="d-flex align-items-center justify-content-center bg-light"
							style="width: 60px; height: 60px;">
							<i class="fa fa-user-check fa-2x text-primary"></i>
						</div>
						<h1 class="display-1 text-light mb-0">01</h1>
					</div>
					<h5>숙련된 요리사</h5>
				</div>
				<div class="col-md-6 col-lg-3 wow fadeIn" data-wow-delay="0.3s">
					<div class="d-flex align-items-center justify-content-between mb-2">
						<div
							class="d-flex align-items-center justify-content-center bg-light"
							style="width: 60px; height: 60px;">
							<i class="fa fa-check fa-2x text-primary"></i>
						</div>
						<h1 class="display-1 text-light mb-0">02</h1>
					</div>
					<h5>신선한 재료</h5>
				</div>
				<div class="col-md-6 col-lg-3 wow fadeIn" data-wow-delay="0.5s">
					<div class="d-flex align-items-center justify-content-between mb-2">
						<div
							class="d-flex align-items-center justify-content-center bg-light"
							style="width: 60px; height: 60px;">
							<i class="fa fa-seedling fa-2x text-primary"></i>
						</div>
						<h1 class="display-1 text-light mb-0">03</h1>
					</div>
					<h5>위생적인 환경</h5>
				</div>
				<div class="col-md-6 col-lg-3 wow fadeIn" data-wow-delay="0.7s">
					<div class="d-flex align-items-center justify-content-between mb-2">
						<div
							class="d-flex align-items-center justify-content-center bg-light"
							style="width: 60px; height: 60px;">
							<i class="fa fa-headphones fa-2x text-primary"></i>
						</div>
						<h1 class="display-1 text-light mb-0">04</h1>
					</div>
					<h5>확실한 고객지원</h5>
				</div>
			</div>
		</div>
	</div>
	<!-- Feature Start -->

	<!-- About Start -->
	<div class="container-fluid bg-light overflow-hidden my-5 px-lg-0">
		<div class="container about px-lg-0">
			<div class="row g-0 mx-lg-0">
				<div class="col-lg-6 ps-lg-0" style="min-height: 400px;">
					<div class="position-relative h-100">
						<img class="position-absolute img-fluid w-100 h-100"
							src="img/about.jpg" style="object-fit: cover;" alt="">
					</div>
				</div>
				<div class="col-lg-6 about-text py-5 wow fadeIn"
					data-wow-delay="0.5s">
					<div class="p-lg-5 pe-lg-0">
						<div class="section-title text-start">
							<h1 class="display-5 mb-4">About Us</h1>
						</div>
						<p class="mb-4 pb-2">신선한 식재료와 위생적인 환경, 숙련된 요리사가 만나 최고의 맛과 건강함을
							선사합니다.</p>
						<div class="row g-4 mb-4 pb-2">
							<div class="col-sm-6 wow fadeIn" data-wow-delay="0.3s">

								<div class="d-flex align-items-center">
									<div
										class="d-flex flex-shrink-0 align-items-center justify-content-center bg-white"
										style="width: 60px; height: 60px;">
										<i class="fa fa-users fa-2x text-primary"></i>
									</div>
									<div class="ms-3">
										<h2 id="sellerCount" class="text-primary mb-1"
											data-toggle="counter-up">0</h2>
										<p class="fw-medium mb-0">판매자 수</p>
									</div>
								</div>
							</div>
							<div class="col-sm-6 wow fadeIn" data-wow-delay="0.3s">
								<div class="d-flex align-items-center">
									<div
										class="d-flex flex-shrink-0 align-items-center justify-content-center bg-white"
										style="width: 60px; height: 60px;">
										<i class="fa fa-users fa-2x text-primary"></i>
									</div>
									<div class="ms-3">
										<h2 id="buyerCount" class="text-primary mb-1"
											data-toggle="counter-up">0</h2>
										<p class="fw-medium mb-0">구매자 수</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- About End -->

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
	<script src="lib/wow/wow.min.js"></script>
	<script src="lib/easing/easing.min.js"></script>
	<script src="lib/waypoints/waypoints.min.js"></script>
	<script src="lib/counterup/counterup.min.js"></script>
	<script src="lib/owlcarousel/owl.carousel.min.js"></script>
	<script src="lib/isotope/isotope.pkgd.min.js"></script>
	<script src="lib/lightbox/js/lightbox.min.js"></script>

	<!-- Template Javascript -->
	<script src="js/main.js"></script>

</body>

</html>