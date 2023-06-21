<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%
String start_date = request.getParameter("start_date");
String end_date = request.getParameter("end_date");
%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<title>지출 내역</title>
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
<link href="/css/comm/table.css" rel="stylesheet">
<link href="/css/comm/radio.css" rel="stylesheet">
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
					<a href="/ticket/ticketlist" class="nav-item nav-link">식권 관리</a>
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


	<div class="content-wrapper">
		<%-- <form:form> --%>
		<form
			action="${pageContext.request.contextPath}/finance/filtered_data_ex"
			method="get">
			<div>
				<div>
					<p>
						<strong>지출내역</strong>
					</p>

					<table id="data-table">
						<tr>
							<th id="C">날짜</th>
							<td id="I"><label class="test_obj"> <input
									type="radio" name="date" value="today"> <span>오늘</span>
							</label> <label class="test_obj"> <input type="radio" name="date"
									value="1month"> <span>1개월</span>
							</label> <label class="test_obj"> <input type="radio" name="date"
									value="3month"> <span>3개월</span>
							</label> <label class="test_obj"> <input type="radio" name="date"
									value="1year"> <span>1년</span>
							</label> <label class="test_obj"> <input type="radio" name="date"
									value="total"> <span>전체</span>
							</label> <label for="start-date-input"></label> <input type="date"
								id="start-date-input" name="start-date" min="2021-01-01" max=""
								value="" required oninput="restrictEndDate()"> <label
								for="end-date-input"><a id="P">~</a></label> <input type="date"
								id="end-date-input" name="end-date" min="" max="" value=""
								required oninput="restrictStartDate()">
								<button type="button" id="myButton" onclick="search()">검색</button>
								<input type="radio" name="date" value="search"
								style="display: none">
						</tr>
					</table>
					<br>
				</div>
				<div>
					<table>
						<thead>
							<tr>
								<th scope="col">발주 번호</th>
								<th scope="col">식자재 이름</th>
								<th scope="col">총 가격</th>
								<th scope="col">주문 일자</th>

							</tr>
						</thead>
						<tbody id="saled">
							<c:forEach items="${elist}" var="expenditure">
								<tr>
									<td>${expenditure.orderid}</td>
									<td>${expenditure.ingredientname}</td>
									<td><fmt:formatNumber value="${expenditure.price}" /></td>
									<td><fmt:formatDate value="${expenditure.orderdate}"
											pattern="yyyy-MM-dd" /></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</form>
	</div>
	<div id="page">
		<c:if test="${begin > pageNum }">
			<a href="expenditure?p=${begin-1 }">[이전]</a>
		</c:if>
		<c:forEach begin="${begin }" end="${end }" var="i">
			<a href="expenditure?p=${i }">${i }</a>
		</c:forEach>
		<c:if test="${end < totalPages }">
			<a href="expenditure?p=${end+1 }">[다음]</a>
		</c:if>
	</div>

	<c:if test="${count == 0 }">
 	지출 내역이 없습니다.
 	</c:if>

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
		function search() {
			var start_date = document.getElementById('start-date-input').value;
			var end_date = document.getElementById('end-date-input').value;

			//window.location.href = `./finance/filtered_data?start_date=${start_date}&end_date=${end_date}`;}
			showSaledResult(start_date, end_date);
		}
	</script>
	<button type="button" id="myButton" onclick="search()">검색</button>
	<script>
		$(function() {
			$("input[type='radio'][name='date']").on(
					"change",
					function() {
						var dateRange = $(this).val();
						var startDate = "";
						var endDate = "";

						switch (dateRange) {
						case "today":
							startDate = new Date();
							endDate = new Date();
							break;
						case "1month":
							startDate = new Date();
							startDate.setMonth(startDate.getMonth() - 1);
							endDate = new Date();
							break;
						case "3month":
							startDate = new Date();
							startDate.setMonth(startDate.getMonth() - 3);
							endDate = new Date();
							break;
						case "1year":
							startDate = new Date();
							startDate.setFullYear(startDate.getFullYear() - 1);
							endDate = new Date();
							break;
						}
						var startYear = startDate.getFullYear();
						var startMonth = startDate.getMonth() + 1 < 10 ? "0"
								+ (startDate.getMonth() + 1) : startDate
								.getMonth() + 1;
						var startDateNum = startDate.getDate() < 10 ? "0"
								+ startDate.getDate() : startDate.getDate();
						var endYear = endDate.getFullYear();
						var endMonth = endDate.getMonth() + 1 < 10 ? "0"
								+ (endDate.getMonth() + 1)
								: endDate.getMonth() + 1;
						var endDateNum = endDate.getDate() < 10 ? "0"
								+ endDate.getDate() : endDate.getDate();

						var startDateStr = startYear + "-" + startMonth + "-"
								+ startDateNum;
						var endDateStr = endYear + "-" + endMonth + "-"
								+ endDateNum;

						showSaledResult(startDateStr, endDateStr);
					});
		});

		function showSaledResult(start, end) {
			$.ajax({
				url : "./filtered_data_ex",
				data : {
					"start-date" : start,
					"end-date" : end
				},
				type : "GET",
				dataType : "json",
				success : function(data) {
					updateTableWithNewData(data);
				},
				error : function(error) {
					console.log(error);
				}
			});
		}

		function updateTableWithNewData(data) {
			var table_data = '';
			//$.each(data, function (index, expenditure) {

			for (var i = 0; i < data.length; i++) {
				let expenditure = data[i];
				table_data += '<tr>';
				table_data += '<td>' + expenditure.orderid + '</td>';
				table_data += '<td>' + expenditure.ingredientname + '</td>';
				table_data += '<td>' + expenditure.price + '</td>';
				table_data += "<td>"
						+ new Date(expenditure.orderdate).toISOString().split(
								'T')[0] + "</td>";

				table_data += '</tr>';
			}
			//});

			$("#saled").empty();
			$("#saled").append(table_data);
		}
	</script>
</body>
</html>