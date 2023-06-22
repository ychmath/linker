<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<link href="/lib/animate/animate.min.css" rel="stylesheet">
<link href="/lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link href="/lib/lightbox/css/lightbox.min.css" rel="stylesheet">

<!-- Customized Bootstrap Stylesheet -->
<link href="/css/bootstrap.min.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="/css/style.css" rel="stylesheet">
<link href="/css/comm/fixedfooter.css" rel="stylesheet">
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
				<c:if test="${ user.role == 'seller' }">
					<a href="/" class="nav-item nav-link ">Home</a>
					<a href="/notice/notice" class="nav-item nav-link">공지사항</a>
					<a href="/inquiry/inquiry" class="nav-item nav-link">문의사항</a>
					<a href="/menu/list" class="nav-item nav-link">식단표 관리</a>
					<div class="nav-item dropdown">
						<div class="nav-link dropdown-toggle" data-bs-toggle="dropdown">식권
							관리</div>
						<div class="dropdown-menu fade-up m-0">
							<a href="/ticket/ticketlist" class="dropdown-item">식권 목록</a> <a
								href="phone" class="dropdown-item" target="_blank">구매자 식권 사용</a>
						</div>
					</div>
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
						<div class="nav-link dropdown-toggle active" data-bs-toggle="dropdown">비용
							관리</div>
						<div class="dropdown-menu fade-up m-0">
							<a href="/profitChart" class="dropdown-item active">요약</a> <a
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
			</div>
		</div>
	</nav>
	<!-- Navbar End -->

	<span id="role" style="display: none;">${ user.role }</span>
<div class="content-wrapper">
		<div class="container">
				<form id="searchYear">
					<h1 class="section-title">비용 관리</h1>
					<p>*최근 3년간의 결과만 조회 가능합니다.</p>
					<br> <select name="targetYear" id="targetYear"></select>
					<button class="search_btn" id="search_btn" type="button" >검색</button>
				</form>
		
			<hr>
			<br>
			<h1 class="section-title.text-start">연간 요약</h1>
			<div class="feature-text">
				<%-- 차트가 들어갈 캔버스 생성 --%>
				<canvas width="600" height="400" id="myChart"></canvas>
			</div>
		</div>
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

	<!-- Template Javascript -->
	<script src="/js/main.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

	<script>
		$(function() {
			// 권한 가져오기
			var role = $("#role").text();

			// 열람 권한이 없다면 페이지 이동.
			if (role != 'seller') {
				alert("열람 권한이 없는 페이지입니다.");
				location.href = "/main";
			}

			// 검색할 년도 지정: 최대 3년간 지정 가능
			var year = new Date().getFullYear();
			var startyear = year - 3;

			for (i = year; i > startyear; i--) {
				// 최근 년도부터 3년간 지정한 결과를 option 태그로 선택할 수 있도록 지정.
				$('#targetYear').append($('<option/>').val(i).html(i));
			}

			// 매출 내역을 저장할 배열
			var saleResult = [];

			// 매입 내역을 저장할 내역
			var purchaseResult = [];

			// 순수익 저장 배열
			var netResult = [];

			// id가 myChart인 캔버스 지정
			var ctx = document.getElementById("myChart");

			// chart 변수로 차트 데이터를 만든다.
			var chart = new Chart(ctx, {
				type : 'bar', // 디폴트 차트 타입 지정
				data : {
					labels : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월',
							'9월', '10월', '11월', '12월' ],
					datasets : [ {
						label : '총수익',
						yAxisID : 'y-left',
						backgroundColor : 'rgba(255, 99, 132, 0.2)',
						borderColor : 'rgba(255, 99, 132, 1)',
						borderWidth : 1,
						data : saleResult
					}, {
						label : '총지출',
						yAxisID : 'y-left',
						backgroundColor : 'rgba(75, 192, 192, 0.2)',
						borderColor : 'rgba(75, 192, 192, 1)',
						borderWidth : 1,
						data : purchaseResult
					}, {
						label : '순수익',
						yAxisID : 'y-left',
						type : 'line',
						fill : false,
						lineTension : 0,
						pointRadius : 0,
						backgroundColor : 'rgb(255, 204, 0)',
						borderColor : 'rgb(255, 204, 0)',
						data : netResult
					} ]
				}, // data end
				options : {
					responsive : true,
					maintainAspectRatio : false,
					scales : {
						x : {
							title : {
								display : false,
								text : '월'
							}
						},
						'y-left' : {
							type : 'linear',
							position : 'left',
							title : {
								display : true,
								text : '금액'
							},
							grid : {
								display : false
							},
							padding : {
								top : 30,
								left : 0,
								right : 0,
								bottom : 0
							}
						}
					// 'y-left end'
					}
				// scales end
				}
			// option end
			}); // chart end

			// 검색 버튼 클릭 시
			$("#search_btn").click(function() {
				// 매입/매출에 기본값 0 저장
				for (var i = 0; i < 12; i++) {
					// 12칸의 배열을 형성, 각각 0을 배정한다.
					saleResult[i] = 0;
					purchaseResult[i] = 0;
				}

				// 매출, 매입 내역을 가져온다. when - done 처리로 ajax 데이터 저장이 끝난 후 차트에 적용되도록 한다.
				$.when($.getJSON("/getysResult", {
					targetYear : $('#targetYear').val()
				}, function(data) {
					$.each(data, function(index, obj) {
						// 배열의 index가 0부터 시작이므로 각 월의 값에서 1을 뺀 index에 각 월의 매출값을 저장한다.
						saleResult[obj.month - 1] = obj.totalSale;
					})
				}), // 연간 매출 배열에 저장 완료

				$.getJSON("/getpResult", {
					targetYear : $('#targetYear').val()
				}, function(data) {
					$.each(data, function(index, obj) {
						purchaseResult[obj.month - 1] = obj.totalPurchase;
					})
				}) // 연간 매입 배열에 저장 완료

				).done(function() {
					// 매입과 매출 내역이 전부 저장되었다면 (매출 - 매입) 값을 순수익 배열에 저장한다.
					for (var i = 0; i < 12; i++) {
						netResult[i] = saleResult[i] - purchaseResult[i];

					}
					// 차트에 가져온 데이터를 각각 업데이트한다.
					chart.update();
				}); // done end

			}); // click end

		}); // ready end
	</script>
</body>
</html>