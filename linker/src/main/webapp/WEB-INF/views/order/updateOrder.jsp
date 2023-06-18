<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>Linker</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<link href="/css/menu/menu_write.css" rel="stylesheet">
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
.container {
	min-height: 200px;
}

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
	padding: 8px;
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
	text-align: left;
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

#newOrder {
	margin-top: 10px;
}

#UseDetail {
	margin-top: 10px;
}
</style>
</head>
<body>
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
							<div class="nav-link dropdown-toggle active"
								data-bs-toggle="dropdown">식자재 관리</div>
							<div class="dropdown-menu fade-up m-0">
								<a href="/ingredient/ingredientList" class="dropdown-item">식자재
									목록</a> <a href="/inventory/inventoryList" class="dropdown-item">재고현황</a>
								<a href="/inventory/orderList" class="dropdown-item active">발주내역</a>
								<a href="/inventory/useDetailList" class="dropdown-item">사용내역</a>
							</div>
						</div>
						<div class="nav-item dropdown">
							<div class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
								비용관리</div>
							<div class="dropdown-menu fade-up m-0">
								<a href="/profitChart" class="dropdown-item">요약</a> <a
									href="/finance/sales" class="dropdown-item">매출내역</a> <a
									href="/finance/expenditure" class="dropdown-item">지출내역</a>
							</div>
						</div>
						<div class="nav-item dropdown">
							<div class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
								나의 정보</div>
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

		<div id="fh5co-about" class="fh5co-section">
			<div class="fh5co-cover" style="height: 50px"></div>
			<div class="container">
				<div class="about-text">
					<h1 class="title">
						<a href="/inventory/orderList">발주 내역</a>
					</h1>
					<div class="orderController">
						<form id="addOrder" action="/order/insert" method="post">
							<p>
								<b>발주내역 추가</b>
							</p>
							<span>식자재명:&nbsp;</span> <select name="ingredientid" required>
								<c:forEach items="${ IngredientList }" var="IngredientList">
									<option value="${ IngredientList.ingredientid }">${ IngredientList.ingredientname }</option>
								</c:forEach>
							</select> <span>공급자:&nbsp;</span><input name="supplier" required>
							<span>주문수량:&nbsp;</span><input name="orderquantity" type="number"
								required> <span>주문가격:&nbsp;</span><input
								name="orderprice" required> <span>주문일:&nbsp;</span><input
								name="orderdate" type="date" required>
							<div>
								<input type="button" id="add" class="button btn btn-primary"
									value="식자재 등록" />
							</div>
						</form>
					</div>
					<div class="deleteController">
						<table class="InvenList" id="InvenList">
							<thead>
								<tr>
									<th style="width: 5%;"></th>
									<th>식자재명</th>
									<th>공급자</th>
									<th>주문수량</th>
									<th>주문가격</th>
									<th>주문일</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${ orderList }" var="orderList">
									<tr class="orders">
										<td><input type="checkbox" name="checkList"
											class="checkList" value="${ orderList.orderid }"></td>
										<td>${ orderList.ingredientname }</td>
										<td>${ orderList.supplier }</td>
										<td>${ orderList.orderquantity }</td>
										<td>${ orderList.orderprice }</td>
										<td><fmt:formatDate dateStyle="long"
												value="${ orderList.orderdate }"></fmt:formatDate></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<div>
							<input class="btn btn-primary" type="button" id="deleteOrder"
								value="선택 내역 삭제" />
						</div>
					</div>
					<div class="pageController">
						<c:if test="${ begin > end }">
							<a href="changeOrder?p=${ begin-1 }">[이전]</a>
						</c:if>
						<c:forEach begin="${ begin }" end="${ end }" var="i">
							<a href="changeOrder?p=${ i }">${ i }</a>
						</c:forEach>
						<c:if test="${ end < totalPages }">
							<a href="changeOrder?p=${ end + 1 }">[다음]</a>
						</c:if>
					</div>
					<%-- main > content end --%>
				</div>
			</div>
			<!-- container end -->
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

			$("#deleteOrder").on("click", function() {
				// 체크박스에 체크된 식자재 id 번호 값 찾기
				$(".checkList:checked").each(function(i, item) {
					// target에 id값 저장
					var target = item.value;

					$.ajax({
						url : "/order/delete/" + target,
						method : "delete",
						data : {
							'orderid' : target
						}
					}).done(function(result) {

					});
				}); // each end

				alert("삭제가 완료되었습니다.");
				location.replace("/inventory/orderList/updateOrder");
			});

			$("#add").on(
					"click",
					function(event) {
						// 바로 전송 차단
						event.preventDefault;

						// 하나라도 값이 입력되지 않은 경우
						if (!$("input[name='supplier']").val()
								|| !$("select[name='ingredientid']").val()
								|| !$("input[name='orderquantity']").val()
								|| !$("input[name='orderprice']").val()
								|| !$("input[name='orderdate']").val()) {
							// submit 하지 않고 alert 출력
							alert("필수 항목을 전부 입력해 주십시오.");
						} else {
							// 전부 입력했다면 submit
							alert("등록이 완료되었습니다.");
							$("#addOrder").submit();
						}
					});

		}); // ready end
	</script>
</body>
</html>