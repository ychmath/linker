<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<title>식권 사용</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Favicon -->
<link href="/img/favicon.ico" rel="icon">

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
<link href="/css/comm/basicform.css" rel="stylesheet">
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

	<div class="center-wrapper content-wrapper">
		<!-- 식권 사용을 위한 폼 -->
		<form id="phone-form">
			<div class="commform">
				<h2>식권 사용</h2>
				<div class="comm_field">
					<span>식권 종류</span> <select id="selected">
						<option selected disabled>선택</option>
						<c:forEach items="${tickettypename}" var="type">
							<option value="${type.tickettypeid}">${type.tickettypename}</option>
						</c:forEach>
					</select>
				</div>
				<div class="comm_field">
					<span>전화번호 입력</span> <input type="text" id="phone" name="phone"
						oninput="oninputPhone(this);">
					<button class="submit" type="submit" id="use">식권 사용</button>
				</div>
			</div>
		</form>
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
	<script>
		$(function() {

			function oninputPhone(target) {
				target.value = target.value
				//.replace(/[^0-9]/g, '')
				.replace(/^(\d{3})(\d{4})(\d{4})$/, `$1-$2-$3`);
			}

			$("#phone-form").submit(function(e) {
				e.preventDefault();
				useMealTicket();
			});
		});

		function useMealTicket() {
			var tickettypename = $("#selected").val();
			var quantity = 1;
			var phone = $("#phone").val();

			// 식권 종류 미선택 시 출력
			if (!tickettypename) {
				alert("식권 종류를 선택하세요");
				return;
			}

			// 전화번호 미입력 시 출력
			if (!phone) {
				alert("전화번호를 입력하세요.");
				return;
			}

			// AJAX 요청으로 백엔드와 통신하여 식권 사용 처리할 수 있도록 코드 다음과 같이 넣어야 함
			$.ajax({
				type : "POST",
				url : "/phone/use",
				data : {
					"tickettypename" : tickettypename,
					"quantity" : quantity,
					"phone" : phone
				},
				success : function(result) {
					if (result == true) {
						alert("식권이 정상적으로 사용되었습니다.");
						$('#phone-form')[0].reset();
					} else {
						alert("식권 사용 중 서버 오류가 발생했습니다.");
					}
				},
				error : function(err) {
					alert("식권 사용 중 통신 오류가 발생했습니다.");
				}
			});
		}
	</script>
</body>
</html>