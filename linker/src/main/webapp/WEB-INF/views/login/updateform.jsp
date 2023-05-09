<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>회원정보 수정</title>
</head>
<body>
	<h3>${user.userid}님의 정보를 수정합니다.</h3>
	<form action="update" method="post" id="updateform">
	
	<table>
		<tr>
			<td>이름</td>
			<td><input type="text" name="name" id="name" value="${user.name }" readonly></td>
		</tr>
		
		<tr>
			<td>비밀번호</td>
			<td><input type="password" name="password" id="password"></td>
		</tr>
		
		<tr>
			<td>변경할 비밀번호</td>
			<td><input type="password" name="nw_password" id="nw_password"></td>
		</tr>
	
	</table>
	
	</form>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	
	
</body>
</html>