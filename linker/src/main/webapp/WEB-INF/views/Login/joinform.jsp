<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/loginform.css">
<title>회원 가입</title>
<style>
    #input, #result, #chk_email, #registerButton {
        display: none;
    }
    </style>
</head>
<body>
  <h1>회원 가입</h1>
    <form action="main" method="get" id="joinForm">
        <div class="user-details">
          <table>
            <tr>
              <td>이름</td>
              <td>
                <input type="text" name="name" id="name" placeholder="실명을 입력해주세요." required>
                <div id="name_msg"></div>
              </td>
            </tr>
            <tr>
              <td>아이디</td>
              <td>
                <input type="text" name="userid" id="userid" placeholder="아이디를 6~20자 이내로 입력하세요." required>
                <input type="button" id="id_check" value="중복 확인">
                <span id="id_msg"></span>
                <input type="hidden" id="id_ck" value=""/>
              </td>
            </tr>
            <tr>
              <td>비밀번호</td>
              <td>
                <input type="password" name="password" id="password" placeholder="비밀번호를 6~20자 이내로 입력해주세요." required>
                <div id="pw_msg"></div>
              </td>
            </tr>
            <tr>
              <td>비밀번호 확인</td>
              <td>
                <input type="password" name="chk_password" id="chk_password" placeholder="비밀번호를 다시 입력해주세요." required>
              </td>
            </tr>
            <tr>
              <td>회사 이메일</td>
              <td>
                <input type="text" name="email" id="email" placeholder="@domain.com" required>
                <div id="emailresult"></div>
                <span id="email_msg"></span>
                <input type="hidden" id="ck" value=""/>
                <input type="button" id="mail_ck" value="메일 인증">
                <div id="input">
                  <input id="ck_num">
                  <input type="button" id="ck_b" value="인증 확인">
                </div>
                <div id="result"></div>
              </td>
            </tr>
            <tr>
              <td>휴대폰 번호</td>
              <td>
                <input type="text" name="phone" id="phone" placeholder="휴대폰 번호를 입력하세요">
              </td>
            </tr>
            <tr>
              <td colspan="2">
                <input type="submit" value="가입">
              </td>
            </tr>
          </table>
        </div>
    </form>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
   <script>
   function validateEmail(email) {
	   const regex = /^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-_]+)+$/;
	   return regex.test(email);
	 }

    function validatePhoneNumber(phone) {
      const regex = /^\d{3}-\d{4}-\d{4}$/;
      return regex.test(phone);
    }

    function validatePassword(password) {
      const regex = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[^a-zA-Z0-9]).{6,20}$/;
      return regex.test(password);
    }

    function validateUserId(userId) {
      const regex = /^[a-zA-Z0-9_]{6,20}$/;
      return regex.test(userId);
    }

    $(function() {
      $("#id_check").click(function() {
        let id = $("#userid").val();
        if (!validateUserId(id)) {
          $("#id_msg").html("아이디를 6~20자 이내로 입력하세요");
          return false;
        }
        $.ajax({ url: "/idCheck", data: "id=" + id, datatype: "text" }).done(function(data) {
          if (data == "") {
            $("#id_msg").html("사용할 수 있는 아이디 입니다.");
            $("#id_msg").append("<input type='hidden' id='id_ck' value='1'>");
          } else {
            $("#id_msg").html("이미 사용중인 아이디 입니다.");
          }
        });
      }); //아이디 중복 확인 click

      $("#joinForm").submit(function() {
        if (!validatePassword($("#password").val())) {
          $("#pw_msg").html("비밀번호는 6~20자 이내로 영문대소문자/숫자/특수문자 중 2가지 조합이어야 합니다.");
          return false;
        }
        if ($("#password").val() !== $("#chk_password").val()) {
          alert("비밀번호가 일치하지 않습니다.");
          return false;
        }
        if (!validateEmail($("#email").val())) {
          $("#email_msg").html("이메일 형식이 올바르지 않습니다. '@'가 포함된 이메일을 적어주세요");
          return false;
        }
        if (!validatePhoneNumber($("#phone").val())) {
          alert("전화번호는 000-0000-0000 형식이어야 합니다.");
          return false;
        }
        if ($("#id_ck").val() != 1) {
          $("#id_msg").html("아이디 중복 체크 하셔야 합니다.");
          return false;
        }
      });
      
      let num = "";
      $("#mail_ck").click(function() {
        let email = $("#email").val();
        if (!validateEmail(email)) {
          $("#result")
            .css("display", "block")
            .html("메일 주소가 올바르지 않습니다. '@'으로 끝나야 합니다.");
          return false;
        }
        $.ajax({
          url: "/send",
          data: "emailAddress=" + email,
          dataType: "json"
        }).done(function(data) {
          if (eval(data[1])) {
            num = data[0];
            alert("메일이 전송되었습니다. 인증번호를 입력하세요.");
            $("#input,#result").css("display", "block");
          }
        });
      });

      $("#ck_b").click(function() {
        let ck_num = $("#ck_num").val();
        if (ck_num == num) {
          $("#result").html("인증이 확인되었습니다.");
          $("#result").append("<input type='hidden' id='ck' value='1'>");
        } else {
          $("#result").html("인증 실패했습니다. 다시 확인하세요.");
        }
      });
    }); //ready
   </script>
</body>
</html>
