<%@ page contentType="text/html; charset=UTF-8"%>
<%-- <<<<<<< HEAD
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- 폼을 쉽게 생성하기 위한 태그 라이브러리를 사용하기 위한 선언문 -->
<!-- form 태그 라이브러리를 사용하여 HTML 폼을 생성하고, 데이터를 전송하는 기능을 제공함 -->
<!-- 폼 필드의 값을 설정하거나 검증하는 등의 기능을 손쉽게 처리할 수 있음 -->

<!DOCTYPE html>
<html>
<head>
<title>로그인</title>
</head>
<body>
	<h5>id와 password를 입력하세요</h5>
	<form:form action="login" method="post" modelAttribute="command">
	<!-- action 속성을 통해 폼 전송 경로 -->
	<!-- method 속성을 통해 전송 방식을 설정할 수 있음 -->
	<!--modelAttribute 속성은 폼 데이터를 바인딩할 모델 객체의 이름을 지정 -->
	<form:errors element="div" />
	<!-- 폼 검증 오류 메시지를 표시하는 태그 -->
	<!-- element 속성을 통해 오류 메시지를 감싸는 HTML요소를 지정할 수 있음 -->
	<!-- <div>요소로 오류 메시지를 감싸게 됨 -->
	
	<table border="1" cellpadding="0" cellspacing="0">
	<!-- cellpadding: 표의 셀과 경계선 사이에 여백을 지정 -->
	<!-- cellspacing: 표의 셀 간의 간격을 지정 -->
		<tr>
			<td>아이디</td>
			<td><input type="text" name="userid" size="10"></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" name="password" size="10"></td>
		</tr>
		 
		 <tr>
		 	<td colspan="2"><input type="submit" value="로그인">
		 	<a href="insert">회원 가입</a></td>
		</tr>
	</table>
	</form:form>
======= --%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<style>
ul {
	display: flex;
	list-style-type: none;
	gap: 15px;
}
</style>
<title>로그인</title>
</head>
<body>
	<form:form action="login" method="post" modelAttribute="command">
		<form:errors path="*" element="div" cssStyle="color: red" />
		<div class="container">
			<div class="screen">
				<div class="screen__content">
					<form class="login">
						<div class="login__field">
							<input type="text" class="login__input" name="userid"
								placeholder="아이디" value="${inputUserId}">
							<div style="color: red;">${useridError}</div>
						</div>
						<div class="login__field">
							<input type="password"
								class="login__input" name="password" placeholder="비밀번호">
							<div style="color: red;">${passwordError}</div>
						</div>
						<button class="submit" type="submit"
							onclick="location.href='main' ">
							<span class="button__text">로그인</span>
						</button>
					</form>

					<ul>
						<li><a href="/joinform">회원가입</a></li>
						<li><a href="">아이디 찾기</a></li>
						<li><a href="">비밀번호 찾기</a></li>
					</ul>
				</div>
			</div>
		</div>
	</form:form>
</body>
</html>