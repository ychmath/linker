<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%String start_date = request.getParameter("start_date");
String end_date = request.getParameter("end_date");%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form>
<div>
<p><strong>지출 내역</strong><p><br>
	<table id="data-table">
		<tr>
			<th id="C">날짜</th>
		<td id="I">
<label class="text_obj">
	<input type="radio" name="date" value="today">
	<span>오늘</span>
</label>
	
<label class="text_obj">
	<input type="radio" name="date" value="1month">
	<span>1개월</span>
</label>	

<label class="text_obj">
	<input type="radio" name="date" value="3month">
	<span>3개월</span>
</label>

<label class="text_obj">
	<input type="radio" name="date" value="1year">
	<span>1년</span>
</label>

<label for="start-date-input"></label>
<input type="date" id="start-date-input" name="start-date" min="2021-01-01" max="" value=""	required>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
function search(){
	var start_date = document.getElementById('start-date-input').value;
	var end_date = document.getElementById('end-date-input').value;
	
	showSaledResult(start_date, end_date);
}
</script>
<script>
	$(function(){
		$("input[type='radio']").on("change", function(){
			var dateRange = $(this).val();
			var startDate = "";
			var endDate ="";
			
			switch (dateRange){
				case "today":
					sta
			}
			
			
		})
		
		
		
	}



</script>

	
	</table>

</div>




</form>
</body>
</html>