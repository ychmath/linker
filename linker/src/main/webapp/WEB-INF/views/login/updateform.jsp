<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>회원정보 수정</title>
<style>
	#name{
		background-color: gray;
	}
	
	#email{
		background-color: gray;
	}
	
	#role{
		background-color: gray;
	}
</style>
</head>
<body>
	<h3>${user.userid}님의정보를 수정합니다.</h3>
	<form action="update" method="post" id="updateform">
		<!-- action속성을 update로 설정하여 /update URL로 요청을 보냄 -->
		<input type="hidden" name="_method" value="put">
		<!-- 
		<form>태그에서는 기본적으로 HTTP GET 요청을 보내게 되어있음
		하지만 method 속성을 사용하여 HTTP 요청 메서드를 지정할 수 있음
		1. method 속성을 post로 설정하여 HTTP POST 요청을 보냄
		2. input 태그에서 name 속성을 _method로, value 속성을 put으로 설정하여 HTTP POST 요청을 HTTP PUT 요청으로 변환
		 -->

		<table>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" id="name"
					value="${user.name }" readonly></td>
			</tr>

			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="password" id="password"></td>
			</tr>

			<tr>
				<td>이메일</td>
				<td><input type="text" name="email" id="email"
					value="${user.email }" readonly></td>
			</tr>

			<tr>
				<td>권한</td>
				<td><input type="text" name="role" id="role"
					value="${user.role }" readonly></td>
			</tr>
			
			<tr>
				<td><input type="submit" value="수정"></td>
			</tr>
		</table>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
	$(function(){
		$("#updateform").submit(function(){
			if(!$("#password").val()){
				alert("비밀번호를 입력해야 합니다.");
				return false;
				}
			})
		})
	</script>
</form>

</body>
</html>