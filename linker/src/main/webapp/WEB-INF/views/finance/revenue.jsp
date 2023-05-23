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
<title>지출 내역</title>
</head>
<style>
#B {
  width: 800px;
  height: 400px; /* 수정된 높이값 */
  border-top: 1px solid #444444;
  padding: 10px;
  text-align: center;
  border-collapse: collapse;
  display: block;
  margin: 0 auto; 
}
#C{
border-bottom: 1px solid #444444;
    padding: 10px;
}
 table {
    width: 100%;
    border-top: 1px solid #444444;
    border-collapse: collapse;
  }
  th, td {
    border-bottom: 1px solid #444444;
    border-left: 1px solid #444444;
    padding: 10px;
  }

  th{
   background-color: #D9D9D9;
  
  }
  td{
  	text-align: center;
  }
  th:first-child, td:first-child {
    border-left: none;
  }
#B > div {
  width: 100%;

  box-sizing: border-box; /* border와 padding을 포함한 크기를 지정합니다. */
  float: left; /* 좌우 정렬을 위해 float 속성을 사용합니다. */
}
#B > div:first-child {
  padding-right: 104px; /* 첫 번째 div 요소 오른쪽에 10px의 padding을 추가합니다. */
}
#B > div:last-child {
  padding-left: 10px; /* 마지막 div 요소 왼쪽에 10px의 padding을 추가합니다. */
}
#B table {
  width: 100%;
  height: 100%;
}
.test_obj input[type="radio"] {
        display: none;
    }
 
    .test_obj input[type="radio"] + span {
        display: inline-block;
/*         padding: 15px 10px;
 */        border: 1px solid #dfdfdf;
        background-color: #ffffff;
        text-align: center;
        cursor: pointer;
         width: 60px;
  		height: 30px;
  		float: left;
        
    }
 
    .test_obj input[type="radio"]:checked + span {
        background-color: #113a6b;
        color: #ffffff;
    }
    #start-date-input{
    	float:left;
    }
    #end-date-input{
    	float:left;
    }
    
    #P{
     float:left;
    }
  	#myButton{
  	float:left;
  	}
  	.resetButton{
  	display: inline-block;
  	background-color:#ffffff;
  	padding: 2px 4px;
  	border: 1px solid #ccc;
  	cursor:pointer;
  	margin-left: 10px;
  	
  	}
  	.resetButton{
  	display: inline-block;
  	background-color: #ffffff;
  	padding: 2px 4px;
  	border: 1px soild #ccc;
  	cursor: pointer;
  	margin-left: 10px;
  	}
  	.resetButton:hover{
  	background-color: #e0e0e0;
  	}
  	
    
</style>
<body>
<%-- <form:form> --%>
<form action="${pageContext.request.contextPath}/finance/filtered_data_i" method="get">
<div> <!--  id="B" --> 
  <div> <!-- style="display:flex; align-items:center;" -->
  
  <p><strong>지출 내역</strong></p><br>
    <table id="data-table">
      <tr>
        <th id="C">날짜</th>
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

    //window.location.href = `./finance/filtered_data?start_date=${start_date}&end_date=${end_date}`;}
    showSaledResult(start_date, end_date);   
}

</script>
<button type="button" id="myButton" onclick="search()">검색 </button>

<script>

function resetSearch(){
	
	location.assign("${pageContext.request.contextPath}/revenue/ingredient");

}

$(function(){
    $("input[type='radio'][name='date']").on("change", function(){
    	alert("test");
        var dateRange =  $(this).val();
        var startDate = "";
        var endDate = "";
			
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
	        url: "./filtered_data_i",
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
	    //$.each(data, function (index, profit) {
	    	
	    	for (var i = 0; i < data.length; i++){
	        let revenue = data[i];
	    	table_data += '<tr>';
	        table_data += '<td>'+ revenue.orderid+'</td>';
	        table_data += '<td>'+ revenue.ingredientname +'</td>';
	        table_data += '<td>'+ revenue.price+'</td>';
	        table_data += "<td>"+ new Date(revenue.orderdate).toISOString().split('T')[0] +"</td>";
	        
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
		<th scope="col">발주 번호</th>
		<th scope="col">식자재 이름</th>
		<th scope="col">총 가격</th>
		<th scope="col">주문 일자</th>
	
	</tr>
	</thead>
	<tbody id = "saled">
	<c:forEach items="${Ilist}" var="revenue">
	<tr>
		<td>${revenue.orderid}</td>
		<td>${revenue.ingredientname}</td>
		<td>${revenue.price}</td>    
		<td><fmt:formatDate value="${revenue.orderdate}" pattern="yyyy-MM-dd" /></td>

	</tr>
	</c:forEach>
	</tbody>
	</table>
	</div>
</div>




</form>
</body>
</html>