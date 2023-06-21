<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Linker</title>
<style>
.content {
	width: 100%;
	align-self: center;
	align-content: stretch;
}

.menu {
	width: 100%;
	border: 1px solid gray;
	border-collapse: collapse;
	margin-top: 30px;
}

.write {
	width: 100%;
	align-self: flex-end;
	text-align: right;
}

.menu {
	border-bottom: 1px solid gray;
}

.title {
	width: 700px;
	color: white;
	margin-top: 30px;
}

.pageController {
	width: 100%;
	text-align: center;
}

#myTable {
	width: 100%;
	table-layout: fixed;
}
</style>
</head>
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
	
	<div class="fh5co-cover" style="height: 200px"></div>
	<div class="fh5co-loader"></div>
	<div id="page">
		<nav class="fh5co-nav" role="navigation">
			<!-- <div class="top-menu"> -->
			<div class="container">
				<div class="row">
					<div class="col-xs-12 text-right menu-1 menu-wrap">
						<span id="role" style="display: none;">${ user.role }</span>
						<ul class="userStatus">
							<c:if test="${ user.userid == null }">
								<li class="login"><a href="/loginform">로그인</a></li>
								<li class="signup"><a href="/joinform">회원가입</a></li>
							</c:if>
							<c:if test="${ user != null }">
								<li class="myinfo">
								<span id="userid">${ user.userid }</span>
									회원님 환영합니다!</li>
								<li class="logout"><a href="/logout">로그아웃</a></li>
							</c:if>
						</ul>
					</div>
					<%-- menu wrap end --%>
				</div>
				<%-- row end --%>

				<div class="row">
					<div class="col-xs-12 text-center logo-wrap">
						<div id="fh5co-logo">
							<a href="/main">Linker<span>.</span></a>
						</div>
					</div>

					<div class="col-xs-12 text-left menu-1 menu-wrap">
						<ul>
							<li><a href="/main">홈</a></li>
							<li><a href="/notice/notice">공지사항</a></li>
							<li><a href="/inquiry/inquiry">문의사항</a></li>
							<li class="active"><a href="/menu/list">식단표</a></li>
							<c:if test="${ user.role == 'seller' }">
								<li><a href="/finance/sales">매출</a></li>
								<li><a href="/finance/expenditure">지출</a></li>
								<li><a href="/ingredient/ingredientList">식자재 관리</a></li>
								<li><a href="/profitChart">차트</a></li>
							</c:if>
						</ul>
					</div>
					<%-- menu wrap end --%>
				</div>
				<%-- row end --%>
			</div>
			<!-- </div> -->
		</nav>

		<div id="fh5co-slider" class="fh5co-section animate-box">
			<div class="fh5co-cover" style="height: 200px"></div>

			<div class="main">
				<div class="container">
					<div class="content">
						<form method="post" id="updateform"
							action="/menu/update/${ dto.menuID }">
							<input type="hidden" name="_method" value="put" />
							<table border="1" style="color: black;">
								<tr>
									<td class="orange">제목</td>
									<td><input name="title" style="background-color: inherit;"
										value="${ dto.title }" /></td>
								</tr>
								<tr>
									<td class="orange">작성자</td>
									<td><input id="userID" name="userID"
										style="background-color: inherit;" value="${ dto.userID }"
										readonly></td>
								</tr>
								<tr>
									<td class="orange">내용</td>
									<td>
										<!-- 아래 content input 태그에 html 코드가 들어갑니다. --> <input
										name="content" id="content" disabled style="display: none;" />
										${ dto.content }
									</td>
								</tr>
								<tr>
									<td colspan="2" align="center"><input type="button"
										id="save" value="글 수정 완료" style="margin-left: auto;">
									</td>
								</tr>
							</table>
						</form>
					</div>
					<%-- main > content end --%>
				</div>
				<%-- main > container end --%>
			</div>
			<%-- main end --%>

			<footer id="fh5co-footer" role="contentinfo" class="fh5co-section">
				<div class="container">
					<div class="row copyright">
						<div class="col-md-12 text-center">
							<p>
								<small class="block">&copy; 2023 Soldesk Project. All
									Rights Reserved.</small> <small class="block">Designed by <a
									href="http://freehtml5.co/" target="_blank">Linker</a>
								</small>
							</p>
						</div>
					</div>
				</div>
			</footer>
		</div>
		<%-- footer > container end --%>
	</div>
	<%-- page end --%>

	<div class="gototop js-top">
		<a href="#" class="js-gotop"><i class="icon-arrow-up22"></i></a>
	</div>

	<!--  스크립트 수정 X!!! -->
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script>
		$(function() {
			// 권한 가져오기
			var role = $("#role").text();

			// 열람 권한이 없다면 페이지 이동.
			if (!(role == 'seller' || role == 'admin')) {
				alert("열람 권한이 없는 페이지입니다.");
				location.href = "/main";
			}

			var writer = $("#userID");

			if (writer != $("#userid").val()) {
				alert("수정 권한이 없습니다.");
				location.href = "/main";
			}

			// make div editable > start
			$(document).on("click", ".row_data", function() {
				// 기존 table html 코드에 클릭하면 수정할 수 있는 기능 추가
				// make div editable
				$(this).closest("div").attr("contenteditable", "true");
				// add bg css
				$(this).addClass("bg-warning").css("padding", "5px");

				$(this).focus();

			});//on 
			// make div editable > end

			$("#save").click(function(event) {
				// 바로 submit하지 않도록 설정
				event.preventDefault();

				if(!$('#title').val() || !$('#title').val().trim()){
					alert('제목을 입력해 주세요.')
				} else {
					// 수정 가능 여부 / css 삭제
					$("div").removeClass("bg-warning");
					$("div").removeAttr("contenteditable");

					// content에 table html 코드 저장
					$("#content").val(table.outerHTML);
					// content의 disabled를 false로 넣어 전송 가능하게 변경
					$("#content").attr("disabled", false);

					// 전송
					$("#updateform").submit();
				}

			});//click

		}); // ready end
	</script>
</body>
</html>