<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>

<head>
<title>문의사항</title>
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
				<c:if test="${ user.role == null }">
					<a href="/" class="nav-item nav-link ">Home</a>
					<a href="/notice/notice" class="nav-item nav-link">공지사항</a>
					<a href="/inquiry/inquiry" class="nav-item nav-link active">문의사항</a>
					<a href="/menu/list" class="nav-item nav-link">식단표</a>
					<a href="/loginform" class="nav-item nav-link">로그인</a>
					<a href="/joinform" class="nav-item nav-link">회원가입</a>
				</c:if>
				<c:if test="${ user.role == 'admin' }">
					<a href="/" class="nav-item nav-link ">Home</a>
					<a href="/notice/notice" class="nav-item nav-link">공지사항</a>
					<a href="/inquiry/inquiry" class="nav-item nav-link active">문의사항</a>
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
					<a href="/" class="nav-item nav-link ">Home</a>
					<a href="/notice/notice" class="nav-item nav-link">공지사항</a>
					<a href="/inquiry/inquiry" class="nav-item nav-link active">문의사항</a>
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
		<p>
			<strong>문의사항</strong>
		</p>
		<c:if test="${count > 0 }">
			<table>
				<tr>
					<th>게시글 번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
				</tr>

				<!-- count 값이 0보다 클 경우에만 아래 내용이 실행됩니다. -->

				<c:forEach items="${iList }" var="inquiry">
					<!-- forEach 루프를 사용하여 iList에 있는 아이템들을 반복합니다. -->

					<tr>
						<td><c:out value="${start}" /> <!-- 'start' 변수 값을 현재 셀에 출력하기 위한 태그입니다. -->

							<c:set var="start" value="${start+1 }" /> <!-- 'start' 변수 값을 1 증가시키기 위한 태그입니다. -->
						</td>

						<td><a href="content/${inquiry.inquirypostid }"> <c:if
									test="${inquiry.relevel > 0 }">
									<!-- 답변글이 있는 경우(relevel 값이 0보다 클 경우), 다음 내용을 실행합니다. -->

									<span class="icon"> <!-- relevel 값에 10을 곱한 결과에 따라 이미지의 너비를 조절합니다. -->
										<i class="bi bi-arrow-return-right"
										width="${inquiry.relevel * 10}" alt="답변" /></i>
									</span>
								</c:if> ${inquiry.title } <c:if test="${inquiry.readcount >= 20 }">
									<!-- 조회수(readcount)가 20 이상인 경우 다음 내용을 실행합니다. -->

									<span class="icon"> <img src="/img/hot.gif" alt="인기글" />
										<!-- 인기글을 나타내는 'hot' 이미지를 표시합니다. -->
									</span>
								</c:if>
						</a></td>

						<!-- 글 작성자의 ID를 출력합니다. -->
						<td>${inquiry.userid }</td>

						<!-- 글 생성일을 출력합니다. -->
						<td><fmt:formatDate value="${inquiry.creationdate }"
								dateStyle="short" /></td>
					</tr>

				</c:forEach>
			</table>
		</c:if>
		<div id="center">
			<c:if test="${count == 0 }"> 아직 입력한 글이 없습니다. </c:if>
		</div>
		<c:if test="${ user.role == 'buyer'}">
			<input type="button" id="write" value="글쓰기"
				onclick="location.href='write'" />
		</c:if>
	</div>

	<div id="page">
		<c:if test="${count != 0}">
			<c:if test="${begin > pageNum}">
				<a href="inquiry?p=${begin-1 }">[이전]</a>
			</c:if>
			<c:forEach begin="${begin }" end="${end }" var="i">
				<a href="inquiry?p=${i }">${i }</a>
			</c:forEach>
			<c:if test="${end < totalPages }">
				<a href="inquiry?p=${end+1 }">[다음]</a>
			</c:if>
		</c:if>
	</div>

	<div id="search">
		<form action="search">
			<select name="searchn" id="searchn">
				<option value="0">제목</option>
				<option value="1">작성자</option>
			</select> <input type="text" id="search_text" name="search" size="15"
				maxlength="40" /> <input type="submit" id="search_btn"
				name="search_btn" value="검색" />
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

	<script src="/js/main.js"></script>
</body>

</html>
