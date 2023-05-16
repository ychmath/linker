<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>식단표 입력</title>
<style>
	table {
		border: 1px solid black;
		border-collapse : collapse;
		width: 500px;
		height: 500px;
	}
	textarea {
		resize: none;
		width: 90%;
		height: 90%;
		border: 0;
	}
	div.insertTable {
		display: flex;
		justify-content: center;
	}
</style>
</head>
<body>
<div class="container">
	<p id="title">식단표 작성하기</p>
	<form method="post" id="writeForm">
		<span id="menu"></span>
		<input type="submit" value="식단표 등록">
	</form>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	// 테이블 생성
	var html = "";
	html += "<input type=\'text'\ name=\'title'\>"

	html += "<table border=\'1\'>";
	for(var row = 0; row < 4; row++) {
		html += "<tr>";
		for (var colum = 0; colum < 7; colum++) {
			html += "<td><div class=\'insertTable'\><textarea name=\'content'\ rows=\'10'\></textarea></div></td>";
		}
		html += "</tr>";
	}
	html += "</table>";

	$("#menu").html(html);
	
	$("time").on("click", function(event){
		var iframe = $("#forPostMenu")
	});
</script>
</body>
</html>