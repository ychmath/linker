<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>회원정보 수정</title>
<style>
.error {
	color: red;
	font-size: 0.8em;
}
</style>
</head>
<body>
	<h3>${user.userid}님의정보를수정합니다.</h3>
	<form action="update" method="post" id="updateform">
		<input type="hidden" name="_method" value="put" />
		<table>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" id="name"
					value="${user.name}" readonly /></td>
			</tr>

			<tr>
				<td>새 비밀번호</td>
				<td><input type="password" name="password" id="password" />
					<div id="pw_msg" class="error"></div></td>
			</tr>

			<tr>
				<td>새 비밀번호 확인</td>
				<td><input type="password" name="chk_password"
					id="chk_password" />
					<div id="chk_pw_msg" class="error"></div></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="수정 완료" /></td>
			</tr>
		</table>
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
      });
      });
    </script>
</body>
</html>
