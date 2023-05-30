<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
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

	.IngredientList {
		width: 100%;
		border: 1px solid gray;
		border-collapse: collapse;
		margin-top: 30px;
		text-align: center;
		table-layout: fixed;
	}

	th {
		text-align: center;
		border-bottom: 1px solid gray;
	}

	.listController {
		width: 100%;
		align-self: flex-start;
		padding: 10px;
		border: 1px solid gray;
	}

	.pageController {
		width: 500px;
		margin-left: auto;
		margin-right: auto;
		text-align: center;
	}
	
	.button {
		margin-top: 10px;
	}
	
	.title {
		width: 700px;
		margin-bottom: 30px;
	}
	
	.check {
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
                <a href="/ingredient/ingredientList" class="nav-item nav-link active">식자재 관리</a>
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
					<h1 class="title"><a href="/ingredient/ingredientList">식자재 목록</a></h1>
					<div class="listController">
						<p><b>식자재 추가</b></p>
						<form id="addIngredient" action="/ingredient/insert" method="post">
							<span>식자재명:&nbsp;</span><input name="ingredientname" required>&nbsp;
							<span>단위:&nbsp;</span>
								<select name="unit" required>
									<option value="KG">KG</option>
									<option value="G">G</option>
									<option value="LB">LB</option>
									<option value="OZ">OZ</option>
								</select>&nbsp;
							<span>유통기한:&nbsp;</span><input name="exp" type="date" required><br>
						<div>
							<input type="button" id="add" class="button btn btn-primary" value="식자재 등록"/>
						</div>
						</form>
					</div>
				<div class="content">
					<form id="deleteIngredient">
					<c:if test="${ count != 0 }">
						<table class="IngredientList" id="IngredientList">
							<tr>
								<th style="width: 5%;"></th>
								<th>식자재명</th>
								<th>단위</th>
								<th>유통기한</th>
							</tr>
							<c:forEach items="${ ingredientList }" var="ingredient">
							<tr class="ingredientlist">
								<td><input class="check" type="checkbox" name="checkList" class="checkList" value="${ ingredient.ingredientid }"></td>
								<td>${ ingredient.ingredientname }</td>
								<td>${ ingredient.unit }</td>
								<td>${ ingredient.exp }</td>
							</tr>
							</c:forEach>
						</table>
						<div>
							<input type="button" id="delete" class="button btn btn-primary" value="선택한 식자재 삭제"/>
						</div>
						<div class="pageController">
							<c:if test="${ begin > end }">
								<a href="change?p=${ begin-1 }">[이전]</a>
							</c:if>
							<c:forEach begin="${ begin }" end="${ end }" var="i">
								<a href="change?p=${ i }">${ i }</a>
							</c:forEach>
							<c:if test="${ end < totalPages }">
								<a href="change?p=${ end + 1 }">[다음]</a>
							</c:if>
						</div>
					</c:if>
					</form>
					</div>	<%-- main > content end --%>
				</div>	<%-- main > container end --%>
			</div>	<%-- main end --%>
    </div> <!-- about end -->
    
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
	</div>	<%-- page end --%>
	
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
	$(function() {
		// 권한 가져오기
		var role = $("#role").text();
		
		// 열람 권한이 없다면 페이지 이동.
		if (!(role != 'seller' || role != 'admin')) {
			alert("열람 권한이 없는 페이지입니다.");
			location.href = "/main";
		}

		$("#delete").on("click", function(){
			// 체크박스에 체크된 식자재 id 번호 값 찾기
			$(".checkList:checked").each(function(i, item) {
				// target에 id값 저장
				var target = item.value;
				
				$.ajax({
					url: "/ingredient/delete/" + target,
					method: "delete",
					data:{'ingredientid':target}
				}).done(function(result){
					
				});				
			});	// each end
			
			alert("삭제가 완료되었습니다.");
			location.replace("/ingredient/change");
		});
		
		$("#add").on("click", function(event) {
			// 바로 전송 차단
			event.preventDefault;
			
			// 하나라도 값이 입력되지 않은 경우
			if (!$("input[name='ingredientname']").val() || !$("select[name='unit']").val() || !$("input[name='exp']").val()){
				// submit 하지 않고 alert 출력
				alert("필수 항목을 전부 입력해 주십시오.");
			} else {
				// 전부 입력했다면 submit
				alert("등록이 완료되었습니다.");
				$("#addIngredient").submit();
			}
		});
	});
</script>
</body>
</html>