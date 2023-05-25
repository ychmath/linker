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
		width: 100%;
	}
	.IngredientList {
		width: 100%;
		border: 1px solid gray;
		border-collapse: collapse;
		margin-top: 30px;
		text-align: center;
		color: white;
		table-layout: fixed;
	}
	th {
		text-align: center;
		border-bottom: 1px solid gray;
	}
	.listController {
		width: 100%;
		align-self: flex-start;
		color: black;
		padding: 20px;
		border: 1px solid gray;
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
		width: 100%;
		align-content: center;
	}
	.button {
		margin-top: 10px;
	}
</style>
</head>
<body>
<body>
	<div class="fh5co-cover" style="height: 200px"></div>
	<div class="fh5co-loader"></div>
	<div id="page">
		<nav class="fh5co-nav" role="navigation">
			<!-- <div class="top-menu"> -->
			<div class="container">
				<div class="row">
					<div class="col-xs-12 text-right menu-1 menu-wrap">
        				<ul>
              				<c:if test="${ user == null }">
                				<li class="login-signup"><a href="/loginform">로그인</a></li>
                				<li class="login-signup"><a href="/joinform">회원가입</a></li>
              				</c:if>
               				<c:if test="${ user != null }">
              					<li class="myinfo">${ user.userid } 회원님 환영합니다!</li>
              					<li class="logout"><a href="/logout">로그아웃</a></li>
              				</c:if>
            			</ul>
					</div>
					</div>

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
							<li><a href="/menu/list">식단표</a></li>
			                <li><a href="/finance/sales">매출</a></li>
                			<li><a href="/finance/expenditure">지출</a></li>
                			<li><a href="/ingredient/main">식자재 관리</a></li>
                			<li><a href="/profitChart">차트</a></li>
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
					<h1><a class="title" href="/ingredient/main">식자재 목록</a></h1>
					<div class="listController">
						<form id="addIngredient" action="" method="get">
							<p style="color: white;"><b>식자재 추가</b></p>
							<span style="color: white;">식자재명:&nbsp; &nbsp;</span><input name="ingredientname">
							<span style="color: white;">단위:&nbsp; &nbsp;</span><input name="unit">
							<span style="color: white;">유통기한:&nbsp; &nbsp;</span><input name="exp"><br>
							<input class="button" type="button" value="식자재 등록">
						</form>
					</div>
				<div class="content">
					<form>
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
								<td><input type="checkbox" name="checkList" id="checkList" value="${ ingredient.ingredientid }"></td>
								<td>${ ingredient.ingredientname }</td>
								<td>${ ingredient.unit }</td>
								<td>${ ingredient.exp }</td>
							</tr>
							</c:forEach>
						</table>
						<div>
							<input type="button" id="delete" class="button" value="선택한 식자재 삭제" style="color: black;"/>
						</div>
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
					</form>
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
		$("#delete").click(function() {
			 
			
			
			
/* 			$("input:checkbox[name='checkList']").each(function(index){
				if($(this).is(":checked") == true){
					var target = $(this).val();
					
					alert("선택된 목록:" + target);
					return false;
/* 					$.ajax({
						url: "/ingredient/delete" + target,
						method: "delete",
						data:{ingredientid:target}
					}).done(function(result){
						alert("삭제가 완료되었습니다.");
						location.replace(result);
					});	// ajax end
					return false; */
				} else {
					alert("선택된 목록이 없습니다.");
					return false;
				}
			});	// each end */

		});
	});
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