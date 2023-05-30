<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<title>식권 사용</title>

</head>
<body>
	<h1>식권 사용</h1>
	<!-- 임시 제목이에요 -->
	<div>
		<!-- 식권 사용을 위한 폼 -->
		<form id="phone-form">
			<table>
				<tr>
					<td>식권 종류</td>
					<td><select id="selected">
							<option selected disabled>선택</option>
							<c:forEach items="${tickettypename}" var="type">
								<option value="${type.tickettypeid}">${type.tickettypename}</option>
							</c:forEach>
					</select></td>
				</tr>
				<tr>
					<td>전화번호 입력</td>
					<td><input type="text" id="phone" name="phone" oninput="oninputPhone(this);"></td>
				</tr>
				<tr>
					<td><input type="submit" id="use" value="식권 사용"></td>
				</tr>
			</table>
		</form>

		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<script>
			
			$(function() {
				
	            function oninputPhone(target) {
	                target.value = target.value
	                    //.replace(/[^0-9]/g, '')
	                    .replace(/^(\d{3})(\d{4})(\d{4})$/, `$1-$2-$3`);
	            }
	            
				$("#phone-form").submit(function(e) {
					e.preventDefault();
					useMealTicket();
				});
			});


            
			function useMealTicket() {
				var tickettypename = $("#selected").val();
				var quantity = 1;
				var phone = $("#phone").val();

				// 식권 종류 미선택 시 출력
				if (!tickettypename) {
					alert("식권 종류를 선택하세요");
					return;
				}

				// 전화번호 미입력 시 출력
				if (!phone) {
					alert("전화번호를 입력하세요.");
					return;
				}

				// AJAX 요청으로 백엔드와 통신하여 식권 사용 처리할 수 있도록 코드 다음과 같이 넣어야 함
				$.ajax({
					type : "POST",
					url : "/phone/use",
					data : {
						"tickettypename" : tickettypename,
						"quantity" : quantity,
						"phone" : phone
					},
					success : function(result) {
						if (result == true) {
							alert("식권이 정상적으로 사용되었습니다.");
							$('#phone-form')[0].reset();
						} else {
							alert("식권 사용 중 서버 오류가 발생했습니다.");
						}
					},
					error : function(err) {
						alert("식권 사용 중 통신 오류가 발생했습니다.");
					}
				});
			}
		</script>
	</div>
</body>
</html>