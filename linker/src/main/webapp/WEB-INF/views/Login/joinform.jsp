<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="css/loginform.css">
    <title>Document</title>
</head>
<body>
    <div class="container" onclick="onclick">
        <div class="top"></div>
        <div class="bottom"></div>
        <div class="center">
          <h2>회원가입 해줘</h2>
          <form action="insert" method="post" id="joinform">
            <table>
                <tr>
                    <td>id</td>
                    <td><input name="id" id="id"> <input type="button"
                        id="id_check" value="중복 확인"><span id="id_msg"></span></td>
                </tr>
                <tr>
                    <td>password</td>
                    <td><input name="password" type="password" id="password"></td>
                </tr>
                <tr>
                    <td>name</td>
                    <td><input name="name" id="name"></td>
                </tr>
                <tr>
                    <td>birth</td>
                    <td><input name="birth" placeholder="yyyyMMdd"></td>
                </tr>
                <tr>
                    <td>address</td>
                    <td><input name="address" id="address"> <input
                        type="button" id="addbtn" value="우편번호 검색" onclick="addPost()"></td>
                </tr>
    
                <tr>
                    <td colspan="2"><input type="submit" value="가입"></td>
                </tr>
            </table>
        </form>
          <h2>&nbsp;</h2>
        </div>
      </div>
</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		function addPost() {
			new daum.Postcode({
				oncomplete : function(data) {
					document.querySelector("#address").value = data.address;
					alert("나머지 주소도 입력하세요.");
				}
			}).open();
		}

		$(function() {
			$("#id_check")
					.click(
							function() {
								let id = $("#id").val();
								if (!id) {
									$("#id_msg").html("아이디를 입력하세요.")
									return false;
								}
								$
										.ajax({
											url : "/idCheck",
											data : "id=" + id,
											datatype : "text"
										})
										.done(
												function(data) {
													//alert(data);
													if (data == "") {
														$("#id_msg")
																.html(
																		"사용할 수 있는 아이디 입니다.");
														$("#id_msg")
																.append(
																		"<input type='hidden' id='id_ck' value='1'>");
													} else {
														$("#id_msg")
																.html(
																		"이미 사용중인 아이디 입니다.");
													}
												})
							});//아이디 중복 확인 click

			$("#joinform").submit(function() {
				if ($("#id_ck").val() != 1) {
					$("#id_msg").html("아이디 중복 체크 하셔야 합니다.")
					return false;
				}
				if (!$("#password").val()) {
					alert("비밀번호를 입력해야 합니다.");
					return false;
				}
			});

		})//ready
	</script>
</html>