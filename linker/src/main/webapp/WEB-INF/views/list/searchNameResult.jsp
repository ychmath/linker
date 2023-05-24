<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>Linker</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />

<link
	href="https://fonts.googleapis.com/css?family=Cormorant+Garamond:300,300i,400,400i,500,600i,700"
	rel="stylesheet" />
<link href="https://fonts.googleapis.com/css?family=Satisfy"
	rel="stylesheet" />

<!-- Animate.css -->
<link rel="stylesheet" href="/css/animate.css" />
<!-- Icomoon Icon Fonts-->
<link rel="stylesheet" href="/css/icomoon.css" />
<!-- Bootstrap  -->
<link rel="stylesheet" href="/css/bootstrap.css" />
<!-- Flexslider  -->
<link rel="stylesheet" href="/css/flexslider.css" />
<!-- Theme style  -->
<link rel="stylesheet" href="/css/style.css" />

<!-- Modernizr JS -->
<script src="/js/modernizr-2.6.2.min.js"></script>
<!-- FOR IE9 below -->
<!--[if lt IE 9]>
      <script src="js/respond.min.js"></script>
    <![endif]-->
<style>
	.content {
		width: 700px;
		margin-left: auto;
		margin-right: auto;
	}
	.IngredientList {
		width: 1000px;
		margin-left: auto;
		margin-right: auto;
		border: 1px solid gray;
		border-collapse: collapse;
		margin-top: 30px;
		text-align: center;
		color: white;
	}
	th {
		text-align: center;
		border-bottom: 1px solid gray;
	}
	.searchController {
		width: 700px;
		margin-left: 100px;
		color: black;
	}
	.title {
		width: 700px;
		color: white;
		margin-top: 30px;
	}
	.pageController {
		width: 500px;
		margin-left: auto;
		margin-right: auto;
		text-align: center;
	}
	.content {
		width: 1500px;
		margin-left: auto;
		margin-right: auto;
		align-content: center;
	}
</style>
<script>
      function checkLoginStatus() {
        const isLoggedIn = false;

        const loginSignupButtons = document.querySelectorAll(
          ".login-signup"
        );
        if (!isLoggedIn) {
          loginSignupButtons.forEach((button) => {
            button.style.display = "block";
          });
        } else {
          loginSignupButtons.forEach((button) => {
            button.style.display = "none";
          });
        }
      }
    </script>
</head>
<body>
<body onload="checkLoginStatus()">
	<div class="fh5co-loader"></div>
	<div id="page">
		<nav class="fh5co-nav" role="navigation">
			<!-- <div class="top-menu"> -->
			<div class="container">
				<div class="row">
					<div class="col-xs-12 text-right menu-1 menu-wrap">
						<ul>
							<li><a href="/loginform">로그인</a></li>
							<li><a href="/joinform">회원가입</a></li>
						</ul>
					</div>
				</div>

				<div class="row">
					<div class="col-xs-12 text-center logo-wrap">
						<div id="fh5co-logo">
							<a href="/index.html">Linker<span>.</span></a>
						</div>
					</div>

					<div class="col-xs-12 text-left menu-1 menu-wrap">
						<ul>
							<li class="active"><a href="index.html">홈</a></li>
							<li><a href="/notice.html">공지사항</a></li>
							<li><a href="/inquiry.html">문의사항</a></li>
							<li><a href="/menu/list">식단표</a></li>
							<li><a href="/main">테스트</a>
						</ul>
					</div>
				</div>
			</div>
			<!-- </div> -->
		</nav>

		<div id="fh5co-slider" class="fh5co-section animate-box">
			<div class="fh5co-cover" style="height: 200px"></div>
			<div class="main">
				<div class="container">
					<div class="searchController">
						<h1><a class="title" href="/ingredient/main">식자재 목록</a></h1>
						<form id="searchByName" action="/ingredient/searchbyname/result" method="get"
						 style="display: inline-block;">
							<p style="color: white;"><b>이름별 검색</b></p>
							<input type="search" name="name" id="name">
							<input type="button" id="search-name" value="검색">
						</form>
						<form id="searchByDate" action="/ingredient/searchbydate/result" method="get"
						 style="display: inline-block;">
							<p style="color: white;"><b>유통기한별 검색</b></p>
							<input type="date" class="exp" name="startDay" id="startDay"> - <input type="date" class="exp" name="endDay" id="endDay">
							<input type="button" id="search-date" value="검색">
						</form>
					</div>
				<div class="container">
					<h4 class="title">'<%= request.getParameter("name") %>'에 대한 검색 결과입니다.</h4></div>
					<c:if test="${ count != 0 }">
						<table class="IngredientList">
							<tr>
								<th>식자재명</th>
								<th>단위</th>
								<th>유통기한</th>
							</tr>
							<c:forEach items="${ nameSearchResult }" var="result">
							<tr>
								<td>${ result.ingredientname }</td>
								<td>${ result.unit }</td>
								<td>${ result.exp }</td>
							</tr>
							</c:forEach>
						</table>
						<div class="pageController">
							<c:if test="${ begin > end }">
								<a href="searchNameResult?p=${ begin-1 }">[이전]</a>
							</c:if>
							<c:forEach begin="${ begin }" end="${ end }" var="i">
								<a href="searchNameResult?p=${ i }">${ i }</a>
							</c:forEach>
							<c:if test="${ end < totalPages }">
								<a href="searchNameResult?p=${ end + 1 }">[다음]</a>
							</c:if>
						</div>
					</c:if>
					<c:if test="${ count == 0 }">
						해당 식자재가 존재하지 않습니다.
					</c:if>
				</div>	<%-- main > content end --%>
				</div>	<%-- main > container end --%>
			</div>	<%-- main end --%>

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
			</div>	<%-- footer > container end --%>
	</div>	<%-- page end --%>

	<div class="gototop js-top">
		<a href="#" class="js-gotop"><i class="icon-arrow-up22"></i></a>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(function(){
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
</script>
	

	<!-- jQuery -->
	<script src="/js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="/js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="/js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="/js/jquery.waypoints.min.js"></script>
	<!-- Waypoints -->
	<script src="/js/jquery.stellar.min.js"></script>
	<!-- Flexslider -->
	<script src="/js/jquery.flexslider-min.js"></script>
	<!-- Main -->
	<script src="/js/main.js"></script>
	

</body>
</html>