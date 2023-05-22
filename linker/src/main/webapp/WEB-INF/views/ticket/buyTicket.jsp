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
			<td><img src="/img/ticketA.png" id="picA" width="50%"></td>
			<td><img src="/img/ticketB.png" id="picB" width="55%" style="display:none"></td>	
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
			<td><span id="totalPrice">6000</span>원</td>
		</tr>
		
		
		
		<tr>
			<td><input type="button" id="add" value="추가"></td>
		</tr>
		
		<tr>
			<td><span id="A"></span><input type="button" id="delete" value="삭제" style="display:none;"></td>
			
		</tr>
		
		<tr>
			<td><span id="B"></span><input type="button" id="delete2" value="삭제" style="display:none;"></td>
		</tr>
		
		<tr>
			<td>총합계</td>
			<td><span id="totalPrice2">0</span>원</td>
		</tr>
		
	</table>
	</div>
		<button id="kakaopay"><img src="/img/kakaopay.png"></button>
		
		<p>----------------------------------------------------------------------------------------------------</p>
		
		<h4>식권 상세 정보</h4>
			<div>
				<table>
					<tr>
						<td>식권A</td>
					</tr>
					<tr>
						<td>한식, 중식, 양식 코너에서 사용 가능</td>
					</tr>
					
					<tr>
						<td>식권B</td>
					</tr>
					
					<tr>
						<td>프리미엄 코너에서 사용 가능</td>
					</tr>
				</table>
			</div>
	</form>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
	
		$("#ticketType").change(function(){
			if($(this).val() == '6000'){
				$("#picA").show();
				$("#picB").hide();
			}else{
				$("#picA").hide();
				$("#picB").show();
			}
		})
	
	
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
			//totalPriceSpan.textContent = totalPrice.toLocaleString();
			totalPriceSpan.textContent = totalPrice.toString();
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
			//return totalPrice.toLocaleString();
			return totalPrice.toString();
		}
		
		$("#add").click(function(){	
			let a = $("#ticketType option:selected").text(); //option:selected=> 선택된 것
			const quantitySelectPrice = parseInt(quantitySelect.value);
			var A = $("#A").text();
			var B = $("#B").text();
			var deleteBtn = $("#delete");
			var deleteBtn2 = $("#delete2");
			
			if('A' == a){
				if(A != ""){
					alert("삭제하고 다시 추가해주세요.")
				}
				else{
				$("#A").append("<span class='p'> "+a+"</span>");
				$("#A").append("<span class='p'> "+quantitySelectPrice+"개</span>");
				$("#A").append("<span class='p' id='calculateATotalPrice2'> "+calculateTotalPrice2()+"원</span>");
				deleteBtn.show();
				}
				
			}else{
				if(B != ""){
					alert("삭제하고 다시 추가해주세요.")
				}
				else{
				$("#B").append("<span class='p'> "+a+"</span>");
				$("#B").append("<span class='p'> "+quantitySelectPrice+"개</span>");
				$("#B").append("<span class='p' id='calculateBTotalPrice2'> "+calculateTotalPrice2()+"원</span>");
				deleteBtn2.show();
				}
			}
				
			function calculateTotalPrice3() {
				 const totalPrice2Span = document.getElementById("totalPrice2");
				  
				  let aPrice = $("#calculateATotalPrice2").text();
				  let bPrice = $("#calculateBTotalPrice2").text();

				  /* $("#A .p:nth-child(3)").each(function () {
					//$("#A .p:nth-child(3)"): #A 이하의 요소들 중에서, 그 중에서 p 클래스를 가진 요소들 중에서 순서상 3번째에 해당하는 요소를 선택하는 jQuery 선택자 표현
				    //each(): jQuery에서 제공하는 반복문 함수. 선택한 요소들 각각에 대해 지정된 함수를 실행함
					aPrice += parseInt($(this).text());
				  });

				  $("#B .p:nth-child(3)").each(function () {
				    bPrice += parseInt($(this).text());
				  }); */
		
				  if(aPrice == ""){
					  aPrice = 0;
				  }
				  if(bPrice == ""){
					  bPrice = 0;
				  }
				    
				  const totalPrice = parseInt(aPrice) + parseInt(bPrice);
				
				  totalPrice2Span.textContent = totalPrice.toString();
			
			}
			return calculateTotalPrice3();
		})
			
			
			$("#delete").click(function(){
				const amount = parseInt($("#calculateATotalPrice2").text());
				//alert(amount);
				$("#A").text("");
				$(this).hide();
				updateTotalPrice3(amount);
			})
				
			
			$("#delete2").click(function(){
				const amount = parseInt($("#calculateBTotalPrice2").text())
				//alert(amount);
				$("#B").text("");
				$(this).hide();
				updateTotalPrice3(amount);
			})

 			function updateTotalPrice3(amount){
				const $totalPrice2 = parseInt($("#totalPrice2").text());
				//alert($totalPrice2)
				const totalAmount = $totalPrice2 - amount;
				$("#totalPrice2").text(totalAmount.toString());
			} 
	</script>
	
</body>
</html>