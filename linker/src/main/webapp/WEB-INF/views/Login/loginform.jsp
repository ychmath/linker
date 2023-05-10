<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- 폼을 쉽게 생성하기 위한 태그 라이브러리를 사용하기 위한 선언문 -->
<!-- form 태그 라이브러리를 사용하여 HTML 폼을 생성하고, 데이터를 전송하는 기능을 제공함 -->
<!-- 폼 필드의 값을 설정하거나 검증하는 등의 기능을 손쉽게 처리할 수 있음 -->

<!DOCTYPE html>
<html lang="en">
<head>
  <link rel="stylesheet" href="index.css">
  <title>HASH TECHIE OFFICIAL</title>
</head>
<body>
    <section>
        <div class="form-box">
            <div class="form-value">
                <form action="">
                    <h2>Login</h2>
                    <div class="inputbox">
                        <ion-icon name="mail-outline"></ion-icon>
                        <input type = "text" name="id" placeholder="아이디">
                        
                    </div>
                    <div class="inputbox">
                        <ion-icon name="lock-closed-outline"></ion-icon>
                        <input type = "password" name="password" placeholder="비밀번호">
                    </div>
                    <div class="forget">
                        <label for=""><input type="checkbox">Remember Me  <a href="#">Forget Password</a></label>
                      
                    </div>
                    <button type="submit" class="btnLogin" value="로그인"
						onclick="location.href='main' ">로그인</button>
                    <br><br>
                    <button type="button" onclick="location.href='insert' "
                    class="btnJoin">회원가입</button>
                    <div class="register">
                        <p>Don't have a account <a href="#">Register</a></p>
                    </div>
                </form>
            </div>
        </div>
    </section>
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</body>
</html>