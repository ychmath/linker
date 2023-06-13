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
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>Linker</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

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
p { /* 식권 사용 내역 폰트 크기 */
	font-size: 25px;
}

#C {
	background-color: #EBD3B0;
	border-bottom: 1px solid #444444;
	padding: 10px;
	text-align: center;
}

table {
	width: 100%;
	/*     border-top: 1px solid #444444;
 */
	border-collapse: collapse;
}

th, td {
	border-left: 1px solid #444444;
	padding: 10px;
	border-spacing: 0;
}

th {
	background-color: #EBD3B0;
}

td {
	text-align: center;
	justify-content: center;
}

th:first-child, td:first-child {
	border-left: none;
}

#B>div {
	width: 100%;
	box-sizing: border-box; /* border와 padding을 포함한 크기를 지정합니다. */
	float: left; /* 좌우 정렬을 위해 float 속성을 사용합니다. */
}

#B>div:first-child {
	padding-right: 104px; /* 첫 번째 div 요소 오른쪽에 10px의 padding을 추가합니다. */
}

#B>div:last-child {
	padding-left: 10px; /* 마지막 div 요소 왼쪽에 10px의 padding을 추가합니다. */
}

#B table {
	width: 100%;
	height: 100%;
}

.test_obj input[type="radio"] { /* 라디오 버튼 네모박스 */
	display: none;
}

.test_obj input[type="radio"]+span { /* 라디오 버튼,오늘~1년 */
	display: inline-block;
	border: 1px solid #dfdfdf;
	background-color: #ffffff;
	text-align: center;
	cursor: pointer;
	width: 60px;
	height: 30px;
	float: left;
}

.test_obj input[type="radio"]+span:hover {
	background-color: #e0e0e0;
}

#start-date-input {
	float: left;
}

#end-date-input {
	float: left;
}

#myButton { /* 검색버튼 위치 */
	margin-left: 10px;
	margin-right: 10px;
}

.resetButton { /* X버튼 */
	display: inline-block;
	background-color: #ffffff;
	border: 1px solid #ccc;
	cursor: pointer;
}

.resetButton:hover { /* X버튼에 마우스 대면 색이 바뀜 */
	background-color: #e0e0e0;
}

@media screen and (max-width: 768px) {
	#ticketulist {
		width: auto; /* 뷰포트 너비에 따라 자동으로 너비 조절 */
	}
}

#ticketusel { /* 사용일자부터 밑에 테이블까지 한꺼번에 묶인 */
	width: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
	flex-wrap: wrap;
}

@media screen and (max-width: 1500px) {
	#ticketusel {
		max-width: 100%; /* 뷰포트 너비에 따라 너비가 최대 100%로 자동 조절 */
	}
}

@media screen and (max-width: 1000px) {
	#ticketusel {
		min-width: auto; /* 뷰포트 너비가 1000px 이하일 경우 최소 너비를 자동 조절 */
	}
}

#usetable, #usedate {
	width: 100%;
	max-width: 1000px;
}

#usedate {
	width: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
	flex-wrap: wrap;
}

@media screen and (max-width: 1000px) {
	#usetable, #usedate {
		width: 100%; /* 뷰포트 너비에 따라 자동으로 너비 조절 */
	}
}

#usetable {
	border-left: 1px solid #000;
	border-bottom: 1px solid #000;
	border-right: 1px solid #000;
	border-spacing: 0;
	width: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
}

#tableth { /* 텍스트 가운데 정렬 */
	text-align: center;
	border-top: 1px solid #000;
	border-left: 1px solid #000;
	border-right: 1px solid #000;
}

#data-table {
	height: 30%;
	border-top: 2px solid #000;
	border-bottom: 1px solid #000;
	border-left: 2px solid #000;
	border-right: 2px solid #000;
	border-spacing: 0;
}

#saled {
	border-spacing: 0;
	border-top: 2px solid #000;
}

#wave {
	display: inline-block;
	margin-left: 10px;
	margin-right: 10px;
}

#dateform {
	display: flex;
	justify-content: center;
	align-items: center;
	flex-wrap: wrap;
}

#X_button {
	text-align: right;
	margin-left: 5px;
}

.reset_btn {
	text-align: right;
	margin-left: 5px;
}
</style>
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
					<a href="/" class="nav-item nav-link active">Home</a>
					<a href="/notice/notice" class="nav-item nav-link">공지사항</a>
					<a href="/inquiry/inquiry" class="nav-item nav-link">문의사항</a>
					<a href="/menu/write" class="nav-item nav-link">식단표 관리</a>
					<div class="nav-item dropdown">
						<div class="nav-link dropdown-toggle" data-bs-toggle="dropdown">식자재
							관리</div>
						<div class="dropdown-menu fade-up m-0">
							<a href="/ingredient/ingredientList" class="dropdown-item">식자재
								목록</a> <a href="/" class="dropdown-item">재고현황</a> <a href="/"
								class="dropdown-item">발주내역</a> <a href="/" class="dropdown-item">사용내역</a>
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

			</div>
		</div>
	</nav>
	<!-- Navbar End -->







	<form
		action="${pageContext.request.contextPath}/ticket/filtered_data_u"
		method="get">
		<div id="ticketusel">
			<div id="usedate">
				<p>
					<strong>식권 사용 내역</strong>
				</p>
				<br>
				<table id="data-table">
					<tr>
						<th id="C">사용 일자</th>
						<td id="dateform"><label for="start-date-input"> <input
								type="date" id="start-date-input" name="start-date"
								min="2021-01-01" max="" value="" required>
						</label> <a id="wave">~</a> <label for="end-date-input"> <input
								type="date" id="end-date-input" name="end-date" min="" max=""
								value="" required>
						</label> <label><button type="button" id="myButton"
									onclick="search()">검색</button></label> <label class="test_obj">
								<input type="radio" name="date" value="today"> <span>오늘</span>
						</label> <label class="test_obj"> <input type="radio" name="date"
								value="1month"> <span>1개월</span>
						</label> <label class="test_obj"> <input type="radio" name="date"
								value="3month"> <span>3개월</span>
						</label> <label class="test_obj"> <input type="radio" name="date"
								value="1year"> <span>1년</span>
						</label>
							<div class="reset_btn">
								<button type="button" id="X_button" class="resetButton"
									onclick="resetSearch()">X</button>
							</div> <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>



							<script>
								let y = new Date();
								y.setDate(y.getDate()); // 오늘 날짜 세팅
								let today = y.getFullYear() + "-"
										+ ("0" + (y.getMonth() + 1)).slice(-2)
										+ "-" + ("0" + y.getDate()).slice(-2);

								$("#start-date-input").attr("max", today);
								$("#end-date-input").attr("max", today);

								function search() {
									var start_date = document
											.getElementById('start-date-input').value;
									var end_date = document
											.getElementById('end-date-input').value;

									if (end_date < start_date) {
										alert("날짜를 다시 선택해 주세요");
										return false;
									}

									showSaledResult(start_date, end_date);

								}
							</script> <script>
		function resetSearch() {

			location
					.assign("${pageContext.request.contextPath}/ticketuse/ticket");
		}
		function updateEndDate() {
			const startDate = document.getElementById('start-date-input');
			const endDate = document.getElementById('end-date-input');
			if (startDate.value) {
				endDate.min = startDate.value;
			}
		}

		function updateStartDate() {
			const startDate = document.getElementById('start-date-input');
			const endDate = document.getElementById('end-date-input');
			if (endDate.value) {
				startDate.max = endDate.value;
			}
		}
		$(function() {
			$("input[type='radio'][name='date']").on(
					"change",
					function() {
						var dateRange = $(this).val();
						var startDate = "";
						var endDate = "";

						// dateRange에 따라 startDate와 endDate값을 설정합니다.
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
				url : "./filtered_data_u",
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
			//$.each(data, function (index, ticket) {

			for (var i = 0; i < data.length; i++) {
				let ticket = data[i];
				table_data += '<tr>';
				table_data += '<td style="border-bottom: 1px solid #444444;">'
						+ new Date(ticket.usedate).toISOString().split('T')[0]
						+ "</td>";
				table_data += '<td style="border-bottom: 1px solid #444444;">'
						+ ticket.tickettypename + '</td>';
				table_data += '<td style="border-bottom: 1px solid #444444;">'
						+ ticket.quantity + '</td>';
				table_data += '</tr>';
			}
			//});

			$("#saled").empty();
			$("#saled").append(table_data);
		}
	</script>
					</tr>
				</table>
				<br>
			</div>
			<div id="usetable">
				<table>
					<thead id="tableth">
						<tr id="usehead">
							<th scope="col">사용 일자</th>
							<th scope="col">식권 종류</th>
							<th scope="col">수량</th>
						</tr>
					</thead>
					<tbody id="saled">
						<c:forEach items="${tulist}" var="ticketu">
							<tr>
								<td style="border: 1px solid black;"><fmt:formatDate
										value="${ticketu.usedate}" pattern="yyyy-MM-dd" /></td>
								<td style="border: 1px solid black;">${ticketu.tickettypename}</td>
								<td style="border: 1px solid black;">${ticketu.quantity}</td>

							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

		</div>
	</form>
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

	<!-- JavaScript Libraries -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="../../lib/wow/wow.min.js"></script>
	<script src="../../lib/easing/easing.min.js"></script>
	<script src="../../lib/waypoints/waypoints.min.js"></script>
	<script src="../../lib/counterup/counterup.min.js"></script>
	<script src="../../lib/owlcarousel/owl.carousel.min.js"></script>
	<script src="../../lib/isotope/isotope.pkgd.min.js"></script>
	<script src="../../lib/lightbox/js/lightbox.min.js"></script>

	<!-- Template Javascript -->
	<script src="../../js/main.js"></script>
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

			$(".update")
					.click(
							function() {
								var targetid = $(this).val();
								var _left = Math
										.ceil((window.screen.width - 500) / 2);
								var _top = Math
										.ceil((window.screen.height - 600) / 2);

								window
										.open(
												'update/' + targetid,
												'식권 정보 수정하기',
												'top='
														+ _top
														+ ', left='
														+ _left
														+ ', width=500, height=600, status=no, menubar=no, toolbar=no, resizable=no');
							}); // update click end
		});
	</script>
</body>
</html>