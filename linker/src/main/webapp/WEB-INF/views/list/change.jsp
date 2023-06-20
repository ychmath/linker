<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Linker</title>

<style>
.content {
	width: 100%;
}

.container{
	min-height: 210px;
}

.IngredientList {
	width: 100%;
	border: 1px solid gray;
	border-collapse: collapse;
	margin-top: 30px;
	text-align: center;
	table-layout: fixed;
}

th {
	text-align: center;
	border-bottom: 1px solid gray;
}

.listController {
	width: 100%;
	align-self: flex-start;
	padding: 10px;
	border: 1px solid gray;
}

.pageController {
	width: 500px;
	margin-left: auto;
	margin-right: auto;
	text-align: center;
}

.button {
	margin-top: 10px;
}

.title {
	width: 700px;
	margin-bottom: 30px;
}

.checkList {
	margin-top: 10px;
}
</style>
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
					<a href="/menu/list" class="nav-item nav-link">식단표 관리</a>
					<div class="nav-item dropdown">
						<div class="nav-link dropdown-toggle" data-bs-toggle="dropdown">식자재 관리</div>
						<div class="dropdown-menu fade-up m-0">
							<a href="/ingredient/ingredientList" class="dropdown-item">식자재 목록</a>
							<a href="/inventory/inventoryList" class="dropdown-item">재고현황</a> 
							<a href="/inventory/orderList" class="dropdown-item">발주내역</a> 
							<a href="/inventory/useDetailList" class="dropdown-item">사용내역</a>
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
					<a href="/logout" class="nav-item nav-link">로그아웃</a>
				</c:if>
				<c:if test="${ user.role == 'buyer' }">
					<a href="/" class="nav-item nav-link active">Home</a>
					<a href="/notice/notice" class="nav-item nav-link">공지사항</a>
					<a href="/inquiry/inquiry" class="nav-item nav-link">문의사항</a>
					<a href="/menu/list" class="nav-item nav-link">식단표</a>
					<a href="/ticket/buyTicket" class="nav-item nav-link">식권 구매</a>
					<div class="nav-item dropdown">
						<div class="nav-link dropdown-toggle" data-bs-toggle="dropdown">나의 정보</div>
						<div class="dropdown-menu fade-up m-0">
							<a href="/ticketorder/ticketorderform" class="dropdown-item">식권 구매내역</a> 
							<a href="/ticketuse/ticketuseform" class="dropdown-item">식권 사용내역</a>
							<a href="/updateform" class="dropdown-item">회원정보 수정</a> 
							<a href="/deleteform" class="dropdown-item">회원탈퇴</a>
						</div>
					</div>
					<span class="nav-item nav-link">${user.userid} 구매자님 환영합니다.</span>
					<a href="/logout" class="nav-item nav-link">로그아웃</a>
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
						<a href="/ingredient/ingredientList">식자재 목록</a>
					</h1>
					<div class="listController">
						<p>
							<b>식자재 추가</b>
						</p>
						<form id="addIngredient" action="/ingredient/insert" method="post">
							<span>식자재명:&nbsp;</span><input name="ingredientname" required>&nbsp;
							<span>단위:&nbsp;</span> <select name="unit" required>
								<option value="KG">KG</option>
								<option value="G">G</option>
								<option value="LB">LB</option>
								<option value="OZ">OZ</option>
							</select><span>유통기한:&nbsp;</span><input name="exp" type="date"required>
							<div>
								<input type="button" id="add" class="button btn btn-primary" value="식자재 등록" />
							</div>
						</form>
					</div>
					<div class="content">
						<form id="deleteIngredient">
								<table class="IngredientList" id="IngredientList">
									<tr>
										<th style="width: 5%;"></th>
										<th>식자재명</th>
										<th>단위</th>
										<th>유통기한</th>
									</tr>
									<c:forEach items="${ ingredientList }" var="ingredient">
										<tr class="ingredientlist">
											<td>
											<input type="checkbox" name="checkList" class="checkList" value="${ ingredient.ingredientid }">
											</td>
											<td>${ ingredient.ingredientname }</td>
											<td>${ ingredient.unit }</td>
											<td>${ ingredient.exp }</td>
										</tr>
									</c:forEach>
								</table>
								<div>
									<input type="button" id="delete" class="button btn btn-primary" value="선택한 식자재 삭제" />
								</div>
								</form>
								<div class="pageController">
									<c:if test="${ begin > end }">
										<a href="change?p=${ begin-1 }">[이전]</a>
									</c:if>
									<c:forEach begin="${ begin }" end="${ end }" var="i">
										<a href="change?p=${ i }">${ i }</a>
									</c:forEach>
									<c:if test="${ end < totalPages }">
										<a href="change?p=${ end + 1 }">[다음]</a>
									</c:if>
								</div>
					</div>
					<%-- main > content end --%>
				</div>
				<%-- main > container end --%>
			</div>
			<%-- main end --%>
		</div>
		<!-- about end -->

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
	</div>
	<%-- page end --%>

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
	<script src="../js/main.js"></script>
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

			$("#delete").on("click", function() {
				// 체크박스에 체크된 식자재 id 번호 값 찾기
				$(".checkList:checked").each(function(i, item) {
					// target에 value값 저장
					var target = item.value;

					$.ajax({
						url : "/ingredient/delete/" + target,
						method : "delete",
						data : {
							'ingredientid' : target
						}
					}).done(function(result) {

					});
				}); // each end

				alert("삭제가 완료되었습니다.");
				location.replace("/ingredient/change");
			});

			$("#add").on(
					"click",
					function(event) {
						// 바로 전송 차단
						event.preventDefault;

						// 하나라도 값이 입력되지 않은 경우
						if (!$("input[name='ingredientname']").val()
								|| !$("select[name='unit']").val()
								|| !$("input[name='exp']").val()) {
							// submit 하지 않고 alert 출력
							alert("필수 항목을 전부 입력해 주십시오.");
						} else {
							// 전부 입력했다면 submit
							alert("등록이 완료되었습니다.");
							$("#addIngredient").submit();
						}
					});
		});
	</script>
</body>
</html>