<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- 폼을 쉽게 생성하기 위한 태그 라이브러리를 사용하기 위한 선언문 -->
<!-- form 태그 라이브러리를 사용하여 HTML 폼을 생성하고, 데이터를 전송하는 기능을 제공함 -->
<!-- 폼 필드의 값을 설정하거나 검증하는 등의 기능을 손쉽게 처리할 수 있음 -->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/login.css">
    <title>Document</title>
</head>
<body>
    <form:form action="login" method="post" modelAttribute="command">
        <form:errors element="div" />
    <div class="container">
        <div class="screen">
            <div class="screen__content">
                <form class="login">
                    <div class="login__field">
                        <i class="login__icon fas fa-user"></i>
                        <input type="text" class="login__input" name="userid" placeholder="아이디">
                    </div>
                    <div class="login__field">
                        <i class="login__icon fas fa-lock"></i>
                        <input type="password" class="login__input"  name ="password" placeholder="비밀번호">
                    </div>
                    <button class="button login__submit" onclick="location.href='main' ">
                        <span class="button__text">로그인</span>
                        <i class="button__icon fas fa-chevron-right"></i>
                    </button>
                   		
                </form>
                <div class="social-login">
                    <a href="joinform">회원가입</a>
                    <h4>아이디 찾기</h4>
                    <h4>비밀번호 찾기</h4>
                </div>
            </div>
            <div class="screen__background">
                <span class="screen__background__shape screen__background__shape4"></span>
                <span class="screen__background__shape screen__background__shape3"></span>		
                <span class="screen__background__shape screen__background__shape2"></span>
                <span class="screen__background__shape screen__background__shape1"></span>
            </div>		
        </div>
    </div>
</form:form>

</body>
</html>