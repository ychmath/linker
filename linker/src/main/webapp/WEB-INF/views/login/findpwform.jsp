<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
  <head>
    <title>비밀번호 찾기</title>
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
    <h1>비밀번호 찾기</h1>
    <form action="findpwform" method="post" id="findpwform">
      <div class="user-details">
        <table>
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
              <div id="id_msg" class="error"></div>
              <input type="hidden" id="id_ck" value="" />
            </td>
          </tr>
          <tr>
            <td>이메일</td>
            <td>
              <input
                type="email"
                name="email"
                id="email"
                placeholder="이메일"
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
            <td colspan="2"><input type="submit" value="비밀번호 찾기" /></td>
          </tr>
        </table>
      </div>
    </form>
     <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
      <script>
      $(function () {
    	  
    	  let emailVerificationClicked = false;
          let num = "";
          
          $("#mail_ck").click(function () {
           
            let email = $("#email").val();
            let userid = $("#userid").val();
            $.ajax({
              url: "/sendfindpw",
              data: "emailAddress=" + email +"&userid="+userid,
              dataType: "json",
            }).done(function (data) {
              if (eval(data[1])) {
                num = data[0];
                alert("메일이 전송되었습니다. 인증번호를 입력하세요.");
                $("#input,#result").css("display", "block");
              }else{
            	  alert("입력하신 메일이 맞지 않습니다.");
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
          //이메일 인증 클릭 여부 확인
          $("#findpwform").submit(function () {
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
      });
      </script>
  </body>
</html>
