<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Sign Up</title>

</head>

<body>
	<form action="join" method="post" id="joinForm"
		style="max-height: 800px; overflow-y: scroll">
		<div class="container">
			<div class="content">
				<!-- INPUT -->
				<div class="info" id="info__id">
					<span class="member-type">회원 유형</span> <input type="radio"
						id="buyer" name="role" value="buyer" checked /> <label
						for="buyer">구매자</label> <input type="radio" id="seller"
						name="role" value="seller_t" /> <label for="seller">판매자</label>
				</div>
				<div class="info" id="info__id">
					<input type="text" name="name" id="name" placeholder="이름" required />
					<div id="name_msg"></div>
				</div>
				<div class="info" id="info__id">
					<div id="id-input">
						<input type="text" name="userid" id="userid" placeholder="아이디"
							required /> <input type="button" id="id_check" value="중복 확인" />
						<div id="id_msg" class="error"></div>
						<input type="hidden" id="id_ck" value="" />
					</div>
				</div>
				<div class="info" id="info__pw">
					<input type="password" name="password" id="password"
						placeholder="비밀번호 입력" required />
					<div id="pw_msg" class="error"></div>
				</div>
				<div class="info" id="info__pwRe">
					<input type="password" name="chk_password" id="chk_password"
						placeholder="비밀번호 재입력" required />
					<div id="chk_pw_msg" class="error"></div>
				</div>
				<div class="info" id="info__email">
					<div id="id-input">
						<input type="email" name="email" id="email" placeholder="이메일"
							required /> <input type="hidden" name="email_verified"
							id="email_verified" value="0" /> <input type="button"
							id="mail_ck" value="이메일 인증" />
						<div id="emailresult"></div>
						<div id="email_msg" class="error"></div>
						<input type="hidden" id="ck" value="" />
					</div>
					<div id="input" style="display:none;">
						<input id="ck_num" /> <input type="button" id="ck_b"
							value="인증 확인" />
					</div>
					<div id="result" class="error"></div>
				</div>
				<div class="info" id="info__mobile">
					<input type="text" id="phone" name="phone" placeholder="휴대폰 번호 입력"
						oninput="oninputPhone(this);" />
					<div id="phone_msg" class="error"></div>
				</div>
				<input type="submit" id="registerButton" value="가입하기" />
			</div>
		</div>
	</form>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>

            function oninputPhone(target) {
                target.value = target.value
                .replace(/[^0-9]/g, '')
                .replace(/^(?=\d)(\d{3})(\d{3,4})(\d{4})(?!\d)/, `$1-$2-$3`);
            }
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

                $("input[name='role']").change(function () {
                    if ($("#seller").is(":checked")) {
                        $("#approval_request").show();
                    } else {
                        $("#approval_request").hide();
                    }
                });

                $("#userid, #password, #chk_password, #email, #phone").on(
                    "focus",
                    function () {
                        $(this).next(".error").html("");
                    }
                );

                $('#registerButton').prop('disabled', true);

                $("#id_check").click(function () {
                    let id = $("#userid").val();
                    if (!validateUserId(id)) {
                        $("#id_msg").html("아이디를 6~20자 이내로 입력하세요");
                        return false;
                    }
                    $.ajax({
                        url: "/idCheck",
                        data: "id=" + id,
                        datatype: "text"
                    }).done(
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
                            $("#input").show(); 
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
                    let phone = $("#phone").val();
                    if (!validatePhoneNumber(phone)) {
                        $("#phone_msg").html("전화번호 형식이 올바르지 않습니다. 010-1234-5678 또는 01012345678 형식으로 적어주세요.");
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