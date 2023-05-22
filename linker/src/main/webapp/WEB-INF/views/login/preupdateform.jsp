<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>비밀번호 확인</title>
</head>
<body>
	<h3>회원정보를 수정하기 위해 현재 비밀번호를 입력하세요.</h3>
	<form id="checkPasswordForm">
		<table>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="current_password"
					id="current_password" /></td>
				<td><button id="submitBtn">확인</button></td>
			</tr>
		</table>
	</form>
	<p id="error" style="display: none; color: red;">비밀번호가 일치하지 않습니다.</p>
</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    const checkCurrentPassword = async (password) => {
        const response = await $.ajax({
            url: "/check-password",
            type: "POST",
            data: { password },
            dataType: "json", // 데이터 타입을 JSON으로 변경하였습니다.
        });
        return response.isValid; // 서버에서 받은 응답에서 isValid 속성을 참조합니다.
    };

    $("#submitBtn").click(async function (event) {
        event.preventDefault();
        
        const currentPassword = $("#current_password").val();
        const isCurrentPasswordValid = await checkCurrentPassword(currentPassword);

        if (isCurrentPasswordValid) {
            location.href = "/updateform";
        } else {
            $("#error").show();
        }
    });
</script>
</html>
