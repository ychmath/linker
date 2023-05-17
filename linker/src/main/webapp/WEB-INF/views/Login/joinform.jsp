<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
  <head>
    <title>회원 가입</title>
    <style>
      #input,
      #result {
        display: none;
      }
      .error {
        color: red;
        font-size: 0.8em;
      }
    </style>
  </head>
  <body>
    <h1>회원 가입</h1>
    <form action="insert" method="post" id="joinForm">
      <div class="user-details">
        <table>
          <tr>
            <td>이름</td>
            <td>
              <input
                type="text"
                name="name"
                id="name"
                placeholder="실명"
                required
              />
              <div id="name_msg"></div>
            </td>
          </tr>
          <tr>
            <td>아이디</td>
            <td>
              <input
                type="text"
                name="userid"
                id="userid"
                placeholder="아이디"
                required
              />
              <input type="button" id="id_check" value="중복 확인" />
              <div id="id_msg" class="error"></div>
              <input type="hidden" id="id_ck" value="" />
            </td>
          </tr>
          <tr>
            <td>비밀번호</td>
            <td>
              <input
                type="password"
                name="password"
                id="password"
                placeholder="비밀번호"
                required
              />
              <div id="pw_msg" class="error"></div>
            </td>
          </tr>
          <tr>
            <td>비밀번호 확인</td>
            <td>
              <input
                type="password"
                name="chk_password"
                id="chk_password"
                placeholder="비밀번호 재입력"
                required
              />
              <div id="chk_pw_msg" class="error"></div>
            </td>
          </tr>
          <tr>
            <td>회사 이메일</td>
            <td>
              <input
                type="email"
                name="email"
                id="email"
                placeholder="회사 이메일"
                required
              />
              <input
                type="hidden"
                name="email_verified"
                id="email_verified"
                value="0"
              />
              <input type="button" id="mail_ck" value="이메일 인증" />
              <div id="emailresult"></div>
              <div id="email_msg" class="error"></div>
              <input type="hidden" id="ck" value="" />

              <div id="input">
                <input id="ck_num" />
                <input type="button" id="ck_b" value="인증 확인" />
              </div>
              <div id="result" class="error"></div>
            </td>
          </tr>
          <tr>
            <td>휴대폰 번호</td>
            <td>
              <select id="phone1" name="phone1">
                <option value="">-선택-</option>
                <option value="010">010</option>
                <option value="011">011</option>
                <option value="016">016</option>
                <option value="017">017</option>
                <option value="018">018</option>
                <option value="019">019</option>
              </select>
              - <input type="text" id="phone2" name="phone2" /> -
              <input type="text" id="phone3" name="phone3" />
              <div id="phone_msg" class="error"></div>
            </td>
          </tr>
          <tr>
            <td colspan="2"><input type="submit" value="가입" /></td>
          </tr>
        </table>
      </div>
    </form>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
      const validateEmail = (email) =>
        /^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-_]+)+$/.test(email);
      const validatePhoneNumber = (phone) =>
        /^01([0|1|6|7|8|9])-?(\d{3,4})-?(\d{4})$/.test(phone);
      const validatePassword = (password) =>
        /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[^a-zA-Z0-9]).{6,20}$/.test(password);
      const validateUserId = (userId) => /^[a-zA-Z0-9_]{6,20}$/.test(userId);

      const displayMessage = (selector, message) => {
        $(selector).html(message);
      };

      $(function () {
        $("#id_check").click(function () {
          let id = $("#userid").val();
          if (!validateUserId(id)) {
            $("#id_msg").html("아이디를 6~20자 이내로 입력하세요");
            return false;
          }
          $.ajax({ url: "/idCheck", data: "id=" + id, datatype: "text" }).done(
            function (data) {
              if (data == "") {
                $("#id_msg").html("사용할 수 있는 아이디 입니다.");
                $("#id_msg").append(
                  "<input type='hidden' id='id_ck' value='1'>"
                );
              } else {
                $("#id_msg").html("이미 사용중인 아이디 입니다.");
              }
            }
          );
        }); //아이디 중복 확인 click

        let emailVerificationClicked = false;
        let num = "";
        $("#mail_ck").click(function () {
          emailVerificationClicked = true;
          let email = $("#email").val();
          if (!validateEmail(email)) {
            $("#email_msg").html(
              "이메일 형식이 올바르지 않습니다. '@'가 포함된 이메일을 적어주세요"
            );
            return false;
          }
          $.ajax({
            url: "/send",
            data: "emailAddress=" + email,
            dataType: "json",
          }).done(function (data) {
            if (eval(data[1])) {
              num = data[0];
              alert("메일이 전송되었습니다. 인증번호를 입력하세요.");
              $("#input,#result").css("display", "block");
            }
          });
        });

        $("#ck_b").click(function () {
          let ck_num = $("#ck_num").val();
          if (ck_num == num) {
            $("#result").html("인증이 확인되었습니다.");
            $("#result").append("<input type='hidden' id='ck' value='1'>");
            // 이메일 인증 성공 시, 값을 1로 변경
            $("#email_verified").val("1");
          } else {
            $("#result").html("인증 실패했습니다. 다시 확인하세요.");
          }
        });

        $("#joinForm").submit(function () {
          // 비밀번호 검증
          if (!validatePassword($("#password").val())) {
            $("#pw_msg").html(
              "비밀번호는 6~20자 이내로 영문대소문자/숫자/특수문자 중 2가지 이상 조합이어야 합니다."
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

          // 이메일 검증
          if (!validateEmail($("#email").val())) {
            $("#email_msg").html(
              "이메일 형식이 올바르지 않습니다. 'id@domain'이 포함된 이메일을 적어주세요"
            );
            return false;
          } else {
            $("#email_msg").html(""); // 조건이 맞으면 메시지를 삭제합니다.
          }

          // 전화번호 검증
          let phone1 = $("#phone1").val();
          let phone2 = $("#phone2").val();
          let phone3 = $("#phone3").val();
          let phone = phone1 + "-" + phone2 + "-" + phone3;
          if (!validatePhoneNumber(phone)) {
            $("#phone_msg").html("전화번호 형식이 올바르지 않습니다");
            return false;
          } else {
            $("#phone_msg").html(""); // 조건이 맞으면 메시지를 삭제합니다.
          }

          // 아이디 중복 체크 확인
          if ($("#id_ck").val() != 1) {
            $("#id_msg").html("아이디 중복 체크 하셔야 합니다.");
            return false;
          }
          //이메일 인증 클릭 여부 확인
          if (!emailVerificationClicked) {
            $("#email_msg").html("이메일 인증을 진행해 주세요.");
            return false;
          }
          // 이메일 인증 검증 코드 추가
          if ($("#email_verified").val() !== "1") {
            $("#result").html("이메일 인증이 필요합니다.");
            return false;
          }
        });
      }); //ready
    </script>
  </body>
</html>
