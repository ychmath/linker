<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>아이디 찾기</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
@font-face {
	font-family: 'omyu_pretty';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-01@1.0/omyu_pretty.woff2')
		format('woff2');
	font-weight: normal;
	font-style: normal;
}

body {
	background-image: linear-gradient(120deg, #f6d365 0%, #fda085 100%);
	display: flex;
	align-items: center;
	justify-content: center;
	height: 100vh;
	margin: 0;
}

.container {
	width: 350px;
	height: auto;
	max-width: 100%;
	padding: 20px 40px;
	border-radius: 20px;
	background-color: rgba(255, 255, 255, 0.8);
	box-shadow: 0 1px 5px rgba(0, 0, 0, 0.3);
}

h2 {
	font-size: 2.0rem;
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
	font-size: 16px;
	margin-bottom: 0;
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
	margin-top: 1rem;
	transition: all 0.3s;
}

.submit:hover {
	background-color: #4C85DC;
	transform: translateY(-2px);
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}
</style>
</head>
<body>
	<div class="container">
		<h2>아이디 찾기</h2>
		<form action="/find-id" method="post">
			<div class="login__field">
				<input type="text" id="name" name="name" class="login__input"
					placeholder="이름" required autocomplete="off" /> <label
					class="floating-label" for="name">이름</label>
			</div>
			<div class="login__field">
				<input type="email" id="email" name="email" class="login__input"
					placeholder="이메일" required autocomplete="off" /> <label
					class="floating-label" for="email">이메일</label>
			</div>
			<button type="submit" class="submit">아이디 찾기</button>
		</form>
	</div>
</body>
</html>
