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
<link href="/css/user/inquiry.css" rel="stylesheet">
<title>식권 사용 내역</title>
</head>

<body>
<form action="${pageContext.request.contextPath}/ticket/filtered_data_u" method="get">
<div>
	<div>
<p><strong>식권 사용 내역</strong></p><br>
	<table id="data-table">
		<tr>
			<th id="C">사용 일자</th>
			<td id="I">
	<label class="test_obj">
		<input type="radio" name="date" value="today">
		<span>오늘</span>
		</label>
		
		<label class="test_obj">
    <input type="radio" name="date" value="1month">
    <span>1개월</span>
</label>
 
<label class="test_obj">
    <input type="radio" name="date" value="3month">
    <span>3개월</span>
</label>
<label class="test_obj">
    <input type="radio" name="date" value="1year">
    <span>1년</span>
	</label>

<label for="start-date-input"></label>
<input type="date" id="start-date-input" name="start-date" min="2021-01-01" max="" value="" required>

<label for="end-date-input"><a id="P">~</a></label>
<input type="date" id="end-date-input" name="end-date" min="" max="" value="" required>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

	<script>
	function search() {
	    var start_date = document.getElementById('start-date-input').value;
	    var end_date = document.getElementById('end-date-input').value;
	    showSaledResult(start_date, end_date);   
	}
	</script>
	<button type="button" id="myButton" onclick="search()">검색 </button>

	<script>
	function resetSearch(){
		
		location.assign("${pageContext.request.contextPath}/ticketuse/ticket");
	}
	$(function(){
	    $("input[type='radio'][name='date']").on("change", function(){
	        var dateRange =  $(this).val();
	        var startDate = "";
	        var endDate = "";

	        // dateRange에 따라 startDate와 endDate값을 설정합니다.
	        switch (dateRange) {
	          case "today":
	            startDate = new Date();
	            endDate = new Date();
	            break;
	          case "1month":
	            startDate = new Date();
	            startDate.setMonth(startDate.getMonth() - 1);
	            endDate = new Date();
	            break;
	          case "3month":
	            startDate = new Date();
	            startDate.setMonth(startDate.getMonth() - 3);
	            endDate = new Date();
	            break;
	          case "1year":
	            startDate = new Date();
	            startDate.setFullYear(startDate.getFullYear() - 1);
	            endDate = new Date();
	            break;
	        }

	        var startYear = startDate.getFullYear();
	        var startMonth = startDate.getMonth() + 1 < 10 ? "0" + (startDate.getMonth() + 1) : startDate.getMonth() + 1;
	        var startDateNum = startDate.getDate() < 10 ? "0" + startDate.getDate() : startDate.getDate();
	        var endYear = endDate.getFullYear();
	        var endMonth = endDate.getMonth() + 1 < 10 ? "0" + (endDate.getMonth() + 1) : endDate.getMonth() + 1;
	        var endDateNum = endDate.getDate() < 10 ? "0" + endDate.getDate() : endDate.getDate();

	        var startDateStr = startYear + "-" + startMonth + "-" + startDateNum;
	        var endDateStr = endYear + "-" + endMonth + "-" + endDateNum;

	        showSaledResult(startDateStr, endDateStr);
	    });
	});

	function showSaledResult(start, end) {
		 $.ajax({
		        url: "./filtered_data_u",
		        data: {
		            "start-date": start,
		            "end-date": end
		        },
		        type: "GET",
		        dataType:"json",
		        success: function (data) {
		            updateTableWithNewData(data);
		        },
		        error: function (error) {   
		            console.log(error);
		        }
		    });
		}

		function updateTableWithNewData(data) {
		    var table_data = '';
		    //$.each(data, function (index, ticket) {
		    	
		    	for (var i = 0; i < data.length; i++){
		        let ticket = data[i];
		    	table_data += '<tr>';
		        table_data += "<td>"+ new Date(ticket.usedate).toISOString().split('T')[0] +"</td>";
		        table_data += '<td>'+ ticket.tickettypename +'</td>';
		        table_data += '<td>'+ ticket.quantity +'</td>';
		        table_data += '</tr>';
		    	}
		    //});

		    $("#saled").empty();
		    $("#saled").append(table_data);
		}
		</script>
		<button type="button" class="resetButton" onclick="resetSearch()">X</button>
	   </tr>
	</table><br>	
	</div>
	<div>
	<table>
	<thead>
	<tr>
		<th scope="col">사용 일자</th>
		<th scope="col">식권 종류</th>
		<th scope="col">수량</th>
	</tr>
	</thead>
	<tbody id="saled">
	<c:forEach items="${tulist}" var="ticketu">
		<tr>
			<td><fmt:formatDate value="${ticketu.usedate}" pattern="yyyy-MM-dd" /></td>
			<td>${ticketu.tickettypename}</td>
			<td>${ticketu.quantity}</td>
		</tr>
	</c:forEach>
		</tbody>	
	</table>
	
	</div>
</div>
</form>
</body>
</html>