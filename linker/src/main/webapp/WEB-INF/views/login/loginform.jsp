<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Sign in</title>
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
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
<link rel="stylesheet" href="/css/login.css">


<style>
/* 스타일을 설정할 'signin-id' 아이디 요소입니다. */
#signin-id {
	width: 300px; /* 너비를 300px로 설정 */
	height: 50px; /* 높이를 50px로 설정 */
	border: none; /* 테두리를 없앱니다 */
	border-bottom: 3px solid black; /* 하단 테두리를 3px 길이의 검정색 실선으로 설정 */
}

/* 스타일을 설정할 'signin-pw' 비밀번호 요소입니다. */
#signin-pw {
	width: 300px; /* 너비를 300px로 설정 */
	height: 50px; /* 높이를 50px로 설정 */
	border: none; /* 테두리를 없앱니다 */
	border-bottom: 3px solid black; /* 하단 테두리를 3px 길이의 검정색 실선으로 설정 */
}
}
</style>

</head>

<body>
	<!-- 스프링 폼 시작 -->
	<form:form action="login" method="post" modelAttribute="command">
		<!-- 폼 에러 출력 -->
		<form:errors path="*" element="div" cssStyle="color: red" />
		<div class="container">
			<div class="content">
				<!-- HEADER -->
				<header>
					<h2 style="color: #ffffff">로그인</h2>
				</header>

				<!-- INPUT -->
				<section>
					<div class="login__field">
						<input type="text" id="signin-id" class="login__input"
							name="userid" value="${inputUserId}" placeholder="아이디">

						<div style="color: red;">${useridError}</div>
					</div>
					<div class="login__field">
						<input type="password" class="login__input" id="signin-pw"
							name="password" placeholder="비밀번호">
						<div style="color: red;">${passwordError}</div>
					</div>
				</section>
				<button class="submit" id="signin" type="submit"
					onclick="location.href='main' ">
					<span class="button__text" style="color: white;">로그인</span>
				</button>
				<div id="link-menu" >
					<a href="/find-id" style="color: #ffffff">아이디 찾기 </a> 
					<a href="/findpw" style="color: #ffffff">비밀번호 찾기 </a>
					 <a	href="/joinform" style="color: #ffffff">회원가입 </a>
				</div>
			</div>
		</div>
	</form:form>
</body>

</html>