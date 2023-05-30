<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>Linker</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="/img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;500&family=Roboto:wght@500;700;900&display=swap" rel="stylesheet"> 
	<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@400;700&family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
    
    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="/lib/animate/animate.min.css" rel="stylesheet">
    <link href="/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="/lib/lightbox/css/lightbox.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="/css/style.css" rel="stylesheet"> 
<style>
	.content {
		width: 100%;
	}

	.invenList {
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

	.searchController {
		width: 100%;
		align-self: flex-start;
		border: 1px solid gray;
		padding: 15px;
	}

	.title {
		width: 700px;
		margin-bottom: 30px;
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
	#changeIngredient {
		margin-top: 10px;
	}
</style>
</head>
<body>
<body>
	<div id="page">
	
	<!--     Spinner Start
 -->    <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner-grow text-primary" style="width: 3rem; height: 3rem;" role="status">
            <span class="sr-only">Loading...</span>
        </div>
    </div>
<!--     Spinner End
 -->    
	
 <!-- Navbar Start -->
    <nav class="navbar navbar-expand-lg bg-white navbar-light sticky-top p-0">
        <a href="/" class="navbar-brand d-flex align-items-center px-4 px-lg-5">
            <h2 class="m-0 text-primary">Linker</h2>
        </a>
        <div class="navbar">
        	<c:if test="${ user.userid == null }">
            	<a class="nav-item nav-link" href="/loginform">로그인</a>
               	<a class="nav-item nav-link" href="/signupform">회원가입</a>
             </c:if>
             <c:if test="${ user.userid != null }">
              	<span class="nav-item">${ user.userid } 회원님 환영합니다!</span> 
              	<a class="nav-item nav-link" href="/logout">로그아웃</a>
              </c:if>
        </div>
        <button type="button" class="navbar-toggler me-4" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <div class="navbar-nav ms-auto p-4 p-lg-0">
                <a href="/" class="nav-item nav-link">Home</a>
                <a href="/notice/notice" class="nav-item nav-link">공지사항</a>
                <a href="/inquiry/inquiry" class="nav-item nav-link">문의사항</a>
                <a href="/menu/list" class="nav-item nav-link">식단표</a>
                <a href="/finance/sales" class="nav-item nav-link">매출</a>
                <a href="/finance/expenditure" class="nav-item nav-link">지출</a>
                <a href="/ingredient/ingredientList" class="nav-item nav-link">식자재 관리</a>
                <a href="/profitChart" class="nav-item nav-link">차트</a>
            </div>
        </div>
    </nav>
    <!-- Navbar End -->
    
    <span id="role" style="display: none;">${ user.role }</span>
    
	<div id="fh5co-about" class="fh5co-section">
		<div class="fh5co-cover" style="height: 50px"></div>
		<div class="container">
		<div class="about-text">
		<div class="content">
			<c:if test="${ count != 0 }">
				<table class="invenList" id="invenList">
					<thead>
					<tr>
						<th>식자재명</th>
						<th>수량</th>
						<th>유통기한</th>
						<th>수령일</th>
						<th style="width: 10%;"> </th>
					</tr>
					</thead>
					<tbody>
					<c:forEach items="${ invenList }" var="invenList">
					<tr>
						<td>${ invenList.ingredientname }</td>
						<td>${ invenList.quantity }</td>
						<td>${ invenList.exp }</td>
						<td>${ invenList.receivedate }</td>
						<td><button class="update btn" value="${ invenList.inventoryid }">수정</button></td>
					</tr>
					</c:forEach>
					</tbody>
				</table>
					<input class="btn btn-primary" type="button" id="changeIngredient" value="목록 추가 / 삭제"
					onclick="location.href='change';"/>
				<div class="pageController">
					<c:if test="${ begin > end }">
						<a href="ingredientList?p=${ begin-1 }">[이전]</a>
					</c:if>
					<c:forEach begin="${ begin }" end="${ end }" var="i">
						<a href="ingredientList?p=${ i }">${ i }</a>
					</c:forEach>
					<c:if test="${ end < totalPages }">
						<a href="ingredientList?p=${ end + 1 }">[다음]</a>
					</c:if>
				</div>
				</c:if>
				<c:if test="${ count == 0 }">
					입력된 식자재가 존재하지 않습니다.
						<input class="btn" type="button" id="changeIngredient" value="목록 추가 / 삭제"
						onclick="location.href='change';" style="color: black;"/>
				</c:if>
			</div>	<%-- main > content end --%>
    	</div>
    </div>
   </div>

    <!-- Footer Start -->
    <div class="container-fluid bg-dark text-light footer mt-5 pt-5 wow fadeIn" data-wow-delay="0.1s">
        <div class="container">
            <div class="copyright">
                <div class="row">
                    <div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                        &copy; <a class="border-bottom" href="#">Linker</a>, All Right Reserved.
                    </div>
                    <div class="col-md-6 text-center text-md-end">
                        <!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you'd like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
                        Designed By <a class="border-bottom" href="https://htmlcodex.com">HTML Codex</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Footer End -->
    
    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square rounded-0 back-to-top"><i class="bi bi-arrow-up"></i></a>


    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
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
	$(function(){
		// 권한 가져오기
		var role = $("#role").text();
		
		// 열람 권한이 없다면 페이지 이동.
		if (!(role != 'seller' || role != 'admin')) {
			alert("열람 권한이 없는 페이지입니다.");
			location.href = "/main";
		}
		
		$("#search-name").click(function(){
			
			let name = $("#name").val();
						
			if (!name || name.replace(/\s+/g, "") == "") {
				alert("검색값을 입력해 주세요.");
				$("#name").focus();
				return false;
			}
			
			$("#searchByName").submit();

		});	// search click end

		$("#search-date").click(function(){

			let startDay = $("#startDay").val();
			let endDay = $("#endDay").val();

			if (!startDay || !endDay || endDay < startDay) {
				alert("올바른 날짜값을 입력해 주세요.");
				$("#startDay").focus();
				return false;
			}

			$("#searchByDate").submit();

		});	// search click end
				
	});	// ready end
	
	$(".update").click(function() {
		
		var targetid = $(this).val();
		
	    var _left = Math.ceil(( window.screen.width - 500 )/2);
	    var _top = Math.ceil(( window.screen.height - 600 )/2); 
	    
		window.open('update/' + targetid, '식자재 수정하기', 'top=' + _top + ', left=' + _left + ', width=500, height=600, status=no, menubar=no, toolbar=no, resizable=no');
	});	// update click end
	
</script>
</body>
</html>