<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이름으로 식자재 검색하기</title>
<style>
	#center {
		width: 700px;
		margin-left: auto;
		margin-right: auto;
		align-content: center;
	}
	
	#title {
		width: 500px;
		margin-left: auto;
		margin-right: auto;
		align-content: center;
	}
	
	form {
		width: 500px;
		margin-left: auto;
		margin-right: auto;
		align-content: center;
	}
</style>
</head>
<body>
	<div id="center">
		<div id="title"><h1>이름으로 식자재 검색</h1></div>
		<form id="searchByName" action="/ingredient/searchbyname/result" method="get">
			<p><b>검색할 식자재 이름을 입력하세요.</b></p>
			<input type="search" name="name" id="name">
			<input type="button" id="search" value="검색">
		</form>
	</div>
</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(function(){
		$("#search").click(function(){
			
			let name = $("#name").val();
			
			console.log(name);
			
			if (!name || name.replace(/\s+/g, "") == "") {
				alert("검색값을 입력해 주세요.");
				$("#name").focus();
				return false;
			}
			
			$("#searchByName").submit();

		});	// search click end
	});	// ready end
</script>
</html>