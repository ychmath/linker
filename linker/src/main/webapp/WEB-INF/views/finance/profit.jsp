<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href='https://fonts.googleapis.com/css?family=Roboto'
	rel='stylesheet'>
<link href="https://fonts.googleapis.com/css?family=Roboto+Slab"
	rel="stylesheet">
<title>Sign in</title>
<style>
body {
	font-family: Roboto, serif;
	background-image: linear-gradient(120deg, #f6d365 0%, #fda085 100%);
	display: flex;
	align-items: center;
	justify-content: center;
	height: 100vh;
	margin: 0;
}

.container {
	width: 350px;
	height: 400px;
	max-width: 100%;
	padding: 20px 40px;
	border-radius: 20px;
	background-color: rgba(255, 255, 255, 0.8);
	box-shadow: 0 1px 5px rgba(0, 0, 0, 0.3);
}

h2 {
	font-family: "Roboto Slab", serif;
	font-size: 2.5rem;
	color: #f38181;;
	font-weight: 700;
	margin-bottom: 1.5rem;
	text-align: center;
}

.login__field {
	position: relative;
	margin-bottom: 2rem;
}

.login__input {
	background-color: rgba(0, 0, 0, 0.05);
	border: 1px solid #ddd;
	border-radius: 5px;
	display: block;
	font-size: 16px;
	margin-bottom: 1rem;
	outline: none;
	padding: 10px;
	width: 100%;
	color: #666;
	box-shadow: none !important;
}

.login__input::placeholder {
	opacity: 0;
	transition: all 400ms ease;
}

.login__input:focus::placeholder {
	opacity: 1;
	transition: all 400ms ease;
}

.login__input:focus {
	outline: none;
	border-color: #7369ac;
	box-shadow: 0 0 5px rgba(115, 105, 172, 0.75);
}

.login__input:focus ~.floating-label, .login__input:not(:placeholder-shown)
	 ~.floating-label {
	transform: translateY(-1rem);
	font-size: 0.75rem;
	transition: all 400ms ease;
}

.floating-label {
	position: absolute;
	font-size: 1rem;
	left: 10px;
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
	padding: 10px;
	width: 100%;
	transition: all 0.3s;
}

.submit:hover {
	background-color: #4C85DC;
	transform: translateY(-2px);
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

#link-menu {
	margin-top: 20px;
	display: flex;
	justify-content: space-between;
}

#link-menu a {
	text-decoration: none;
	color: #5C97FF;
	transition: color 0.3s;
}

#link-menu a:hover {
	color: #4C85DC;
	text-decoration: underline;
}

.login__input:focus::placeholder {
	opacity: 0;
	/* 투명도를 0으로 변경하여 플레이스홀더를 숨김 처리 */
}

.login__input:focus ~.floating-label, .login__input:not(:placeholder-shown)
	 ~.floating-label {
	opacity: 1;
	/* 기존 라벨 투명 처리를 제거하고 라벨 투명도를 1로 설정해 라벨이 보이게 만듭니다. */
	transform: translateY(-250%);
	/* Y축 이동 거리를 더 크게 조절하여 라벨이 입력칸 테두리와 겹치지 않도록 설정합니다. */
	font-size: 0.75rem;
	transition: all 400ms ease;
}
</style>
</head>

<body>
	<form:form action="login" method="post" modelAttribute="command">
		<div class="container">
			<h2>로그인</h2>
			<div class="login__field">
				<input type="text" id="signin-id" class="login__input form-control"
					name="userid" placeholder="아이디" required autocomplete="off">
				<label class="floating-label" for="signin-id">아이디</label>
			</div>
			<div class="login__field">
				<input type="password" id="signin-pw"
					class="login__input form-control" name="password"
					placeholder="비밀번호" required autocomplete="off"> <label
					class="floating-label" for="signin-pw">비밀번호</label>
			</div>
			<button class="submit" id="signin" type="submit">로그인</button>
			<span></span> <span id="login-alert"
				style="color: red; display: none; margin-top: 10px;">${loginError}</span>

			<div id="link-menu">
				<a href="/find-id">아이디 찾기</a> <a href="/findpw">비밀번호 찾기</a> <a
					href="/joinform">회원가입</a>
			</div>
		</div>
	</form:form>

	<!-- Footer Start -->
	<div class="container-fluid bg-dark text-light footer mt-0 pt-0">
		<div class="container">
			<div class="copyright">
				<div class="row">
					<div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
						&copy; <a class="border-bottom" href="#">Linker</a>, All Right
						Reserved.
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Footer End -->
	
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