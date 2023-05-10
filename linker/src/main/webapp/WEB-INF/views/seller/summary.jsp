<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비용 관리</title>
</head>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<body>
<div class="container">
	<div>
		<form id="searchYear">
			<select name="targetYear" id="targetYear"></select>
			<button type="button" id="search">검색</button>
		</form>
	</div>
	<hr>
	<h1>연간 요약</h1>
	<div>
		<canvas width="600" height="400" id="myChart"></canvas>
	</div>
</div>
<script>
	$(function(){
		// 검색할 년도 지정: 최대 3년간 지정 가능
		let year = new Date().getFullYear();
		let startyear = year - 3;
		
		for (i = year; i > startyear; i--){
			$('#targetYear').append($('<option/>').val(i).html(i));
		}
		
		// 판매 저장할 배열
		var saleResult = [];
		
		// 매입 저장할 내역
		var purchaseResult = [];
		
		
		// 순수익
		var netResult = [];

		var ctx = document.getElementById("myChart")
		var chart = new Chart(ctx, {
			type: 'bar',
			data: {
				labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
				datasets: [{
					label: '총수익',
					yAxisID: 'y-left',
					backgroundColor: 
		                'rgba(255, 99, 132, 0.2)',
		            borderColor: 
		                'rgba(255, 99, 132, 1)',
		            borderWidth: 1,
		            data: saleResult
				},
				{
					label: '총지출',
					yAxisID: 'y-left',
		            backgroundColor: 
		                'rgba(75, 192, 192, 0.2)',
		            borderColor: 
		                'rgba(75, 192, 192, 1)',
		            borderWidth: 1,
		            data: purchaseResult
				},
				{
					label: '순수익',
					yAxisID: 'y-left',
					type: 'line',
					fill: false,
					lineTension: 0,
					pointRadius: 0,
					backgroundColor: 'rgb(255, 204, 0)',
					borderColor: 'rgb(255, 204, 0)',
					data: netResult
				}]
			},	// data end
			options: {
				responsive: true,
				maintainAspectRatio: false,
				scales: {
					x: {
						title: {
							display: false,
							text: '월'
						}
					},
					'y-left': {
						type: 'linear',
						position: 'left',
						title: {
							display: true,
							text: '금액'
						},
						grid: {
							display: false
						},
						padding: {
							top: 30,
							left: 0,
							right: 0,
							bottom: 0
						}
					}
				}
			}	// option end
		});	// chart end
		
		// 검색 버튼 클릭 시
		$("#search").click(function() {
		    /* chart.data.datasets.forEach((dataset) => {
		        dataset.data.pop();
		    }); */
		    
			for(var i = 0; i < 12; i++){
				saleResult[i] = 0;
				purchaseResult[i] = 0;
			}

			$.getJSON("/getysResult", { targetYear : $('#targetYear').val() }, function(data){
				$.each(data, function(index, obj){
					saleResult[obj.month - 1] = obj.totalSale;
				})
			})	//ysR
			
			$.getJSON("/getpResult", { targetYear : $('#targetYear').val() }, function(data){
				$.each(data, function(index, obj){
					purchaseResult[obj.month - 1] = obj.totalPurchase;
				})
				
				for(var i = 0; i < 12; i++){
					netResult[i] = saleResult[i]-purchaseResult[i];
				}
			})	// getpR

			
			

			
			console.log(saleResult);
			console.log(purchaseResult);

			console.log(netResult);
		    chart.update();
		});	// click end
		

	});	// ready end
</script>
</body>
</html>