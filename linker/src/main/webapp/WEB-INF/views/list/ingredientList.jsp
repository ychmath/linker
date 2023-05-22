<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>식자재 리스트</title>
<style>
#center {
	width: 700px;
	margin-left: auto;
	margin-right: auto;
}

table {
	border: 1px solid black;
	width: 700px;
	border-collapse: collapse;
}

th {
	border: 1px solid black;
	background-color: orange;
	width: 150px;
}

td{
	border: 1px solid black;
}

a {
	margin: 10px auto;
}

#page {
	text-align: center;
}

.title{
	text-align: center;
}

.searchController{
	float: right;
	margin: 10px auto;
}
</style>
</head>
<body>
	<div id="center">
		<div class="title"><h1>식자재 목록</h1></div>
		<div class="searchController">
			<form id="searchByName" action="/ingredient/searchbyname/result" method="get" style="display: inline-block;">
				<p><b>이름별 검색</b></p>
				<input type="search" name="name" id="name">
				<input type="button" id="search-name" value="검색">
			</form>
			<form id="searchByDate" action="/ingredient/searchbydate/result" method="get" style="display: inline-block;">
			<p><b>유통기한별 검색</b></p>
			<input type="date" class="exp" name="startDay" id="startDay"> - <input type="date" class="exp" name="endDay" id="endDay">
			<input type="button" id="search-date" value="검색">
			</form>
		</div>
		<div class="content">
		<c:if test="${ count != 0 }">
			<table id="IngredientList">
				<tr>
					<th>식자재명</th>
					<th>단위</th>
					<th>유통기한</th>
				</tr>
				<c:forEach items="${ ingredientList }" var="ingredient">
					<tr>
						<td>${ ingredient.ingredientname }</td>
						<td>${ ingredient.unit }</td>
						<td>${ ingredient.exp }</td>
					</tr>
				</c:forEach>
			</table>
			<div id="page">
				<c:if test="${ begin > end }">
					<a href="ingredientList?p=${ begin-1 }">[이전]</a>
				</c:if>
				<c:forEach begin="${ begin }" end="${ end }" var="i">
					<a href="ingredientList?p=${ i }">${ i }</a>
				</c:forEach>
				<c:if test="${ end < totalPages }">
					<a href="ingredientList?p=${ end + 1 }">[다음]</a>
				</c:if>
			</div>
		</c:if>
		<c:if test="${ count == 0 }">
			입력된 식자재가 존재하지 않습니다.
		</c:if>
		</div>	<%-- content end --%>
	</div>	<%-- center end --%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(function(){
		$("#search-name").click(function(){
			
			let name = $("#name").val();
						
			if (!name || name.replace(/\s+/g, "") == "") {
				alert("검색값을 입력해 주세요.");
				$("#name").focus();
				return false;
			}
			
			$("#searchByName").submit();

		});	// search click end

		$("#search-date").click(function(){

			let startDay = $("#startDay").val();
			let endDay = $("#endDay").val();

			if (!startDay || !endDay || endDay < startDay) {
				alert("올바른 날짜값을 입력해 주세요.");
				$("#startDay").focus();
				return false;
			}

			$("#searchByDate").submit();

		});	// search click end
		
		var nameSearchResult = [];
		var expSearchResult = [];

	});	// ready end
</script>
</body>
</html>