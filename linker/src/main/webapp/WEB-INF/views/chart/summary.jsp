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
			<p>*최근 3년간의 결과만 조회 가능합니다.</p><br>
			<select name="targetYear" id="targetYear"></select>
			<button type="button" id="search">검색</button>
		</form>
	</div>
	<hr>
	<h1>연간 요약</h1>
	<div>
		<%-- 차트가 들어갈 캔버스 생성 --%>
		<canvas width="600" height="400" id="myChart"></canvas>
	</div>
</div>
<script>
	$(function(){

		// 검색할 년도 지정: 최대 3년간 지정 가능
		let year = new Date().getFullYear();
		let startyear = year - 3;
		
		for (i = year; i > startyear; i--){
			// 최근 년도부터 3년간 지정한 결과를 option 태그로 선택할 수 있도록 지정.
			$('#targetYear').append($('<option/>').val(i).html(i));
		}
		
		// 매출 내역을 저장할 배열
		var saleResult = [];
		
		// 매입 내역을 저장할 내역
		var purchaseResult = [];
		
		// 순수익 저장 배열
		var netResult = [];

		// id가 myChart인 캔버스 지정
		var ctx = document.getElementById("myChart");

		// chart 변수로 차트 데이터를 만든다.
		var chart = new Chart(ctx, {
			type: 'bar',	// 디폴트 차트 타입 지정
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
					}	// 'y-left end'
				}	// scales end
			}	// option end
		});	// chart end

		// 검색 버튼 클릭 시
		$("#search").click(function() {
			// 매입/매출에 기본값 0 저장
			for(var i = 0; i < 12; i++){
				// 12칸의 배열을 형성, 각각 0을 배정한다.
				saleResult[i] = 0;
				purchaseResult[i] = 0;
			}

			// 매출, 매입 내역을 가져온다. when - done 처리로 ajax 데이터 저장이 끝난 후 차트에 적용되도록 한다.
		    $.when(
				$.getJSON("/getysResult", { targetYear : $('#targetYear').val() }, function(data){
					$.each(data, function(index, obj){
						// 배열의 index가 0부터 시작이므로 각 월의 값에서 1을 뺀 index에 각 월의 매출값을 저장한다.
						saleResult[obj.month - 1] = obj.totalSale;
					})
				}),	// 연간 매출 배열에 저장 완료

				$.getJSON("/getpResult", { targetYear : $('#targetYear').val() }, function(data){
					$.each(data, function(index, obj){
						purchaseResult[obj.month - 1] = obj.totalPurchase;
					})
				})	// 연간 매입 배열에 저장 완료

		    ).done(function () {
		    	// 매입과 매출 내역이 전부 저장되었다면 (매출 - 매입) 값을 순수익 배열에 저장한다.
				for(var i = 0; i < 12; i++){
					netResult[i] = saleResult[i]-purchaseResult[i];

				}
		    	// 차트에 가져온 데이터를 각각 업데이트한다.
		    	chart.update();
		    	});	// done end

		});	// click end

	});	// ready end
</script>
</body>
</html>