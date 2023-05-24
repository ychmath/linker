<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>비밀번호 찾기</title>
    <script>
      function showResult(message, success) {
        if (message) {
          alert(message);
          if (success) {
            location.href = "/loginform";
          }
        }
      }
    </script>
  </head>
  <body onload="showResult('${message}', ${success});">
    <h1>비밀번호 찾기</h1>
    <form action="/findpw" method="post">
      <label for="userid">아이디:</label>
      <input type="text" id="userid" name="userid" required /> <br />
      <label for="email">이메일:</label>
      <input type="email" id="email" name="email" required /> <br />
      <input type="submit" value="비밀번호 찾기" />
    </form>
  </body>