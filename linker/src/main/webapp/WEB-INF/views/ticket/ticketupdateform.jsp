<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>식권 수정</title>
<link href="/css/style.css" rel="stylesheet">
<link href="/css/comm/basicform.css" rel="stylesheet">

</head>
<body>
<div class="center-wrapper content-wrapper">
		<form id="updateTickettype" method="post"
			action="/ticket/update/${ dto.tickettypeid }">
			<input type="hidden" name="_method" value="put" />
			 <div class="commform">
			<h2>식권 수정</h2>
				<div class="comm_field">
					<span>식권 이름&nbsp; &nbsp; </span><input type="text"
						name="tickettypename" value=${ dto.tickettypename }>
				</div>
				<div class="comm_field">
					<span>가격&nbsp; &nbsp; </span><input type="text" name="price"
						value=${ dto.price }>
				</div>
				<br>
				<button class="submit" id="save" type="submit" >수정</button>
			</div>
		</form>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
$(function(){
		// 기존에 가지고 있던 unit 값을 가져오고 default select 값으로 지정한다.
		
		$("#save").click(function(event){
			// form의 데이터를 문자열(ajax데이터) 변경
			var params = $("#updateTickettype").serialize();
			// ajax 데이터 전송
			$.ajax({
				url: "/ticket/update/" + ${ dto.tickettypeid },
				type: "post",
				data: params,
				success:function(){
					// 성공했다면 alert 창을 열고 부모 창을 새로고침한 뒤 팝업창이 닫힌다.
					alert("수정을 완료했습니다.");
				    opener.location.reload();
					self.close();
				}
			});
			
		});
	});

</script>
</body>
</html>