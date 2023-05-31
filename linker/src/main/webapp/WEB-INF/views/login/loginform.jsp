<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">

<head>
<title>로그인</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>

body {
	background-image: linear-gradient(120deg, #f6d365 0%, #fda085 100%);
	display: flex;
	align-items: center;
	justify-content: center;
	height: 100vh;
	margin: 0;
}

.container {
	width: 400px;
	height: auto;
	max-width: 100%;
	padding: 30px 30px;
	border-radius: 20px;
	background-color: rgba(255, 255, 255, 0.8);
	box-shadow: 0 1px 5px rgba(0, 0, 0, 0.3);
}

h2 {
	font-size: 2.2rem;
	color: #f38181;
	font-weight: 700;
	margin: 0 0 1.5rem 0;
	text-align: center;
}

.login__field {
	position: relative;
	margin-bottom: 1.5rem;
}

.login__input {
	background-color: rgba(0, 0, 0, 0.05);
	border: 1px solid #ddd;
	border-radius: 5px;
	display: block;
	font-size: 18px;
	margin-bottom: 0;
	outline: none;
	padding: 14px;
	width: 100%;
	color: #666;
	box-shadow: none !important;
}

.login__input::placeholder {
	opacity: 0;
	transition: all 400ms ease;
}

.login__input:focus::placeholder {
	opacity: 0;
	transition: all 400ms ease;
}

.login__input:focus {
	outline: none;
	border-color: #7369ac;
	box-shadow: 0 0 5px rgba(115, 105, 172, 0.75);
}

.login__input:focus ~ .floating-label, .login__input:not(:placeholder-shown) 
	~ .floating-label {
	transform: translateY(-250%);
	font-size: 0.75rem;
	transition: all 400ms ease;
}

.floating-label {
	position: absolute;
	font-size: 1.1rem;
	left: 14px;
	top: 50%;
	transform: translateY(-50%);
	pointer-events: none;
	transition: all 400ms ease;
}

.submit {
	background-color: #5C97FF;
	border: none;
	border-radius: 5px;
	color: white;
	cursor: pointer;
	font-size: 18px;
	font-weight: 700;
	padding: 12px;
	width: 100%;
	margin-top: 1.5rem;
	transition: all 0.3s;
}

.submit:hover {
	background-color: #4C85DC;
	transform: translateY(-2px);
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

#link-menu {
	display: flex;
	justify-content: space-between;
	margin-top: 1.5rem;
	font-weight: bold;
	font-size: 15px;
}

.separator {
	margin: 0 10px;
	color: #666;
}

a {
	text-decoration: none;
	color: #666;
}

a:hover {
	color: #7369ac;
}
</style>
</head>

<body>
	<form:form action="login" method="post" modelAttribute="command">
		<div class="container">
			<h2>로그인</h2>
			<div class="login__field">
				<input type="text" id="signin-id" class="login__input" name="userid"
					placeholder="아이디" required autocomplete="off"> <label
					class="floating-label" for="signin-id">아이디</label>
			</div>
			<div class="login__field">
				<input type="password" id="signin-pw" class="login__input"
					name="password" placeholder="비밀번호" required autocomplete="off">
				<label class="floating-label" for="signin-pw">비밀번호</label>
			</div>
			<button class="submit" id="signin" type="submit">로그인</button>
			<span></span> <span id="login-alert"
				style="color: red; display: none; margin-top: 10px;">${loginError}</span>

			<div id="link-menu">
				<a href="/find-id">아이디 찾기</a> <span class="separator">|</span> <a
					href="/findpw">비밀번호 찾기</a> <span class="separator">|</span> <a
					href="/joinform">회원가입</a>
			</div>
		</div>
	</form:form>
	<script>
  var loginError = '<%=request.getAttribute("loginError")%>
		';
		if (loginError) {
			document.getElementById('login-alert').style.display = 'inline';
		} else {
			document.getElementById('login-alert').style.display = 'none';
		}
	</script>

</body>
</html>