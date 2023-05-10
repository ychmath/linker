<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
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
    
</style>

<body>
<form:form>
<div> <!--  id="B" --> 
  <div> <!-- style="display:flex; align-items:center;" -->
  
  <p><strong>매출 내역</strong></p><br>
    <table>
      <tr>
        <th id="C">날짜</th>
      <td id="I">
   <label class="test_obj">
    <input type="radio" name="date">
    <span>오늘</span>
</label>
 
<label class="test_obj">
    <input type="radio" name="date">
    <span>1개월</span>
</label>
 
<label class="test_obj">
    <input type="radio" name="date">
    <span>3개월</span>
</label>
<label class="test_obj">
    <input type="radio" name="date">
    <span>1년</span>
</label>
 <label for="start-date-input"></label>
<input type="date" id="start-date-input" name="start-date" min="2021-01-01" max="" value="" required>

<label for="end-date-input"><a id="P">~</a></label>
<input type="date" id="end-date-input" name="end-date" min="" max="" value="" required>

<script>
  // 오늘 날짜 생성
  const today = new Date().toISOString().split('T')[0];
  // input 요소의 max 속성에 오늘 날짜 설정
  document.getElementById('start-date-input').max = today;
  document.getElementById('end-date-input').max = today;
  // input 요소의 min 속성에 시작 날짜 설정
  document.getElementById('end-date-input').min = document.getElementById('start-date-input').value;
  // 시작 날짜가 변경되면 종료 날짜의 min 속성을 변경하여 시작 날짜 이전의 날짜를 선택하지 못하도록 함
  document.getElementById('start-date-input').addEventListener('change', function() {
    document.getElementById('end-date-input').min = this.value;
  });
</script>
<button id="myButton">버튼</button>

<script>
  const button = document.getElementById('myButton');
  button.addEventListener('click', function() {
    alert('버튼이 클릭되었습니다!');
  });
</script>
    </th></tr>
   </table> <br>
  </div>
	<div>
	<table>
		<tr>
		<th scope="col">식권주문ID</th>
		<th scope="col">식권종류</th>
		<th scope="col">수량</th>
		<th scope="col">총 가격</th>
		<th scope="col">주문 일자</th>
	</tr>
	<tr>
		<td>202302286A1</td>
		<td>A</td>
		<td>32</td>
		<td>192,000</td>
		<td>2023-02-28</td>
	</tr>
	<tr>
		<td>202302216B1</td>
		<td>B</td>
		<td>26</td>
		<td>182,000</td>
		<td>2023-02-21</td>
	</tr>
	<tr>
	<td>202302156B1</td>
		<td>B</td>
		<td>14</td>
		<td>98,000</td>
		<td>2023-02-15</td>
	</tr>
	<tr>
	<td>202302096B1</td>
		<td>A</td>
		<td>21</td>
		<td>126,000</td>
		<td>2023-02-09</td>
	</tr>
	</table>
	</div>
</div>
${plist }
 </form:form>
</body>
</html>