<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인</title>
    <link rel="stylesheet" href="css/login.css">
</head>
<body>
    <body>
       <div class = "header">
        <h1><a href="index.html"><img src="img/Linker.png" alt="Linker"></a></h1>
       </div>
    </body>
    <body>
        <div class="container">
            <!-- center-->
            <form>
                <fieldset>
                    <h3>회원로그인</h3>
                    <legend>회원 로그인</legend>
                    <div>
                      <tr>
                        <td><input type = "text" name="id" placeholder="아이디">
                        <form:errors path="id"></form:errors></td>
                      </tr>
                      <tr>
                        <td><input type = "password" name="password" placeholder="비밀번호"></td>
                        </tr>
                        <input type="checkbox" checked id="chkID">
                        <label for = "chkID">아이디 저장</label><br>
                         <input type="checkbox" checked id ="chkIDjeo">
                        <label for ="chkIDjeo">로그인 유지</label>
                        <br><br>

                        <button type="submit" class="btnLogin" value="로그인">로그인</button>
                     <button type="button" onclick="location.href='insert' " class="btnJoin">회원가입</button>
                    </div>
                </fieldset>
                
            </form>
        </div>
       
    </body>
</body>
</html>