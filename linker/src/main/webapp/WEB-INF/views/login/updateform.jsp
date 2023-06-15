<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
  <head>
    <title>비밀번호 수정</title>
    <link rel="stylesheet" href="/css/login/updateform.css"/>
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <link
  href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
  rel="stylesheet">
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        
        .container {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .login__field {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            margin-bottom: 20px;
        }
    </style>
  </head>
  <body>
    <form action="update" method="post" id="updateform">
      <input type="hidden" name="_method" value="put" />  
      <div class="container">  
        <h3>${user.userid}님의 비밀번호를 변경합니다.</h3>
            <div class="login__field">
            <span>이름</span>
            <input type="text" name="name" id="name" value="${user.name}" readonly/>
       
            </div>
            <div class="login__field">
              <input type="password" id="password" name="password" placeholder="비밀번호" class="login__input" />
              <label class="floating-label" for="password">비밀번호</label>
              <div id="pw_msg" class="error"></div>
            </div>

            <div class="login__field">
              <input type="password" id="chk_password" name="chk_password" placeholder="비밀번호 확인" class="login__input" />
              <label class="floating-label" for="chk_password">비밀번호 확인</label>
              <div id="chk_pw_msg" class="error"></div>
            </div>
        </div>
        <button type="submit" class="submit" id ="changepw">수정완료</button>
       
      </div>
    </form>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
      const validatePassword = (password) =>
        /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[^a-zA-Z0-9]).{6,20}$/.test(password);
      const displayMessage = (selector, message) => {
        $(selector).html(message);
      };
      $(function () {
        $("#updateform").submit(function () {
          // 비밀번호 검증
          if (!validatePassword($("#password").val())) {
            $("#pw_msg").html(
              "비밀번호는 6~20자 이내로 영문대소문자/숫자/특수문자로 구성되어야 합니다."
            );
            return false;
          } else {
            $("#pw_msg").html(""); // 조건이 맞으면 메시지를 삭제합니다.
          }

          // 비밀번호 확인 검증
          if ($("#password").val() !== $("#chk_password").val()) {
            $("#chk_pw_msg").html("비밀번호가 일치하지 않습니다.");
            return false;
          } else {
            $("#chk_pw_msg").html(""); // 조건이 맞으면 메시지를 삭제합니다.
          }
        });
      });
    </script>
  </body>
</html>