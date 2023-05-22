<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>회원 탈퇴</title>
</head>
<body>
<h3> 회원 탈퇴하려면 비밀번호를 입력해주세요</h3>
<c:if test="${result == false}">
<p>입력하신 비밀번호는 틀렸습니다.</p>
</c:if>
<form method="post" onsubmit="checkVal()" action="delete">
	<input type="hidden" name="_method" value="delete">
	<table><tr><td>password</td>
	<td><input type="password" name="formpw" id="password"></td></tr>
	<tr><td colspan="2"><input type="submit" value="탈퇴" ></td></tr>
	</table>
</form>
<script>
	function checkVal(){
		let pw = document.querySelector("#password").value;
		if(!pw){
			alert("비밀번호 입력하세요");
			return false;
		}
	}

</script>

</body>
</html>