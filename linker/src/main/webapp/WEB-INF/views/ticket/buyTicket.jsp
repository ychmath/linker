<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>식권 구매 페이지</title>
<style>
#kakaopay{
	background-color: white;
	border: none;
}

</style>
</head>
<body>
	<h1>식권 구매</h1>
	
	<form method="post" action="/orderinfo/purchaseList">
	<div>
	<table>
	
		<tr>
			<th>A: 6,000원</th>
			<th>B: 7,000원</th>
		</tr>
		
		<tr>
			<td>식권 종류</td>
			<td><select id="ticketType" name="ticketType">
				<option id="a" value="6000">A</option>
				<option id="b" value="7000">B</option>
				</select></td>
		</tr>
		
		<tr>
			<td>수량</td>
			<td><select id="quantity" name="quantity">
				<option>1</option>
				<option>2</option>
				<option>3</option>
				<option>4</option>
				<option>5</option>
				<option>6</option>
				<option>7</option>
				<option>8</option>
				<option>9</option>
				<option>10</option>
				<option>11</option>
				<option>12</option>
				<option>13</option>
				<option>14</option>
				<option>15</option>
				<option>16</option>
				<option>17</option>
				<option>18</option>
				<option>19</option>
				<option>20</option>
				</select>개</td>

		</tr>
			
		
			
		<tr>
			<td>합계</td>
			<td><span id="totalPrice">6,000원</span></td>
		</tr>
		
		
		
		<tr>
			<td><input type="button" id="add" value="추가"></td>
		</tr>
		
		<tr>
			<td><span id="A"></span></td>
		</tr>
		
		<tr>
			<td><span id="B"></span></td>
		</tr>
		
	</table>
	</div>
		<button id="kakaopay"><img src="/img/kakaopay.png"></button>
	</form>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
 	 	//select태그와 span태그를 가져옴 
		const ticketTypeSelect = document.getElementById("ticketType");
		//const: 상수 값 
		const quantitySelect = document.getElementById("quantity");
		const totalPriceSpan = document.getElementById("totalPrice");
	
		function calculateTotalPrice(){
			const ticketTypePrice = parseInt(ticketTypeSelect.value);
			//ticketTypeSelect 객체에서 현재 선택된 option의 value값을 가져와서 parseInt() 함수를 통해 정수형으로 변환한 후 ticketTypePrice 변수에 저장
			//value값이 A가 아니라 6000이어야 되기 때문
			const quantitySelectPrice = parseInt(quantitySelect.value);
			//toLocaleString(): 숫자를 지역화된 문자열로 변환하여 반환하는 메서드.
			//즉, 해당 지역에서 사용하는 언어와 통화에 맞게 변환하여 문자열로 반환함
			const totalPrice = ticketTypePrice * quantitySelectPrice;
			totalPriceSpan.textContent = totalPrice.toLocaleString() + "원";
		} 
		//이벤트를실행할타겟.addEventListener('이벤트타입', 실행할함수);
		//이벤트 리스너는 사용자가 DOM 요소에 특정 이벤트를 발생시켰을 때 호출되는 함수
		ticketTypeSelect.addEventListener("change", calculateTotalPrice);
		quantitySelect.addEventListener("change", calculateTotalPrice);
		
		function calculateTotalPrice2(){
			const ticketTypePrice = parseInt(ticketTypeSelect.value);
			//ticketTypeSelect 객체에서 현재 선택된 option의 value값을 가져와서 parseInt() 함수를 통해 정수형으로 변환한 후 ticketTypePrice 변수에 저장
			//value값이 A가 아니라 6000이어야 되기 때문
			const quantitySelectPrice = parseInt(quantitySelect.value);
			//toLocaleString(): 숫자를 지역화된 문자열로 변환하여 반환하는 메서드
			//즉, 해당 지역에서 사용하는 언어와 통화에 맞게 변환하여 문자열로 반환함
			const totalPrice = ticketTypePrice * quantitySelectPrice;
			return totalPrice.toLocaleString() + "원";
		}
		
		$("#add").click(function(){	
			let a = $("#ticketType option:selected").text(); //option:selected=> 선택된 것
			const quantitySelectPrice = parseInt(quantitySelect.value);
			
			if('A' == a){
				$("#A").append("<span class='p'> "+a+"</span>");
				$("#A").append("<span class='p'> "+quantitySelectPrice+"</span>");
				$("#A").append("<span class='p'> "+calculateTotalPrice2()+"</span>");
			}else{
				$("#B").append("<span class='p'> "+a+"</span>");
				$("#B").append("<span class='p'> "+quantitySelectPrice+"</span>");
				$("#B").append("<span class='p'> "+calculateTotalPrice2()+"</span>");
			}
		})
		
		
	</script>
	
</body>
</html>