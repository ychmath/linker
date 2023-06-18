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
			<a href="/" class="navbar-brand d-flex align-items-center px-4 px-lg-5">
				<h2 class="m-0 text-primary">Linker</h2>
			</a>
			<button type="button" class="navbar-toggler me-4" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
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
							<div class="nav-link dropdown-toggle active" data-bs-toggle="dropdown">
								식자재 관리
							</div>
							<div class="dropdown-menu fade-up m-0">
								<a href="/ingredient/ingredientList" class="dropdown-item">식자재 목록</a> 
								<a href="/inventory/inventoryList" class="dropdown-item">재고현황</a>
								<a href="/inventory/orderList" class="dropdown-item">발주내역</a> 
								<a href="/inventory/useDetailList" class="dropdown-item active">사용내역</a>
							</div>
						</div>
						<div class="nav-item dropdown">
							<div class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
								비용관리
							</div>
							<div class="dropdown-menu fade-up m-0">
								<a href="/profitChart" class="dropdown-item">요약</a>
								<a href="/finance/sales" class="dropdown-item">매출내역</a>
								<a href="/finance/expenditure" class="dropdown-item">지출내역</a>
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
						<a href="/inventory/useDetailList">사용 내역</a>
					</h1>
					<div class="UsedetailController">
						<form id="selectIngredient">
							<p>
								<b>사용내역 추가</b>
							</p>
							<span>식자재명:&nbsp;</span>
							<select name="ingredientid" id="ingredientid" required>
								<c:forEach items="${ inventoryIngredient }" var="IngredientList">
									<option value="${ IngredientList.ingredientid }">${ IngredientList.ingredientname }</option>
								</c:forEach>
							</select>
							<button class="btn" type="button" id="search">검색</button>
						</form>
						<form id="addUse" action="/inventory/addUse" method="post">
							<table id="useList">
								<thead>
									<tr>
										<th>
											&nbsp;
										</th>
										<th>
											식자재명
										</th>
										<th>
											재고량
										</th>
										<th>
											수령일
										</th>
										<th>
											사용량
										</th>
										<th>
											사용일
										</th>
									</tr>
								</thead>
								<tbody id="tabledata">
								</tbody>
							</table>
							<div>
								<input type="button" id="add" class="button btn btn-primary" value="식자재 등록" />
							</div>
						</form>
					</div>
					<%-- main > content end --%>
				</div>
			</div> <!-- container end -->
		</div>

		<!-- Footer Start -->
		<div
			class="container-fluid bg-dark text-light footer mt-5 pt-5 wow fadeIn"
			data-wow-delay="0.1s">
			<div class="container">
				<div class="copyright">
					<div class="row">
						<div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
							&copy; <a class="border-bottom" href="#">Linker</a>, All Right Reserved.
						</div>
						<div class="col-md-6 text-center text-md-end">
							<!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you'd like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
							Designed By
							<a class="border-bottom" href="https://htmlcodex.com">HTML Codex</a>
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

		<!-- JavaScript Libraries -->
	<div>
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

			$("#add").on("click", function(event) {
				  event.preventDefault();

				  var isAnyEmpty = false;

				  // input 값 확인
				  $("input[name='inventoryid']:checked").each(function() {
				    var ingredientUsageInput = $(this).closest("tr").find("input[name='ingredientusage']");
				    
				    if (!ingredientUsageInput.prop("disabled") && !ingredientUsageInput.val()) {
				      isAnyEmpty = true;
				      return false; // input 값에 disabled를 제외하고 비어있는 것이 있다면 false return
				    }

				  });

				  if (isAnyEmpty) {
				    // 비어있다면 경고창
				    alert("필수 항목을 전부 입력해 주십시오.");
				  } else {
				    // 비어있지 않다면 전송
				    alert("등록이 완료되었습니다.");
				    $("#addUse").submit();
				  }
				});
			
			$("#search").click(function(){
				  $('#tabledata').empty();
				  
				  $.getJSON("/inventory/getInvenIngredient", { ingredientid : $('#ingredientid').val() }, function(data){
				   
					  var tabledata = "";	// 테이블 데이터를 저장할 변수

				    $.each(data, function(index, obj){
				    	
				      tabledata += "<tr>";
				      tabledata += '<td><input type="radio" name="inventoryid" value="' + obj.inventoryid + '"></td>';
				      tabledata += '<td>' + obj.ingredientname + '</td>';
				      tabledata += '<td>' + obj.quantity + '</td>';
				      tabledata += '<td>' + obj.receivedate + '</td>';
				      tabledata += '<td><input name="ingredientusage" class="ingredientusage" type="number" min="1" max="' + obj.quantity + '" disabled></td>';
				      tabledata += '<td><input name="usedate" type="date" disabled></td>'
				      tabledata += '</tr>';

				    });
					  
				    $('#tabledata').append(tabledata);
				    
				  });
				  
				});	// click end

			$(document).on('change', 'input[name="inventoryid"]', function() {
				  var selectedValue = $('input[name="inventoryid"]:checked').val();
				  
				  $('input[name="usedate"]').prop('disabled', true);
				  $('input[name="ingredientusage"]').prop('disabled', true);
				  
				  if (selectedValue !== 'select') {
					  // 라디오박스로 선택되었다면 사용 수량과 날짜 입력 가능
				    $(this).closest('tr').find('input[name="ingredientusage"]').prop('disabled', false);
				    $(this).closest('tr').find('input[name="usedate"]').prop('disabled', false); 
				  }
				});
		}); // ready end
	</script>
</body>
</html>