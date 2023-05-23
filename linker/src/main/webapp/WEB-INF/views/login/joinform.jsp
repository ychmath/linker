<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>회원 가입</title>
<!-- <style>
#input, #result {
	display: none;
}
</style>
</head>
<body>
	<h1>회원 가입</h1>
	<form action="insert" method="post" id="joinForm">
		<table>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" id="name"
					placeholder="실명을 입력해주세요." required></td>
			</tr>

			<tr>
				<td>아이디</td>
				<td><input type="text" name="userid" id="userid" 
					placeholder="아이디를 6~20자 이내로 입력하세요." required> 
				<input type="button" id="id_check" value="중복 확인"> 
				<span id="id_msg"></span></td>
			</tr>

			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="password" id="password"
					placeholder="비밀번호를 6~20자 이내로 입력해주세요." required>
					<div id="pw_msg"></div></td>
			</tr>
	
			<tr>
				<td>권한</td>
				<td><select name="role">
					<option value="seller">판매자</option>
					<option value="buyer">구매자</option>
				</select></td>
			
			<tr>
				<td>회사 이메일</td>
				<td><input type="text" name="email" id="email" 
					placeholder="메일을 입력하세요." required>
					<div id="emailresult"></div> <input type="button" id="chk_email"
					value="메일 인증">
					<div id="input">
						<input id="ck_num"> <input type="button" id="ck_b"
							value="인증번호 확인">
					</div>
					<div id="result"></div></td>
			</tr>

			<tr>
				<td>전화번호</td>
				<td><input type="text" name="phone" id="phone"
					placeholder="전화번호를 입력해주세요."></td>
			</tr>

			<tr>
				<td colspan="2"><input type="submit" value="가입"></td>
			</tr>
		</table>
	</form>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
	$(function(){
		$("#id_check").click(function(){
			let id = $("#userid").val(); //.val()은 선택된 요소의 값을 가져오는 메서드
			if(!id){ //id변수에 값이 없는 경우. id변수에 값이 없으면 true를 반환
				$("#id_msg").html("아이디를 입력하세요")
				return false; //폼 제출을 막기 위해 false를 반환
			}
			
			
			
			$.ajax({
				url: "/idCheck", //서버로 보낼 요청 URL
				data: "id=" + id, //서버로 보낼 데이터, "id"변수의 값을 사용함
				datatype: "text" //서버로부터 받아올 데이터의 타입
			}).done( //ajax요청이 성공적으로 완료된 경우에 실행되는 함수
					function(data){
						if(data == ""){
							$("#id_msg").html("사용가능한 아이디 입니다.");
							$("#id_msg").append("<input type='hidden' id='id_ck' value='1'>");
							//value 속성이 1로 되어 있는데, 이는 중복 체크를 통과했다는 값을 의미
							//input태그를 추가하는 이유는 중복 체크각 성공했다는 값을 서버에서 받아오지 않고, 클라이언트에서 처리하기 위함
						}else{
						$("#id_msg").html("이미 사용중인 아이디입니다.");
						
							
						}
			})
			
		})	
		
		$("#joinform").submit(function() { //#joinform을 제출할 때 실행되는 함수
			if ($("#id_ck").val() != 1) { //1이 아니라면 중복 체크를 하지 않았다는 의미
				$("#id_msg").html("아이디 중복 체크 하셔야 합니다.")
				return false; //폼 제출을 막기 위해 false를 반환
			}
			if (!$("#password").val()) { //비밀번호가 없다면('false'이면)
				alert("비밀번호를 입력해야 합니다.");
				return false; //폼 제출을 막기 위해 false를 반환
			}
		})
	}) //ready
	
	let num = "";
	$(function(){
		$("#chk_email").click(function(){
			let email = $("#email").val();
			if(!email){
				$("#result").css("display", "block").html("메일 주소를 입력하세요.");
				return false;
			}
			$.ajax({
				url: "/send", // "/send"는 서버의 URL 주소를 의미
				data: "emailAddress" + email, //서버로 전송될 데이터를 의미
				dataType: "json"
			}).done(function(data){
				if(eval(data[1])){ //eval(): 문자열을 자바스크립트 코드로 실행시키는 함수
					//json 형태로 전송된 데이터의 두번째 인덱스 값을 eval()함수를 통해 실행
					num = data[0]; //서버로부터 받아온 데이터의 첫 번째 값을 num이라는 변수에 저장
					alert("메일이 전송되었습니다. 인증번호를 입력하세요.")
					$("#input, #result").css("display", "block");
				}
				
			})
		})

		$("#ck_b").click(function(){
			let ck_num = $("#ck_num").val();
			if(ck_num == num){
				$("#result").html("인증되었습니다.")
				$("#result").append("<input type='hidden' id='ck' value='1'>")
			}else{
				$("#result").html("인증 실패했습니다. 다시 확인해주세요.")
			}
		})
	})	
	</script>
</body>
</html>
======= -->
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
