<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>식권 수정</title>
<link href="/css/user/ticketupdate.css" rel="stylesheet">

</head>
<body>
	<h3 style="text-align: center;">식권 수정</h3>
	<div class="TicketUpdateController">

		<form id="updateTickettype" method="post"
			action="/ticket/update/${ dto.tickettypeid }">
			<input type="hidden" name="_method" value="put" />
			<div id="intable">
				<div class="ticket-info">
					<span>식권 이름&nbsp; &nbsp; </span><input type="text"
						name="tickettypename" value=${ dto.tickettypename }>
				</div>
				<div class="ticket-info">
					<span>가격&nbsp; &nbsp; </span><input type="text" name="price"
						value=${ dto.price }>
				</div>
				<br>
				<div class="frame">
					<input type="button" id="save" class="custom-btn btn-10" value="수정">
				</div>
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