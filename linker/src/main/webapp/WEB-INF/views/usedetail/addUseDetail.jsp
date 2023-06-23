<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
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
<link href="/lib/animate/animate.min.css" rel="stylesheet">
<link href="/lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link href="/lib/lightbox/css/lightbox.min.css" rel="stylesheet">

<!-- Customized Bootstrap Stylesheet -->
<link href="/css/bootstrap.min.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="/css/style.css" rel="stylesheet">
<link href="/css/comm/table.css" rel="stylesheet">

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

	<span id="role" style="display: none;">${ user.role }</span>

	<div class="content-wrapper">
		<p>
			<a href="/inventory/useDetailList">사용 내역</a>
		</p>
		<p>
			<b>사용내역 추가</b>
		</p>
		<div class="UsedetailController">
			<form id="selectIngredient">

				<span>식자재명:&nbsp;</span> <select name="ingredientid"
					id="ingredientid" required>
					<c:forEach items="${ inventoryIngredient }" var="IngredientList">
						<option value="${ IngredientList.ingredientid }">${ IngredientList.ingredientname }</option>
					</c:forEach>
				</select>
				<button class="search_btn" type="button" id="search">검색</button>
			</form>
		</div>
		<form id="addUse" action="/inventory/addUse" method="post">
			<table id="useList">
				<thead>
					<tr>
						<th>&nbsp;</th>
						<th>식자재명</th>
						<th>재고량</th>
						<th>수령일</th>
						<th>사용량</th>
						<th>사용일</th>
					</tr>
				</thead>
				<tbody id="tabledata">
				</tbody>
			</table>
			<div>
				<input type="button" id="write" value="사용 내역 등록" />
			</div>
		</form>

		<%-- main > content end --%>
	</div>
	<!-- container end -->

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
			// 권한 가져오기
			var role = $("#role").text();

			// 열람 권한이 없다면 페이지 이동.
			if (!(role != 'seller' || role != 'admin')) {
				alert("열람 권한이 없는 페이지입니다.");
				location.href = "/main";
			}

			$("#write").on("click", function(event) {
				  event.preventDefault();

				  var isAnyEmpty = false;

				  // input 값 확인
				  $("input[name='inventoryid']:checked").each(function() {
				    var ingredientUsageInput = $(this).closest("tr").find("input[name='ingredientusage']");
				    var ingredientUseDateInput = $(this).closest("tr").find("input[name='usedate']")
				    
				    if (!ingredientUsageInput.prop("disabled") && !ingredientUsageInput.val() || 
				    		!ingredientUseDateInput.prop("disabled") && !ingredientUseDateInput.val()) {
				      isAnyEmpty = true;
				      return false; // input 값에 disabled를 제외하고 비어있는 것이 있다면 false return
				    }

				  });

				  if (isAnyEmpty || !$("input[name='inventoryid']:checked").val()) {
				    // 비어있다면 경고창
				    alert("필수 항목을 전부 입력해 주십시오.");
				  } else if (parseInt($('#ingredientusage').val()) > parseInt($('#ingredientusage').attr('max'))) {
					  alert('사용할 수 있는 최대값을 초과했습니다.');
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
				      tabledata += '<td><input name="ingredientusage" id="ingredientusage" class="ingredientusage" type="number" min="1" max="' + obj.quantity + '" disabled></td>';
				      tabledata += '<td><input name="usedate" id="usedate" type="date" disabled></td>'
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