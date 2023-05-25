<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>식자재 수정하기</title>
</head>
<body>
	<h3>식자재 수정 폼입니다.</h3>
	<div>
		<form id="updateIngredient" method="post" action="/ingredient/update/${ dto.ingredientid }">
		<input type="hidden" name="_method" value="put"/>
			<span>식자재명: </span><input type="text" name="ingredientname" value=${ dto.ingredientname }><br>
			<span>단위: </span>
				<span id="targetUnit" style="display: none;">${ dto.unit }</span>
				<select name="unit" id="unit">
					<option value="KG">KG</option>
					<option value="G">G</option>
					<option value="LB">LB</option>
					<option value="OZ">OZ</option>
				</select><br>
			<span>유통기한: </span><input type="date" name="exp" value="${ dto.exp }"><br>
			<input type="button" id="save" value="수정">
		</form>
	</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(function(){
		// 기존에 가지고 있던 unit 값을 가져오고 default select 값으로 지정한다.
		$("#unit").val($("#targetUnit").text()).prop("selected", true);
		
		$("#save").click(function(event){
			// form의 데이터를 문자열(ajax데이터) 변경
			var params = $("#updateIngredient").serialize();
			// ajax 데이터 전송
			$.ajax({
				url: "/ingredient/update/" + ${ dto.ingredientid },
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
	});	// ready end
</script>
</body>
</html>