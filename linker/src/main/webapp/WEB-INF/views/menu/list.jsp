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
      rel="stylesheet"
    />
    <link
      href="https://fonts.googleapis.com/css?family=Satisfy"
      rel="stylesheet"
    />

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
                <li class="login-signup"><a href="login.html">로그인</a></li>
                <li class="login-signup"><a href="signup.html">회원가입</a></li>
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
                <li class="active"><a href="/menu/list">식단표</a></li>
              </ul>
            </div>
          </div>
        </div>
        <!-- </div> -->
      </nav>

 	<div class="fh5co-cover" style="height: 200px"></div>
      
      <div id="fh5co-about" class="fh5co-section">
 
      <div class="fh5co-cover" style="height: 50px"></div>
   
        <div class="container" style="margin: auto;">
			<h1 style="color: white;">게시글 목록</h1>
		<div align="right">
			<a href="write">새 글 등록</a>
		</div>
		<c:if test="${ count != 0 }">
			<table class="content" style="margin: auto; border: 1px solid white; border-collapse: collapse;">
				<tr>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
				</tr>
				<c:forEach items="${ menuList }" var="menu">
					<tr>
						<td><a href ="content/${ menu.menuID }">${ menu.title }</a></td>
						<td>${ menu.userID }</td>
						<td><fmt:formatDate value="${ menu.creationDate }" dateStyle="short"/></td>
					</tr>
				</c:forEach>
			</table>

			<div style="margin: auto;">
				<c:if test="${ begin > pageNum }">
					<a style="align: center;" href="list?p=${ begin-1 }">[이전]</a>
				</c:if>
				<c:forEach begin="${ begin }" end="${end}" var="i">
					<a href="list?p=${i}">${i}</a>
				</c:forEach>
				<c:if test="${end < totalPages }">
					<a href="list?p=${ end+1 }">[다음]</a>
				</c:if>
			</div>

		</c:if>
		<c:if test="${count == 0 }">
			아직 입력한 글이 없습니다.
		</c:if>
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
  </div>
  
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