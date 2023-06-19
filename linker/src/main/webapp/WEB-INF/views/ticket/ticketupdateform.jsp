<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>식권 수정</title>
</head>
<body>
	<h3>식권 수정</h3>
	<div>
		<form id="updateTickettype" method="post"
			action="/ticket/update/${ dto.tickettypeid }">
			<input type="hidden" name="_method" value="put" /> <span>식권
				이름: </span><input type="text" name="tickettypename"
				value=${ dto.tickettypename }><br> <span>가격: </span><input
				type="number" name="price" value=${ dto.price }><br> <input
				type="button" id="save" value="수정">
		</form>
	</div>

	<!-- Footer Start -->
	<div class="container-fluid bg-dark text-light footer mt-0 pt-0">
		<div class="container">
			<div class="copyright">
				<div class="row">
					<div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
						&copy; <a class="border-bottom" href="#">Linker</a>, All Right
						Reserved.
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Footer End -->
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