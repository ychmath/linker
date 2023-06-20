<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Linker</title>
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
<link href="/css/menu/menu_write.css" rel="stylesheet">
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
  <p>식단표 등록</p>
  <div id="fh5co-about" class="fh5co-section">
    <div class="container">
      <form method="post" id="writeform" action="write">
        <table border="1" style="color: black;">
          <tr>
            <td class="orange">제목</td>
            <td><input name="title" style="background-color: inherit;" required /></td>
            <td class="orange">작성자</td>
            <td><input name="userID" style="background-color: inherit; color: black;" value="${user.userid}" readonly></td>
          </tr>
        </table>
        <table border="1" style="color: black;">
          <tr>
            <td class="orange">내용</td>
            <td>
              <!-- 아래 content에 table 내용이 들어갑니다. -->
              <input name="content" id="content" disabled style="display: none;" />
              <div class="panel panel-default" id="table">
                <div class="panel-heading">
                  <b>식단표</b>
                </div>
                <div class="panel-body">
                  <div class="tbl_user_data"></div>
                </div>
              </div>
              <input type="submit" id="save" value="새 식단표 등록" style="margin-left: auto;">
            </td>
          </tr>
        </table>
      </form>
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
	<script>
		$(function() {
			// 권한 가져오기
			var role = $("#role").text();

			// 열람 권한이 없다면 페이지 이동.
			if ((role == 'seller' || role == 'admin')) {
				alert("열람 권한이 없는 페이지입니다.");
				location.href = "/main";
			}

			// ajax row data
			// 테이블에 넣어 둘 기본값을 정한다.
			var ajax_data = [ {
				tname : "조식",
				line1 : "&nbsp",
				line2 : "&nbsp",
				line3 : "&nbsp",
				line4 : "&nbsp",
				line5 : "&nbsp"
			}, {
				tname : "중식",
				line1 : "&nbsp",
				line2 : "&nbsp",
				line3 : "&nbsp",
				line4 : "&nbsp",
				line5 : "&nbsp"
			}, {
				tname : "석식",
				line1 : "&nbsp",
				line2 : "&nbsp",
				line3 : "&nbsp",
				line4 : "&nbsp",
				line5 : "&nbsp"
			} ]

			// create HTML table	
			// create data table > start
			var tbl = ""; // 테이블을 저장할 변수 선언

			tbl += "<table class=\'table table-hover'\ id=\'myTable'\>";

			// 반복문으로 테이블 2개 생성
			for (var i = 0; i < 2; i++) {
				// crate table header > start
				tbl += "<thead>";
				tbl += "<tr>";
				tbl += "<th>시간</th>";
				// 총 5일치가 한 줄이 되므로 <th> 태그 5번 반복
				for (let i = 0; i < 5; i++) {
					tbl += "<th><div class=\'row_data'\ edit_type=\'click'\'>날짜를 입력해 주세요.</div></th>";
				}
				tbl += "</tr>";
				tbl += "</thead>";
				// create table > header > end

				// create table body > start
				tbl += "<tbody>";
				// create table body rows > start
				$
						.each(
								ajax_data,
								function(index, val) {
									// 지정해 둔 배열만큼 열과 행을 만든다.
									tbl += "<tr>";
									tbl += "<td class=\'tname'\><div class=\'row_data'\  col_name=\'tname'\>"
											+ val["tname"] + "</div></td>";
									tbl += "<td><div class=\'row_data'\ edit_type=\'click'\'>"
											+ val["line1"] + "</div></td>";
									tbl += "<td><div class=\'row_data'\ edit_type=\'click'\>"
											+ val["line2"] + "</div></td>";
									tbl += "<td><div class=\'row_data'\ edit_type=\'click'\>"
											+ val["line3"] + "</div></td>";
									tbl += "<td><div class=\'row_data'\ edit_type=\'click'\>"
											+ val["line4"] + "</div></td>";
									tbl += "<td><div class=\'row_data'\ edit_type=\'click'\>"
											+ val["line5"] + "</div></td>";
									tbl += "</tr>";
								});
				// create table body rows > end	
				tbl += "</tbody>";
			}
			// create table body > end
			tbl += "</table>";
			// create data table > end

			// make div editable > start
			// 클래스가 row_data인 경우 click했을 경우 이벤트가 발생한다.
			$(document).on("click", ".row_data", function() {
				// 클릭한 row_data 자식 div 클래스에 contenteditable 속성을 true로 지정
				$(this).closest("div").attr("contenteditable", "true");
				// add bg css
				$(this).addClass("bg-warning").css("padding", "5px");

				$(this).focus();

			});
			// make div editable > end

			// 테이블 객체를 tbl_user_data 위치에 html 전달
			$(document).find(".tbl_user_data").html(tbl);

			$("#save").click(function(event) {
				// 클릭했을 경우 바로 submit하지 않고 정지
				event.preventDefault();

				// 수정 가능 여부, css 여부 삭제
				$("div").removeClass("bg-warning");
				$("div").removeAttr("contenteditable");

				// 전송할 content에 수정된 table의 html을 가져온다.
				$("#content").val(table.outerHTML);
				// disabled였던 content를 false로 바꾸면서 전송 가능하도록 한다.
				$("#content").attr("disabled", false);

				// 폼 submit
				$("#writeform").submit();

			});

		}); // ready end
	</script>
</body>
</html>