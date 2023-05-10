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
    <canvas id="myChart"></canvas>
</div>
<script>
	$(function(){
		let year = new Date().getFullYear();
		let startyear = year - 3;
		
		for (i = year; i > startyear; i--){
			$('#targetYear').append($('<option/>').val(i).html(i));
		}

		$("#search").click(function() {
			$.getJSON("/getYearResult", { targetYear : $('#targetYear').val() }, function(data){
				$.each(data, function(index, obj){
					console.log(obj.yearlyTotal + ' : ' + obj.totalSale)
				})
			})
		});	// click end

		var ctx = document.getElementById("myChart")
		let chart = new Chart(ctx, {
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
		            data: [18, 23, 22, 16, 28, 22, 16, 30, 35, 28, 20, 26]
				},
				{
					label: '총지출',
					yAxisID: 'y-left',
		            backgroundColor: 
		                'rgba(75, 192, 192, 0.2)',
		            borderColor: 
		                'rgba(75, 192, 192, 1)',
		            borderWidth: 1,
		            data: [6, 8, 10, 15, 3, 8, 9, 6, 8, 7, 4, 1]
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
					data: [12, 15, 12, 1, 25, 12, 7, 24, 27, 21, 16, 25]
				}]
			},	// data end
			options: {
				responsive: true,
				tooltips: {
					mode: 'index',
					intersect: false
				},
				hover: {
					mode: 'nearest',
					instersect: true
				},
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
							text: '금액(단위: 100,000원)'
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
	});	// ready end
</script>
</body>
</html>