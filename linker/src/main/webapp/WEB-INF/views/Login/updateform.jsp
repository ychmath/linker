<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>정보 수정</title>
</head>
<body>
<h3>${user.id}님의 정보를 수정합니다.</h3>
<form action="update" method="post" id="updateform">
<input type="hidden" name="_method" value="put">
	<table>
		<tr><td>id</td><td>${user.id}</td></tr>
		<tr><td>password</td><td><input name="password" type="password" id="password" value="${user.password}"></td></tr>
		<tr><td>name</td><td><input name="name" id="name" value="${user.name}"></td></tr>
		<tr><td>birth</td><td><input name="birth" 
			value='<fmt:formatDate value="${user.birth}" pattern="yyyyMMdd"/>'
		></td></tr>
		<tr><td>address</td><td><input name="address" id="address" value="${user.address}">
					<input type="button" id="addbtn" value="우편번호 검색" onclick="addPost()"></td></tr>
	
		<tr><td colspan="2"><input type="submit" value="수정"></td></tr>
	</table>
</form>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function addPost(){
    new daum.Postcode({
        oncomplete: function(data) {
            	document.querySelector("#address").value = data.address;
            	alert("나머지 주소도 입력하세요.");
        }
    }).open();
}    

$(function(){
	$("#updateform").submit(function(){
		if(!$("#password").val()){
			alert("비밀번호를 입력해야 합니다.");
			return false;
		}
	});
})//ready

</script>

</body>
</html>