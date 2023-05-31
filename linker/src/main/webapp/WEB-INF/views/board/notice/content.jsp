<%@ page contentType="text/html; charset=UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
  <head>
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
 <link href="/css/user/content.css" rel="stylesheet">
 <link rel="stylesheet" type="text/css" href="/css/user/notice.css">
    <title>글 상세보기</title>
    <style>
      table {
        width: 100%;
      }
    </style>
  </head>
  <body>
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
					<div class="nav-item dropdown">
						<div class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Pages</div>
						<div class="dropdown-menu fade-up m-0">
							<a href="feature.html" class="dropdown-item">Feature</a> <a
								href="quote.html" class="dropdown-item">Free Quote</a> <a
								href="team.html" class="dropdown-item">Our Team</a> <a
								href="testimonial.html" class="dropdown-item">Testimonial</a> <a
								href="404.html" class="dropdown-item">404 Page</a>
						</div>
					</div>
					<span class="nav-item nav-link">${user.userid} 관리자님 환영합니다.</span>
					<a href="logout" class="nav-item nav-link">로그아웃</a>
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
							<a href="/" class="dropdown-item">재고현황</a> 
							<a href="/" class="dropdown-item">발주내역</a> 
							<a href="/" class="dropdown-item">사용내역</a>
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
					<a href="logout" class="nav-item nav-link">로그아웃</a>
				</c:if>
				<c:if test="${ user.role == 'buyer' }">
					<a href="/" class="nav-item nav-link active">Home</a>
					<a href="/notice/notice" class="nav-item nav-link">공지사항</a>
					<a href="/inquiry/inquiry" class="nav-item nav-link">문의사항</a>
					<a href="/menu/list" class="nav-item nav-link">식단표</a>
					<a href="/menu/list" class="nav-item nav-link">식권 구매</a>
					<div class="nav-item dropdown">
						<div class="nav-link dropdown-toggle" data-bs-toggle="dropdown">나의 정보</div>
						<div class="dropdown-menu fade-up m-0">
							<a href="/ticketorder/ticket" class="dropdown-item">식권 구매내역</a> 
							<a href="/ticketuse/ticket" class="dropdown-item">식권 사용내역</a>
							<a href="/updateform" class="dropdown-item">회원정보 수정</a> 
							<a href="/deleteform" class="dropdown-item">회원탈퇴</a>
						</div>
					</div>
					<span class="nav-item nav-link">${user.userid} 구매자님 환영합니다.</span>
					<a href="logout" class="nav-item nav-link">로그아웃</a>
				</c:if>
			</div>
		</div>
	</nav>
  <div id="container">
    <div class="card">
      <div class="card-view">
        <div class="title">
         <h3> ${dto.title}</h3>
        </div>
        <div class="myinfo">
          <dl>
            <dt>작성자</dt>
            <dd>${dto.userid}</dd>
          </dl>
          <dl>
            <dt>작성일</dt>
            <dd>
              <fmt:formatDate value="${dto.creationdate }" />
            </dd>
          </dl>
        </div>
        <div class="cont">
          ${dto.content }
        </div>
      </div>
      <div class="btn-view">
        <c:if test="${user.userid == dto.userid }">
          <a href="/notice/update/${dto.noticepostid}">수정</a>
          <a id="${dto.inquirypostid }" href="#">삭제</a>
        </c:if>      <a href="../notice">목록 이동</a>
      </div>
    </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
      $(function () {
        $("a[id]").click(function () {
          // a[id]: a 태그 중에서 'id' 속성을 가진 모든 요소들을 선택하는 것을 의미
          let no = $(this).attr("id"); //삭제하려는 글번호. attr(): 선택된 요소의 속성 값을 가져오거나 설정하는 메소드
          $.ajax({
            url: "/notice/delete",
            data: "noticepostid=" + no,
            method: "delete",
          }).done(function () {
            location.href = "/notice/notice";
          });
          return false; //하이퍼링크 이동 x
        }); //click
      });
    </script>
  </body>
</html>
