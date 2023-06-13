<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>식자재 수정하기</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<!-- Favicon -->
<link href="/img/favicon.ico" rel="icon">

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;500&family=Roboto:wght@500;700;900&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Dongle:wght@400;700&family=Noto+Sans+KR:wght@400;700&display=swap"
	rel="stylesheet">

<!-- Icon Font Stylesheet -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="/lib/animate/animate.min.css" rel="stylesheet">
<link href="/lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link href="/lib/lightbox/css/lightbox.min.css" rel="stylesheet">

<!-- Customized Bootstrap Stylesheet -->
<link href="/css/bootstrap.min.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="/css/style.css" rel="stylesheet">
</head>
<body>
	<h3>식자재 수정 폼입니다.</h3>
	<div id="page">

		<div class="content">
			<form id="updateIngredient" method="post"
				action="/ingredient/update/${ dto.ingredientid }">
				<input type="hidden" name="_method" value="put" /> <span>식자재명:
				</span><input type="text" name="ingredientname"
					value=${ dto.ingredientname }><br> <span>단위: </span> <span
					id="targetUnit" style="display: none;">${ dto.unit }</span> <select
					name="unit" id="unit">
					<option value="KG">KG</option>
					<option value="G">G</option>
					<option value="LB">LB</option>
					<option value="OZ">OZ</option>
				</select><br> <span>유통기한: </span><input type="date" name="exp"
					value="${ dto.exp }"><br> <input class="btn"
					type="button" id="save" value="수정">
			</form>
		</div>
	</div>

	<!-- JavaScript Libraries -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="/lib/wow/wow.min.js"></script>
	<script src="/lib/easing/easing.min.js"></script>
	<script src="/lib/waypoints/waypoints.min.js"></script>
	<script src="/lib/counterup/counterup.min.js"></script>
	<script src="/lib/owlcarousel/owl.carousel.min.js"></script>
	<script src="/lib/isotope/isotope.pkgd.min.js"></script>
	<script src="/lib/lightbox/js/lightbox.min.js"></script>

	<!-- Template Javascript -->
	<script src="/js/main.js"></script>

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