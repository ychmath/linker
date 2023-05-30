<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <title>회원 탈퇴</title>
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
        height: auto;
        max-width: 100%;
        padding: 20px 40px;
        border-radius: 20px;
        background-color: rgba(255, 255, 255, 0.8);
        box-shadow: 0 1px 5px rgba(0, 0, 0, 0.3);
      }

      h2 {
        font-family: "Roboto Slab", serif;
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
        opacity: 1;
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

      .login__input:focus ~ .floating-label,
      .login__input:not(:placeholder-shown) ~ .floating-label {
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
    <h3>회원 탈퇴하려면 비밀번호를 입력해주세요</h3>
    <c:if test="${result == false}">
      <p>입력하신 비밀번호는 틀렸습니다.</p>
    </c:if>
    <form method="post" onsubmit="checkVal()" action="delete">
      <input type="hidden" name="_method" value="delete" />
      <table>
        <tr>
          <td>password</td>
          <td><input type="password" name="formpw" id="password" /></td>
        </tr>
        <tr>
          <td colspan="2"><input type="submit" value="탈퇴" /></td>
        </tr>
      </table>
    </form>
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
