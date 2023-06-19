<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
<title>회원 탈퇴</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/css/login/deleteform.css" />

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
	padding: 20px 40px;
	border-radius: 20px;
	background-color: rgba(255, 255, 255, 0.8);
	box-shadow: 0 1px 5px rgba(0, 0, 0, 0.3);
}

h3 {
	font-size: 1.5rem;
	color: #f38181;
	font-weight: 700;
	margin: 0 0 1.5rem 0;
	text-align: center;
}

h4 {
	font-size: 1.5rem;
	color: #f38181;
	font-weight: 700;
	margin: 0 0 1.5rem 0;
	text-align: center;
}

.login__field {
	position: relative;
	margin-bottom: 2.0rem;
}

.login__input {
	background-color: rgba(0, 0, 0, 0.05);
	border: 1px solid #ddd;
	font-size: 16px;
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

table {
	width: 100%;
	text-align: left;
	margin-bottom: 1rem;
}

td:first-child {
	width: 30%;
	padding-right: 10px;
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
	margin-top: 1rem;
	transition: all 0.3s;
}

.submit:hover {
	background-color: #4C85DC;
	transform: translateY(-2px);
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

.error-message {
	color: red;
	font-size: 0.8em;
	margin-bottom: 1rem;
}

.center-text {
	text-align: center;
	cursor: default;
}
</style>

</head>
<body>
	<div class="container">
		<h3>회원 탈퇴</h3>
		<h4>비밀번호를 입력해주세요</h4>
		<c:if test="${result == 'false'}">
			<p class="error-message">입력하신 비밀번호는 틀렸습니다.</p>
		</c:if>
		<form method="post" onsubmit="checkVal()" action="delete">
			<input type="hidden" name="_method" value="delete" /> <label
				class="floating-label" for="passowrd">비밀번호</label> <input
				type="password" name="formpw" id="password" class="login__input"
				placeholder="비밀번호" required /> <input type="submit" value="탈퇴"
				class="submit" />
			<div class="center-text">
				<br> <a href="/">홈으로 돌아가기</a>
			</div>
		</form>
	</div>

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
		function checkVal() {
			let pw = document.querySelector("#password").value;
			if (!pw) {
				alert("비밀번호 입력하세요");
				return false;
			}
		}
	</script>

</body>
</html>
