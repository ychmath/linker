<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<div class="fh5co-loader"></div>
<div id="page">
	<nav class="fh5co-nav" role="navigation">
        <!-- <div class="top-menu"> -->
    	<div class="container">
    	 <div class="col-xs-12 text-right menu-1 menu-wrap">
            <ul>
              <c:if test="${user == null}">
                <li class="login-signup"><a href="/login.html">로그인</a></li>
                <li class="login-signup"><a href="/signup.html">회원가입</a></li>
              </c:if>
            </ul>
         </div>
         <div class="row">
            <div class="col-xs-12 text-center logo-wrap">
              <div id="fh5co-logo">
                <a href="/index.html">Linker<span>.</span></a>
        	  </div>
            </div>

            <div class="col-xs-12 text-left menu-1 menu-wrap">
              <ul>
                <li><a href="/index.html">홈</a></li>
                <li><a href="notice.html">공지사항</a></li>
                <li><a href="inquiry.html">문의사항</a></li>
                <li><a href="/menu/list">식단표</a></li>
              </ul>
            </div>
          </div>
        </div>
        <!-- </div> -->
      </nav>

 	<div class="fh5co-cover" style="height: 200px"></div>
      
      <div id="fh5co-about" class="fh5co-section">
 
      <div class="fh5co-cover" style="height: 50px"></div>
   
        <div class="container">
		<div>
			<table border="1">
				<tr>
					<td>제목</td>
					<td>${ dto.title }</td>
				</tr>
				<tr>
					<td>작성자</td>
					<td>${ dto.userID }</td>
				</tr>
				<tr>
					<td>내용</td>
					<td>${ dto.content }</td>
				</tr>
				<tr>
					<td>등록일</td>
					<td><fmt:formatDate value="${ dto.creationDate }" dateStyle="long"/></td>
				</tr>
				<tr>
					<td colspan="2" align="right">
						<a href="/menu/update/${ dto.menuID }">글 수정</a>
						<a id="delete" href="/menu/delete/${ dto.menuID }">글 삭제</a>
						<a href="../list">목록 이동</a> 
					</td>
				</tr>
			</table>
    	</div>
    </div>

      <footer id="fh5co-footer" role="contentinfo" class="fh5co-section">
        <div class="container">
          <div class="row copyright">
            <div class="col-md-12 text-center">
              <p>
                <small class="block"
                  >&copy; 2023 Soldesk Project. All Rights Reserved.</small>
                <small class="block"
                  >Designed by
                  <a href="index.html" target="_blank">Linker</a></small
                >
              </p>
            </div>
          </div>
        </div>
      </footer>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(function(){
		$("#delete").click(function(){
			var menuID = ${ dto.menuID };
			
			$.ajax({
				url: "/menu/delete/" + ${ dto.menuID },
				method: "delete",
				data:{menuID:menuID}
			}).done(function(result){
				alert("삭제가 완료되었습니다.");
				location.replace(result);
			});
			return false;
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
</div>
</body>
</html>