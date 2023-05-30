<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>회원정보 수정</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
  href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
  rel="stylesheet">
  
<style>
@font-face {
    font-family: 'omyu_pretty';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-01@1.0/omyu_pretty.woff2') format('woff2');
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

h3 {
  font-size: 1.5rem;
  color: #f38181;
  font-weight: 700;
  margin: 0 0 1.5rem 0;
  text-align: center;
}

.login__field {
  position: relative;
  margin-bottom: 2.0rem;
}

.login__input {
  background-color: rgba(0, 0, 0, 0.05);
  border: 1px solid #ddd;
  font-size: 16px;
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

.login__input:focus ~ .floating-label,
.login__input:not(:placeholder-shown) ~ .floating-label {
  transform: translateY(-200%);
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

.error {
    color: red;
    font-size: 0.8em;
}
</style>
</head>
<body>
<div class="container">
    <h3>${user.userid}<br>님의 정보를 수정합니다.</h3>
    <form action="update" method="post" id="updateform">
        <input type="hidden" name="_method" value="put" />
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
        <button type="submit" class="submit">수정 완료</button>
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
</div>
</body>
</html>
