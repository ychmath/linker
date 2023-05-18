<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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
        <form:errors element="div" />
    <div class="container">
        <div class="screen">
            <div class="screen__content">
                <form class="login">
                    <div class="login__field">
                        <input type="text" class="login__input" name="userid" placeholder="아이디">
                    </div>
                    <div class="login__field">
                        <input type="password" class="login__input"  name ="password" placeholder="비밀번호">
                    </div>
                    <button class="submit" onclick="location.href='main' ">
                        <span class="button__text">로그인</span>
                    </button>
                   		
                </form>
                <ul>
                    <li><a href="joinform">회원가입</a></li>
                     <li><a href="">아이디 찾기</a></li>
                    <li> <a href="/findpsw">비밀번호 찾기</a></li>
                  </ul>
            </div>
        </div>
    </div>
</form:form>

</body>
</html>