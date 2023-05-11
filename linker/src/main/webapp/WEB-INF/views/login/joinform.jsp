<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>회원 가입</title>
<style>
#input, #result {
	display: none;
}
</style>
</head>
<body>
	<h1>회원 가입</h1>
	<form action="insert" method="post" id="joinForm">
		<table>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" id="name"
					placeholder="실명을 입력해주세요." required></td>
			</tr>

			<tr>
				<td>아이디</td>
				<td><input type="text" name="userid" id="userid" 
					placeholder="아이디를 6~20자 이내로 입력하세요." required> 
				<input type="button" id="id_check" value="중복 확인"> 
				<span id="id_msg"></span></td>
			</tr>

			<tr>
				<td>비밀번호</td>
				<td><input type="text" name="password" id="password"
					placeholder="비밀번호를 6~20자 이내로 입력해주세요." required>
					<div id="pw_msg"></div></td>
			</tr>

			<tr>
				<td>비밀번호 확인</td>
				<td><input type="text" name="chk_password" id="chk_password"
					placeholder="비밀번호를 다시 입력해주세요." required></td>
			</tr>
	
			<tr>
				<td>권한</td>
				<td><select name="role">
					<option value="seller">판매자</option>
					<option value="buyer">구매자</option>
				</select></td>
			
			<tr>
				<td>회사 이메일</td>
				<td><input type="text" name="email" id="email" 
					placeholder="메일을 입력하세요." required>
					<div id="emailresult"></div> <input type="button" id="chk_email"
					value="메일 인증">
					<div id="input">
						<input id="ck_num"> <input type="button" id="ck_b"
							value="인증번호 확인">
					</div>
					<div id="result"></div></td>
			</tr>

			<tr>
				<td>전화번호</td>
				<td><input type="text" name="phone" id="phone"
					placeholder="전화번호를 입력해주세요."></td>
			</tr>

			<tr>
				<td colspan="2"><input type="submit" value="가입"></td>
			</tr>
		</table>
	</form>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
	$(function(){
		$("#id_check").click(function(){
			let id = $("#userid").val(); //.val()은 선택된 요소의 값을 가져오는 메서드
			if(!id){ //id변수에 값이 없는 경우. id변수에 값이 없으면 true를 반환
				$("#id_msg").html("아이디를 입력하세요")
				return false; //폼 제출을 막기 위해 false를 반환
			}
			
			
			
			$.ajax({
				url: "/idCheck", //서버로 보낼 요청 URL
				data: "id=" + id, //서버로 보낼 데이터, "id"변수의 값을 사용함
				datatype: "text" //서버로부터 받아올 데이터의 타입
			}).done( //ajax요청이 성공적으로 완료된 경우에 실행되는 함수
					function(data){
						if(data == ""){
							$("#id_msg").html("사용가능한 아이디 입니다.");
							$("#id_msg").append("<input type='hidden' id='id_ck' value='1'>");
							//value 속성이 1로 되어 있는데, 이는 중복 체크를 통과했다는 값을 의미
							//input태그를 추가하는 이유는 중복 체크각 성공했다는 값을 서버에서 받아오지 않고, 클라이언트에서 처리하기 위함
						}else{
						$("#id_msg").html("이미 사용중인 아이디입니다.");
						
							
						}
			})
			
		})	
		
		$("#joinform").submit(function() { //#joinform을 제출할 때 실행되는 함수
			if ($("#id_ck").val() != 1) { //1이 아니라면 중복 체크를 하지 않았다는 의미
				$("#id_msg").html("아이디 중복 체크 하셔야 합니다.")
				return false; //폼 제출을 막기 위해 false를 반환
			}
			if (!$("#password").val()) { //비밀번호가 없다면('false'이면)
				alert("비밀번호를 입력해야 합니다.");
				return false; //폼 제출을 막기 위해 false를 반환
			}
		})
	}) //ready
	
	let num = "";
	$(function(){
		$("#chk_email").click(function(){
			let email = $("#email").val();
			if(!email){
				$("#result").css("display", "block").html("메일 주소를 입력하세요.");
				return false;
			}
			$.ajax({
				url: "/send", // "/send"는 서버의 URL 주소를 의미
				data: "emailAddress" + email, //서버로 전송될 데이터를 의미
				dataType: "json"
			}).done(function(data){
				if(eval(data[1])){ //eval(): 문자열을 자바스크립트 코드로 실행시키는 함수
					//json 형태로 전송된 데이터의 두번째 인덱스 값을 eval()함수를 통해 실행
					num = data[0]; //서버로부터 받아온 데이터의 첫 번째 값을 num이라는 변수에 저장
					alert("메일이 전송되었습니다. 인증번호를 입력하세요.")
					$("#input, #result").css("display", "block");
				}
				
			})
		})

		$("#ck_b").click(function(){
			let ck_num = $("#ck_num").val();
			if(ck_num == num){
				$("#result").html("인증되었습니다.")
				$("#result").append("<input type='hidden' id='ck' value='1'>")
			}else{
				$("#result").html("인증 실패했습니다. 다시 확인해주세요.")
			}
		})
	})	
	</script>
</body>
</html>