<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>아이디 찾기 결과</title>
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
    width: 350px;
    height: auto;
    max-width: 100%;
    padding: 20px 40px;
    border-radius: 20px;
    background-color: rgba(255, 255, 255, 0.8);
    box-shadow: 0 1px 5px rgba(0, 0, 0, 0.3);
  }

  h2 {
    font-size: 1.5rem;
    color: #f38181;
    font-weight: 700;
    margin: 0 0 1rem 0;
    text-align: center;
  }

  p {
    font-size: 1rem;
    color: #333;
    text-align: center;
    line-height: 1.5;
    margin-bottom: 1.5rem;    
  }

  a {
    font-size: 1rem;
    display: inline-block;
    text-align: center;
    text-decoration: none;
    color: #5C97FF;
    transition: color 0.3s;
  }

  a:hover {
    color: #4C85DC;
    text-decoration: underline;
  }
</style>
</head>

<body>
  <div class="container">
    <h2>아이디 찾기 결과</h2>
    <c:choose>
      <c:when test="${not empty userid}">
        <p>찾으신 아이디: ${userid}</p>
      </c:when>
      <c:otherwise>
        <p>입력하신 정보로 가입된 아이디가 없습니다.</p>
      </c:otherwise>
    </c:choose>
    <a href="/loginform">로그인 페이지로 이동</a>
  </div>
</body>
</html>
