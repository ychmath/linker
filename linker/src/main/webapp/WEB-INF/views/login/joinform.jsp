<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Sign Up</title>
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
<link rel="stylesheet" href="/css/joinform.css">
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

  <style>
                #input,
                #result {
                    display: none;
                }

                .error {
                    color: red;
                    font-size: 0.8em;
                }

                #name {
                    width: 300px;
                    height: 50px;
                    border-top: none;
                    border-left: none;
                    border-right: none;
                    border-bottom: 3px solid #000000;
                }

                #userid {
                    width: 300px;
                    height: 50px;
                    border-top: none;
                    border-left: none;
                    border-right: none;
                    border-bottom: 3px solid #000000;
                }

                #id_check {
                    width: 100px;
                    height: 55px;
                    border-top: none;
                    border-left: none;
                    border-right: none;
                    border-bottom: 3px solid #000000;
                }

                #password {
                    width: 300px;
                    height: 50px;
                    border-top: none;
                    border-left: none;
                    border-right: none;
                    border-bottom: 3px solid #000000;
                }

                #chk_password {
                    width: 300px;
                    height: 50px;
                    border-top: none;
                    border-left: none;
                    border-right: none;
                    border-bottom: 3px solid #000000;
                }

                #email {
                    width: 300px;
                    height: 50px;
                    border-top: none;
                    border-left: none;
                    border-right: none;
                    border-bottom: 3px solid #000000;
                }

                #mail_ck {
                    width: 100px;
                    height: 55px;
                    border-top: none;
                    border-left: none;
                    border-right: none;
                    border-bottom: 3px solid #000000;
                }

                #ck_num {
                    width: 300px;
                    height: 50px;
                    border-top: none;
                    border-left: none;
                    border-right: none;
                    border-bottom: 3px solid #000000;
                }

                #ck_b {
                    width: 100px;
                    height: 55px;
                    border-top: none;
                    border-left: none;
                    border-right: none;
                    border-bottom: 3px solid #000000;
                }

                #phone {
                    width: 300px;
                    height: 50px;
                    border-top: none;
                    border-left: none;
                    border-right: none;
                    border-bottom: 3px solid #000000;
                }
            </style>
</head>

<body >
	<form action="joinform" method="post" id="joinForm" style="max-height: 800px; overflow-y: scroll ">
		<div class="container" >
			<div class="content" >
				<!-- INPUT -->
				<section>
					<form>
						<fieldset >
							<legend>회원정보 입력</legend>
							<div class="info" id="info__id">
								<span class="member-type">회원 유형</span> <input type="radio"
									id="buyer" name="role" value="buyer" checked /> <label
									for="buyer">구매자</label> <input type="radio" id="seller"
									name="role" value="seller" /> <label for="seller">판매자</label>
							</div>
							<div class="info" id="info__id">
								<input type="text" name="name" id="name" placeholder="이름"
									required />
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
								<div id="input">
									<input id="ck_num" /> <input type="button" id="ck_b"
										value="인증 확인" />
								</div>
								<div id="result" class="error"></div>
							</div>
							<div class="info" id="info__mobile">
								<input type="text" id="phone" name="phone"
									placeholder="휴대폰 번호 입력" oninput="oninputPhone(this);" />
								<div id="phone_msg" class="error"></div>
							</div>
							<div class="info" id="info__mobile">
								<div id="approval_request" style="display: none;">
									<textarea name="request_message"
										placeholder="승인 요청 메시지를 입력해주세요."></textarea>
								</div>
							</div>
						</fieldset>
						<form>
							<form>
								<fieldset >
									<div class="all-oh" >
										<legend>약관 동의</legend>
										<button type="button" id="agreeAllButton">내용을 확인했으며
											모든 약관에 동의합니다.</button>
									</div>
									<div class="m-box">
										<div class="message">
											<div class="ang">
												<h5>필수 약관</h5>
											</div>
											<div class="mandatory">
												<input type="checkbox" id="mandatoryTerms1"
													name="mandatoryTerms" /><label for="mandatoryTerms1">(필수)
													이용 약관 동의</label>
												<button type="button"
													class="btn btn-primary mandatoryTermsBtn"
													data-toggle="modal" data-target="#mandatoryModal1"
													data-backdrop="static" data-keyboard="false">&gt;</button>
											</div>
											<div class="mandatory">
												<input type="checkbox" id="mandatoryTerms2"
													name="mandatoryTerms" /><label for="mandatoryTerms2">(필수)
													개인 정보 수집 및 이용 동의</label>
												<button type="button"
													class="btn btn-primary mandatoryTermsBtn"
													data-toggle="modal" data-target="#mandatoryModal2"
													data-backdrop="=" checkbox" id="optionalTerms1"
													namestatic"
                                                            data-keyboard="false">&gt;</button>
											</div>
											<h5>선택 약관</h5>
											<div class="optional">
												<inputoptionalTerms " />
												<label for=" optionalTerms1">(선택) 개인 정보 수집 및 이용 동의</label>
												<button type="button"
													class="btn btn-primary optionalTermsBtn"
													data-toggle="modal" data-target="#optionalModal1"
													data-backdrop="static" data-keyboard="false">&gt;</button>
											</div>
											<div class="optional">
												<input type="checkbox" id="optionalTerms2"
													name="optionalTerms" /><label for="optionalTerms2">(선택)
													Linker 정보 수신 동의</label>
												<button type="button"
													class="btn btn-primary optionalTermsBtn"
													data-toggle="modal" data-target="#optionalModal2"
													data-backdrop="static" data-keyboard="false">&gt;</button>
												<div style="margin-left: 24px;">
													<input type="checkbox" id="optionalTerms3"
														name="optionalTerms" /><label for="optionalTerms3">(선택)
														SMS 수신 동의</label>
												</div>
												<div style="margin-left: 24px;">
													<input type="checkbox" id="optionalTerms4"
														name="optionalTerms" /><label for="optionalTerms4">(선택)
														이메일 수신 동의</label>
												</div>
											</div>
										</div>
									</div>
								</fieldset>
							</form>
						</form>
					</form>
				</section>
			</div>
			<div class="modal" id="mandatoryModal1">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title">(필수) 이용 약관 동의</h5>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>
						<div class="modal-body"
							style="max-height: 400px; overflow-y: scroll;">
							<h1>이용 약관</h1>
							<h2>제 1 조 (목적)</h2>
							<p>본 이용 약관은 Linker(이하 "회사")가 운영하는 www.linker.com(이하 "사이트")에서
								제공하는 식권 구매 및 식자재 관리 서비스(이하 "서비스")의 이용과 관련하여 회사와 이용자 간의 권리, 의무 및
								책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.</p>

							<h2>제 2 조 (용어의 정의)</h2>
							<p>본 약관에서 사용하는 용어의 정의는 다음과 같습니다.</p>
							<ol>
								<li>"회원"은 회사와 이용계약을 체결하고 이용자 아이디(ID)를 부여 받아 사이트의 정보를 지속적으로
									제공받으며 회사가 제공하는 서비스를 지속적으로 이용할 수 있는 사이트 이용자를 말합니다.</li>
								<li>"비회원"은 회원에 가입하지 않고 회사가 제공하는 서비스를 사용하는 사이트 이용자를 말합니다.</li>
							</ol>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary"
								data-dismiss="modal">확인</button>
						</div>
					</div>
				</div>
			</div>
			<div class="modal" id="mandatoryModal2">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title">(필수) 개인 정보 수집 및 이용 동의</h5>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>
						<div class="modal-body"
							style="max-height: 400px; overflow-y: scroll;">
							<h3>개인정보 수집목적 및 이용목적</h3>
							<p>
								<strong>가. 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산</strong>
							</p>
							<ul>
								<li>콘텐츠 제공 , 구매 및 요금 결제 , 물품 배송 또는 청구지 등 발송 , 금융거래 본인 인증 및
									금융 서비스</li>
							</ul>
							<p>
								<strong>나. 회원 관리</strong>
							</p>
							<ul>
								<li>회원제 서비스 이용에 따른 본인 확인 , 개인 식별 , 불량회원의 부정 이용 방지와 비인가 사용
									방지 , 가입 의사 확인 , 연령확인 , 만 14세 미만 아동 개인정보 수집 시 법정 대리인 동의 여부 확인,
									불만처리 등 민원처리 , 고지 사항 전달</li>
							</ul>
							<h4>수집하는 개인정보 항목</h4>
							<p>이름 , 로그인 ID , 비밀번호 , 이메일 , 14세 미만 가입자의 경우 법정대리인의 정보</p>

							<h5>개인정보의 보유기간 및 이용기간</h5>
							<p>원칙적으로, 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체 없이 파기합니다. 단, 다음의
								정보에 대해서는 아래의 이유로 명시한 기간 동안 보존합니다.</p>
							<ol>
								<li><strong>가. 회사 내부 방침에 의한 정보 보유 사유</strong>
									<ul>
										<li>부정거래 방지 및 쇼핑몰 운영방침에 따른 보관 : 10년</li>
									</ul></li>
								<li><strong>나. 관련 법령에 의한 정보보유 사유</strong>
									<ol>
										<li>계약 또는 청약철회 등에 관한 기록
											<ul>
												<li>보존 이유 : 전자상거래 등에서의 소비자 보호에 관한 법률</li>
												<li>보존 기간 : 5년</li>
											</ul>
										</li>
										<li>대금 결제 및 재화 등의 공급에 관한 기록
											<ul>
												<li>보존 이유: 전자상거래 등에서의 소비자보호에 관한 법률</li>
												<li>보존 기간 : 5년</li>
											</ul>
										</li>
										<li>소비자 불만 또는 분쟁처리에 관한 기록
											<ul>
												<li>보존 이유 : 전자상거래 등에서의 소비자 보호에 관한 법률</li>
												<li>보존 기간 : 3년</li>
											</ul>
										</li>
										<li>로그 기록
											<ul>
												<li>보존이유: 통신비밀보호법</li>
												<li>보존기간 : 3개월</li>
											</ul>
										</li>
									</ol></li>
							</ol>
							<div class="modal-footer">
								<button type="button" class="btn btn-primary"
									data-dismiss="modal">확인</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="modal" id="optionalModal1">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title">(선택) 개인 정보 수집 및 이용 동의</h5>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>
						<div class="modal-body"
							style="max-height: 400px; overflow-y: scroll;">---- 여기에 선택
							약관 1 내용을 입력하세요. ----</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary"
								data-dismiss="modal">확인</button>
						</div>
					</div>
				</div>
			</div>
			<div class="modal" id="optionalModal2">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title">(선택) Linker 정보 수신 동의</h5>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>
						<div class="modal-body"
							style="max-height: 400px; overflow-y: scroll;">---- 여기에 선택
							약관 2 내용을 입력하세요. ----</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary"
								data-dismiss="modal">확인</button>
						</div>
					</div>
				</div>
			</div>
			<input type="submit" id="registerButton" value="가입하기" />

		</div>
	</form>
</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>

            function oninputPhone(target) {
                target.value = target.value
                    //.replace(/[^0-9]/g, '')
                    .replace(/^(\d{3})(\d{4})(\d{4})$/, `$1-$2-$3`);
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

                $("#optionalTerms2").on("change", function () {
                    if ($(this).is(":checked")) {
                        $("#optionalTerms3, #optionalTerms4").prop("checked", true);
                    } else {
                        $("#optionalTerms3, #optionalTerms4").prop("checked", false);
                    }
                });


                $("input[name='role']").change(function () {
                    if ($("#seller").is(":checked")) {
                        $("#approval_request").show();
                    } else {
                        $("#approval_request").hide();
                    }
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
                $('#registerButton').prop('disabled', true);

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
                        showModal(title, content);
                    });
                }

                showTermsPopup(".mandatory", "button.mandatoryTermsBtn");
                showTermsPopup(".optional", "button.optionalTermsBtn");

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
                $('#agreeAllButton').on('click', function () {
                    $('input[type=checkbox][name=mandatoryTerms]').prop('checked', true);
                    $('input[type=checkbox][name=optionalTerms]').prop('checked', true);
                    // 필수 약관 체크 이벤트를 강제로 발생하여 회원가입 버튼 활성화
                    $('input[type=checkbox][name=mandatoryTerms]').change();
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

</html>