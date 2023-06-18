<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<title>회원가입</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Favicon -->
<link href="img/favicon.ico" rel="icon">

<!-- Icon Font Stylesheet -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="lib/animate/animate.min.css" rel="stylesheet">
<link href="lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">

<!-- Customized Bootstrap Stylesheet -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="css/style.css" rel="stylesheet">
<link rel="stylesheet" href="/css/login/joinform.css" />

</head>


<body>

<!-- Topbar Start -->
	<div class="container-fluid bg-light p-0">
		<div class="row gx-0 d-none d-lg-flex">
			<div class="col-lg-7 px-5 text-start">
				<div class="h-100 d-inline-flex align-items-center py-3 me-4">
					<small class="fa fa-map-marker-alt text-primary me-2"></small> <small>서울특별시
						종로구 종로12길 15 코아빌딩1</small>
				</div>
				<div class="h-100 d-inline-flex align-items-center py-3">
					<small class="far fa-clock text-primary me-2"></small> <small>월
						- 일 : 09.30 AM - 10.00 PM</small>
				</div>
			</div>
			<div class="col-lg-5 px-5 text-end">
				<div class="h-100 d-inline-flex align-items-center py-3 me-4">
					<small class="fa fa-phone-alt text-primary me-2"></small> <small>02-6901-7001</small>
				</div>
			</div>
		</div>
	</div>
	<!-- Topbar End -->

	<!-- Navbar Start -->
	<nav
		class="navbar navbar-expand-lg bg-white navbar-light sticky-top p-0">
		<a href="/"
			class="navbar-brand d-flex align-items-center px-4 px-lg-5">
			<h2 class="m-0 text-primary">Linker</h2>
		</a>
		<button type="button" class="navbar-toggler me-4"
			data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarCollapse">
			<div class="navbar-nav ms-auto p-4 p-lg-0">
				<c:if test="${ user.role == null }">
					<a href="/" class="nav-item nav-link active">Home</a>
					<a href="/notice/notice" class="nav-item nav-link">공지사항</a>
					<a href="/inquiry/inquiry" class="nav-item nav-link">문의사항</a>
					<a href="/menu/list" class="nav-item nav-link">식단표</a>
					<a href="/loginform" class="nav-item nav-link">로그인</a>
					<a href="/joinform" class="nav-item nav-link">회원가입</a>
				</c:if>
			</div>
		</div>
	</nav>
	<!-- Navbar End -->
<div class="center-wrapper">
  <form action="join" method="post" id="join">
    <div class="joinform">
      <div class="content">
        <!-- INPUT -->
        <fieldset class="userjoin">
          <legend>회원정보 입력</legend>
          <div class="info" id="info__id">
            <span class="member-type">회원 유형</span>
            <input type="radio" id="buyer" name="role" value="buyer" checked />
            <label for="buyer">구매자</label>
            <input type="radio" id="seller" name="role" value="seller" />
            <label for="seller">판매자</label>
          </div>
          <div class="info" id="info__id">
            <input type="text" name="name" id="name" placeholder="이름" style="color: black;" required />
            <div id="name_msg"></div>
          </div>
          <div class="info" id="info__id">
            <div id="id-input">
              <input type="text" name="userid" id="userid" placeholder="아이디" style="color: black;" required />
              <input type="button" class="btn" id="id_check" value="중복 확인" />
              <div id="id_msg" class="error"></div>
              <input type="hidden" id="id_ck" value="" />
            </div>
          </div>
          <div class="info" id="info__pw">
            <input type="password" name="password" id="password" style="color: black;" placeholder="비밀번호 입력" required />
            <div id="pw_msg" class="error"></div>
          </div>
          <div class="info" id="info__pwRe">
            <input type="password" name="chk_password" id="chk_password" style="color: black;" placeholder="비밀번호 재입력" required />
            <div id="chk_pw_msg" class="error"></div>
          </div>
          <div class="info" id="info__email">
            <div id="id-input">
              <input type="email" name="email" id="email" placeholder="이메일" style="color: black;" required />
              <input type="hidden" name="email_verified" id="email_verified" value="0" />
              <input type="button" id="mail_ck" class="btn" value="이메일 인증" />
              <div id="emailresult"></div>
              <div id="email_msg" class="error"></div>
              <input type="hidden" id="ck" value="" />
            </div>
            <div id="input">
              <input id="ck_num" />
              <input type="button" id="ck_b" class="btn" value="인증 확인" />
            </div>
            <div id="result" class="error"></div>
          </div>
          <div class="info" id="info__mobile">
            <input type="text" id="phone" name="phone" placeholder="휴대폰 번호 입력" style="color: black;" oninput="oninputPhone(this);" />
            <div id="phone_msg" class="error"></div>
          </div>
        </fieldset>

        <fieldset class="agrrretype">
          <div class="all-oh">
            <input type="checkbox" name="agreeAllButton" id="agreeAllButton">
            <span style="color: #000000">모두 동의합니다</span>
          </div>
          <fieldset class="agreech">
            <div class="m-box">
              <div class="mandatory">
                <label for="mandatoryTerms1">
                  <input type="checkbox" id="mandatoryTerms1" name="mandatoryTerms">
                  이용약관 동의<strong>(필수)</strong>
                </label>
              </div>
              <div class="mandatory">
               <label for="mandatoryTerms2">
                <input type="checkbox" id="mandatoryTerms2" name="mandatoryTerms">
                  개인정보 수집, 이용동의<strong>(필수)</strong>
                </label>
              </div>
              <div class="optional">
              <label for="optionalTerms1">
                <input type="checkbox" id="optionalTerms1" name="optionalTerms">
                  개인정보 이용 동의<strong>(선택)</strong>
                </label>
              </div>
              <div class="optional">
              <label for="optionalTerms2">
                <input type="checkbox" id="optionalTerms2" name="optionalTerms">
                  이벤트, 혜택정보 수신동의<strong class="select_disable">(선택)</strong>
                </label>
              </div>
            </div>
          </fieldset>
        </fieldset>
      </div>
      <input type="submit" id="registerButton" class="btn" value="가입하기" />
    </div>
  </form>
</div>

	<!-- Footer Start -->
	<div class="container-fluid bg-dark text-light footer mt-0 pt-0">
		<div class="container">
			<div class="copyright">
				<div class="row">
					<div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
						&copy; <a class="border-bottom" href="#">Linker</a>, All Right
						Reserved.
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Footer End -->
	
	<!-- JavaScript Libraries -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="lib/wow/wow.min.js"></script>
	<script src="lib/easing/easing.min.js"></script>
	<script src="lib/waypoints/waypoints.min.js"></script>
	<script src="lib/counterup/counterup.min.js"></script>
	<script src="lib/owlcarousel/owl.carousel.min.js"></script>
	<script src="lib/isotope/isotope.pkgd.min.js"></script>
	<script src="lib/lightbox/js/lightbox.min.js"></script>

	<!-- Template Javascript -->
	<script src="js/main.js"></script>
	
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

                $("#id_check").click(function() {
                    let id = $("#userid").val();
                    if (!validateUserId(id)) {
                        $("#id_msg").html("아이디를 6~20자 이내로 입력하세요");

                        // 일정 시간(예: 3초) 후 에러 메시지를 사라지게 합니다.
                        setTimeout(function() {
                            $("#id_msg").html("");
                        }, 3000);

                        return false;
                    }
                    $.ajax({
                        url: "/idCheck",
                        data: "id=" + id,
                        datatype: "text"
                    }).done(function(data) {
                        if (data == "") {
                            $("#id_msg").html("사용할 수 있는 아이디 입니다.");
                            $("#id_msg").append("<input type='hidden' id='id_ck' value='1'>");

                            // 일정 시간(예: 3초) 후 메시지를 사라지게 합니다.
                            setTimeout(function() {
                                $("#id_msg").html("");
                            }, 3000);
                        } else {
                            $("#id_msg").html("이미 사용중인 아이디 입니다.");
                            
                            // 일정 시간(예: 3초) 후 에러 메시지를 사라지게 합니다.
                            setTimeout(function() {
                                $("#id_msg").html("");
                            }, 3000);
                        }
                    });
                }); //아이디 중복 확인 click

                let emailVerificationClicked = false;
                let num = "";
                $("#mail_ck").click(function() {
                    emailVerificationClicked = true;
                    let email = $("#email").val();
                    if (!validateEmail(email)) {
                        $("#email_msg").html("이메일 형식이 올바르지 않습니다. '@'가 포함된 이메일을 적어주세요");

                        setTimeout(function() {
                            $("#email_msg").html("");
                        }, 3000);

                        return false;
                    }
                    $.ajax({
                        url: "/send",
                        data: "emailAddress=" + email,
                        dataType: "json",
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
                        // 이메일 인증 성공 시, 값을 1로 변경
                        $("#email_verified").val("1");
                    } else {
                        $("#result").html("인증 실패했습니다. 다시 확인하세요.");

                        setTimeout(function() {
                            $("#result").html("");
                        }, 3000);
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
</body>
</html>