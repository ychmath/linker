<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
</head>
<body>
 <h1>아이디 찾기</h1>
  <form action="/find-id" method="post">
    <label for="name">이름:</label>
    <input type="text" id="name" name="name" required>
    <br>
    <label for="email">이메일:</label>
    <input type="email" id="email" name="email" required>
    <br>
    <button type="submit">아이디 찾기</button>
  </form>
</body>
</html>