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
<title>식권 구매 내역</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Favicon -->
<link href="../../img/favicon.ico" rel="icon">

<!-- Icon Font Stylesheet -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.5/font/bootstrap-icons.min.css"
	integrity="sha512-ZnR2wlLbSbr8/c9AgLg3jQPAattCUImNsae6NHYnS9KrIwRdcY9DxFotXhNAKIKbAXlRnujIqUWoXXwqyFOeIQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<!-- Libraries Stylesheet -->
<link href="../../lib/animate/animate.min.css" rel="stylesheet">
<link href="../../lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link href="../../lib/lightbox/css/lightbox.min.css" rel="stylesheet">

<!-- Customized Bootstrap Stylesheet -->
<link href="../../css/bootstrap.min.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="../../css/style.css" rel="stylesheet">
<link href="../../css/user/table.css" rel="stylesheet">

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
	<%-- <form:form> --%>
	<form
		action="${pageContext.request.contextPath}/finance/filtered_data_t"
		method="get">
		<div>
			<!--  id="B" -->
			<div>
				<!-- style="display:flex; align-items:center;" -->

				<p>
					<strong>식권 구매 내역</strong>
				</p>
				<br>
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
					</tr>
				</table>
				<br>
			</div>
			<div>
				<table>
					<thead>
						<tr>
							<th scope="col" id="ticketorderid">식권 구매 번호</th>
							<th scope="col" id="orderdate">구매 일자</th>
							<th scope="col" id="tickettypename">식권 종류</th>
							<th scope="col" id="price">식권 가격</th>
							<th scope="col" id="quantity">수량</th>
							<th scope="col" id="totalprice">결제 금액</th>
						</tr>
					</thead>

					<tbody id="saled">

						<c:forEach items="${pList}" var="purchase">
							<tr>
								<td>${purchase.ticketorderid}</td>
								<td><fmt:formatDate value="${purchase.orderdate}"
										pattern="yyyy-MM-dd" /></td>
								<td>${purchase.tickettypename}</td>
								<td>${purchase.price}</td>
								<td>${purchase.quantity}</td>
								<td>${purchase.totalprice}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</form>

	<div id="page">
		<c:if test="${begin > pageNum }">
			<a href="ticketorderform?p=${begin-1 }">[이전]</a>
		</c:if>
		<c:forEach begin="${begin }" end="${end }" var="i">
			<a href="ticketorderform?p=${i }">${i }</a>
		</c:forEach>
		<c:if test="${end < totalPages }">
			<a href="ticketorderform?p=${end+1 }">[다음]</a>
		</c:if>
	</div>

	<c:if test="${count == 0 }">
 	식권 구매 내역이 없습니다.
 	</c:if>
	<!-- Footer Start -->
	<div
		class="container-fluid bg-dark text-light footer mt-0 pt-0 wow fadeIn"
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
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		function search() {
			var start_date = document.getElementById('start-date-input').value;
			var end_date = document.getElementById('end-date-input').value;
			var currentPage = 1;

			//window.location.href = `./finance/filtered_data?start_date=${start_date}&end_date=${end_date}`;}
			showSaledResult(start_date, end_date, currentPage);
		}
		function setMaxDate(elementId) {
			//var today = new Date();
			var currentDate = new Date();
			var currentYear = currentDate.getFullYear();
			var currentMonth = currentDate.getMonth() + 1 < 10 ? "0"
					+ (currentDate.getMonth() + 1) : currentDate.getMonth() + 1;
			var currentDateNum = currentDate.getDate() < 10 ? "0"
					+ currentDate.getDate() : currentDate.getDate();
			var currentDateString = currentYear + "-" + currentMonth + "-"
					+ currentDateNum;

			document.getElementById(elementId).setAttribute("max",
					currentDateString);
		}

		function restrictEndDate() {
			var startDateValue = document.getElementById("start-date-input").value;
			document.getElementById("end-date-input").setAttribute("min",
					startDateValue);
		}

		function restrictStartDate() {
			var endDateValue = document.getElementById("end-date-input").value;
			document.getElementById("start-date-input").setAttribute("max",
					endDateValue);
		}

		setMaxDate("start-date-input");
		setMaxDate("end-date-input");

		function resetSearch() {

			location
					.assign("${pageContext.request.contextPath}/ticket/ticketorderform");

		}

		$(function() {
			$("input[type='radio'][name='date']").on(
					"change",
					function() {
						var dateRange = $(this).val();

						/* var startDate = LocalDateTime.parse(startDate + "T00:00:00");
						var endDate = LocalDateTime.parse(endDate + "T23:59:59"); */

						var startDate = "";
						var endDate = "";

						// dateRange에 따라 startDate와 endDate값을 설정합니다.
						switch (dateRange) {
						case "today":
							startDate = new Date();
							endDate1 = new Date();
							endDate = new Date(endDate1.setDate(endDate1
									.getDate() + 1));
							break;
						case "1month":
							startDate = new Date();
							startDate.setMonth(startDate.getMonth() - 1);
							endDate1 = new Date();
							endDate = new Date(endDate1.setDate(endDate1
									.getDate() + 1));
							break;
						case "3month":
							startDate = new Date();
							startDate.setMonth(startDate.getMonth() - 3);
							endDate1 = new Date();
							endDate = new Date(endDate1.setDate(endDate1
									.getDate() + 1));
							break;
						case "1year":
							startDate = new Date();
							startDate.setFullYear(startDate.getFullYear() - 1);
							endDate1 = new Date();
							endDate = new Date(endDate1.setDate(endDate1
									.getDate() + 1));
							break;
						case "total":
							startDate = new Date("2021-01-01");
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

						showSaledResult(startDateStr, endDateStr, 1);
					});
		});

		function showSaledResult(start, end, page) {
			$.ajax({
				url : "./filtered_data_t",
				data : { //파라미터 값 받아옴
					"start-date" : start,
					"end-date" : end,
					"p" : page

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

		function goToPage(page) {
			currentPage = page; //지정된 페이지 번호를 현재 페이지로 설정
			search(); //검색 함수를 호출하여 결과를 가져옴
		}

		function updateTableWithNewData(data) {
			var table_data = ''; //나중에 HTML 테이블에 추가될 요소들을 저장할 변수
			//$.each(data, function (index, ticket) {

			for (var i = 0; i < data[1].length; i++) {

				let ticket = data[1][i];

				let orderDate = new Date(ticket.orderdate);
				orderDate.setHours(orderDate.getHours() + 9);
				let koreanDate = orderDate.toISOString().split('T')[0];

				table_data += '<tr>';
				table_data += '<td>' + ticket.ticketorderid + '</td>';
				table_data += "<td>" + koreanDate + "</td>";
				table_data += '<td>' + ticket.tickettypename + '</td>';
				table_data += '<td>' + ticket.price + '</td>';
				table_data += '<td>' + ticket.quantity + '</td>';
				table_data += '<td>' + ticket.totalprice + '</td>';
				table_data += '</tr>';

				//기존 Date코드 (UTC+9여서 하루 늦게 반영됐었음. 현재 코드로 수정)
				//new Date(ticket.orderdate).toISOString().split('T')[0]

			}
			//});

			$("#saled").empty();
			$("#saled").append(table_data);

			$("#page").empty();
			//[{"totalPages":6,"count":55,"end":5,"pageNum":5,"begin":1},

			var pageData = data[0];
			var page_str = ""; //사용될 HTML 문자열을 저장할 page_str 변수를 선언하고 빈 문자열을 할당함
			//console.log(pageData.begin);

			if (pageData.begin > pageData.pageNum) {

				page_str += "<span onclick=showSaledResult('"
						+ pageData.startDate + "','" + pageData.endDate + "','"
						+ (pageData.begin - 1) + "')> 이전 </span> ";
			}

			for (index = pageData.begin; index <= pageData.end; index++) {

				page_str += "<span onclick=showSaledResult('"
						+ pageData.startDate + "','" + pageData.endDate + "','"
						+ index + "')>" + index + ' </span> ';

			}

			if (pageData.end < pageData.totalPages) {

				page_str += "<span onclick=showSaledResult('"
						+ pageData.startDate + "','" + pageData.endDate + "','"
						+ (pageData.end + 1) + "')> 다음 </span> ";
			}

			$("#page").append(page_str);
		}
	</script>
</body>
</html>
