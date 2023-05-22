<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>  
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>회원 가입</title>

    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"/>
	 <script src="http://code.jquery.com/jquery-latest.min.js"></script>
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
    
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
    <h3>회원 가입</h3>
    <form action="joinform" method="post" id="joinForm">
      <div class="user-details">
        <table>
          <tr>
            <td>회원 유형</td>
            <td>
              <input
                type="radio"
                id="buyer"
                name="role"
                value="buyer"
                checked
              />
              <label for="buyer">구매자</label>
              <input type="radio" id="seller" name="role" value="seller" />
              <label for="seller">판매자</label>
            </td>
          </tr>
          <tr>
            <td>이름</td>
            <td>
              <input
                type="text"
                name="name"
                id="name"
                placeholder="실명"
                autocomplete="name"
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
            <td>이메일</td>
            <td>
              <input
                type="email"
                name="email"
                id="email"
                placeholder="이메일"
                autocomplete="name"
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
          <tr id="approval_request" style="display: none">
            <td>승인 요청</td>
            <td>
              <textarea
                name="request_message"
                placeholder="승인 요청 메시지를 입력해주세요."
              ></textarea>
            </td>
          </tr>
          <tr>
            <td colspan="2">
              <div id="terms">
                <h4>약관 동의</h4>

                <!-- 모든 약관에 동의하는 버튼 -->
                <button type="button" id="agreeAllButton">
                  내용을 확인했으며 모든 약관에 동의합니다.
                </button>

                <!-- 필수 약관 -->
                <h5>필수 약관</h5>
                <div class="mandatory">
                  <input
                    type="checkbox"
                    id="mandatoryTerms1"
                    name="mandatoryTerms"
                  />
                  <label for="mandatoryTerms1">(필수) 이용 약관 동의</label>
                  <button
                    type="button"
                    class="btn btn-primary mandatoryTermsBtn"
                    data-toggle="modal"
                    data-target="#mandatoryModal1"
                    data-backdrop="static"
                    data-keyboard="false"
                  >
                    &gt;
                  </button>
                </div>
                <div class="mandatory">
                  <input
                    type="checkbox"
                    id="mandatoryTerms2"
                    name="mandatoryTerms"
                  />
                  <label for="mandatoryTerms2"
                    >(필수) 개인 정보 수집 및 이용 동의</label
                  >
                  <button
                    type="button"
                    class="btn btn-primary mandatoryTermsBtn"
                    data-toggle="modal"
                    data-target="#mandatoryModal2"
                    data-backdrop="static"
                    data-keyboard="false"
                  >
                    &gt;
                  </button>
                </div>

                <!-- 선택 약관 -->
                <h5>선택 약관</h5>
                <div class="optional">
                  <input
                    type="checkbox"
                    id="optionalTerms1"
                    name="optionalTerms"
                  />
                  <label for="optionalTerms1"
                    >(선택) 개인 정보 수집 및 이용 동의</label
                  >
                  <button
                    type="button"
                    class="btn btn-primary optionalTermsBtn"
                    data-toggle="modal"
                    data-target="#optionalModal1"
                    data-backdrop="static"
                    data-keyboard="false"
                  >
                    &gt;
                  </button>
                </div>
                <div class="optional">
                  <input
                    type="checkbox"
                    id="optionalTerms2"
                    name="optionalTerms"
                  />
                  <label for="optionalTerms2"
                    >(선택) Linker 정보 수신 동의</label
                  >
                  <button
                    type="button"
                    class="btn btn-primary optionalTermsBtn"
                    data-toggle="modal"
                    data-target="#optionalModal2"
                    data-backdrop="static"
                    data-keyboard="false"
                  >
                    &gt;
                  </button>
                  <div style="margin-left: 24px">
                    <input
                      type="checkbox"
                      id="optionalTerms3"
                      name="optionalTerms"
                    />
                    <label for="optionalTerms3">(선택) SMS 수신 동의</label>
                  </div>
                  <div style="margin-left: 24px">
                    <input
                      type="checkbox"
                      id="optionalTerms4"
                      name="optionalTerms"
                    />
                    <label for="optionalTerms4">(선택) 이메일 수신 동의</label>
                  </div>
                </div>
              </div>
            </td>
          </tr>
          <tr>
            <td colspan="2">
              <input type="submit" id="registerButton" value="가입 하기" />
            </td>
          </tr>
        </table>
      </div>
    </form>

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
        // 역할에 따른 가입 버튼 명칭 변경
        $("input[name='role']").change(function () {
          if ($("#seller").is(":checked")) {
            $("#approval_request").show();
          } else {
            $("#approval_request").hide();
          }
        });

        $("#userid, #password, #chk_password, #email, #phone2, #phone3").on(
          "focus",
          function () {
            $(this).next(".error").html("");
          }
        );

        $("#registerButton").prop("disabled", true);

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

        // "모두 동의" 버튼 클릭 시 모든 체크박스 체크
        $("#agreeAllButton").on("click", function () {
          $("input[type=checkbox][name=mandatoryTerms]").prop("checked", true);
          $("input[type=checkbox][name=optionalTerms]").prop("checked", true);
          // 필수 약관 체크 이벤트를 강제로 발생하여 회원가입 버튼 활성화
          $("input[type=checkbox][name=mandatoryTerms]").change();
        });
        function checkMandatoryTerms() {
          var allMandatoryTermsChecked = true;
          $("input[name='mandatoryTerms']").each(function () {
            if (!this.checked) {
              allMandatoryTermsChecked = false;
              return false;
            }
          });
          return allMandatoryTermsChecked;
        }

        // 처음에 '가입 완료' 버튼 비활성화
        $("#registerButton").prop("disabled", true);

        // 필수 약관 동의에 따른 회원가입 버튼 활성화 처리
        $("input[name='mandatoryTerms']").on("change", function () {
          if (checkMandatoryTerms()) {
            // 모든 필수 약관에 동의하면 가입 버튼 활성화
            $("#registerButton").prop("disabled", false);
          } else {
            // 필수 약관 중 하나라도 동의하지 않으면 가입 버튼 비활성화
            $("#registerButton").prop("disabled", true);
          }
        });

        // 필수 약관과 선택 약관 팝업을 관리하는 함수입니다.
        function showTermsPopup(elementClass, buttonSelector) {
          $(buttonSelector).on("click", function () {
            var parentDiv = $(this).parent();
            var title = parentDiv.data("title");
            var content = parentDiv.data("content");
          });
        }

        showTermsPopup(".mandatory", "button.mandatoryTermsBtn");
        showTermsPopup(".optional", "button.optionalTermsBtn");

        $("#optionalTerms2").on("change", function () {
          if ($(this).is(":checked")) {
            $("#optionalTerms3, #optionalTerms4").prop("checked", true);
          } else {
            $("#optionalTerms3, #optionalTerms4").prop("checked", false);
          }
        });

        $("#joinForm").submit(function () {
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
            $("#phone_msg").html(
              "전화번호 형식이 올바르지 않습니다. 3자리 - 3 or 4자리 - 4자리의 형식으로 적어주세요."
            );
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
