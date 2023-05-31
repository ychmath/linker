<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%
String start_date = request.getParameter("start_date");
String end_date = request.getParameter("end_date");
%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>Linker</title>

<!-- Favicon -->
<link href="../../img/favicon.ico" rel="icon">

<!-- Icon Font Stylesheet -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="../../lib/animate/animate.min.css" rel="stylesheet">
<link href="../../lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link href="../../lib/lightbox/css/lightbox.min.css" rel="stylesheet">

<!-- Customized Bootstrap Stylesheet -->
<link href="../../css/bootstrap.min.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="../../css/style.css" rel="stylesheet">

<title>지출 내역</title>
</head>
<style>
    body {
        font-family: 'Roboto', sans-serif;
    }

    .page-title {
        font-size: 24px;
        font-weight: bold;
    }

    .data-table-container {
        background-color: white;
        padding: 20px;
        border-radius: 20px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
    }

    .data-table {
        width: 100%;
        border-top: 1px solid #444444;
        border-collapse: collapse;
        table-layout: fixed;
    }

    .data-table th, .data-table td {
        border-bottom: 1px solid #444444;
        border-left: 1px solid #444444;
        padding: 10px;
    }

    .data-table th {
        background-color: #D9D9D9;
    }

    .data-table td {
        text-align: center;
    }

    .data-table th:first-child, .data-table td:first-child {
        border-left: none;
    }

    .test_obj input[type="radio"] {
        display: none;
    }

    .test_obj input[type="radio"]+span {
        display: inline-block;
        border: 1px solid #dfdfdf;
        background-color: #ffffff;
        text-align: center;
        cursor: pointer;
        width: 60px;
        height: 30px;
        line-height: 30px;
        float: left;
    }

    .test_obj input[type="radio"]:checked+span {
        background-color: #113a6b;
        color: #ffffff;
    }

    .search-settings {
        display: flex;
        flex-direction: row;
        justify-content: flex-start;
        align-items: center;
        margin-bottom: 10px;
    }

    .search-settings > * {
        margin-right: 8px;
    }

    .resetButton {
        display: inline-block;
        background-color: #ffffff;
        padding: 2px 4px;
        border: 1px solid #ccc;
        cursor: pointer;
    }

    .resetButton:hover {
        background-color: #e0e0e0;
    }
</style>
<body>
	<%-- <form:form> --%>
	<form
		action="${pageContext.request.contextPath}/finance/filtered_data_ex"
		method="get">
		<div>
			<!--  id="B" -->
			<div>
				<!-- style="display:flex; align-items:center;" -->

				<p>
					<strong>지출 내역</strong>
				</p>
				<br>
				<table id="data-table">
					<tr>
						<th id="C">날짜</th>
						<td id="I">
						<label class="test_obj"> 
						<input type="radio" name="date" value="today"> <span>오늘</span>
						</label> 
						<label class="test_obj"> 
						<input type="radio" name="date" value="1month"> <span>1개월</span>
						</label>
						<label class="test_obj"> 
						<input type="radio" name="date" value="3month"> <span>3개월</span>
						</label> 
						<label class="test_obj"> <input type="radio" name="date" value="1year"> <span>1년</span>
						</label> 
						<label for="start-date-input">
						</label> 
						<input type="date" id="start-date-input" name="start-date" min="2021-01-01" max="" value="" required> 
						<label for="end-date-input"><a id="P">~</a>
						</label> 
						<input type="date" id="end-date-input" name="end-date" min="" max="" value="" required> 
							<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
							<script>
									function search() {
										var start_date = document
												.getElementById('start-date-input').value;
										var end_date = document
												.getElementById('end-date-input').value;

										//window.location.href = `./finance/filtered_data?start_date=${start_date}&end_date=${end_date}`;}
										showSaledResult(start_date, end_date);
									}
								</script>
							<button type="button" id="myButton" onclick="search()">검색
							</button> <script>
								function resetSearch() {

									location
											.assign("${pageContext.request.contextPath}/finance/expenditure");

								}

								$(function() {
									$("input[type='radio'][name='date']")
											.on(
													"change",
													function() {
														var dateRange = $(this)
																.val();
														var startDate = "";
														var endDate = "";

														switch (dateRange) {
														case "today":
															startDate = new Date();
															endDate = new Date();
															break;
														case "1month":
															startDate = new Date();
															startDate
																	.setMonth(startDate
																			.getMonth() - 1);
															endDate = new Date();
															break;
														case "3month":
															startDate = new Date();
															startDate
																	.setMonth(startDate
																			.getMonth() - 3);
															endDate = new Date();
															break;
														case "1year":
															startDate = new Date();
															startDate
																	.setFullYear(startDate
																			.getFullYear() - 1);
															endDate = new Date();
															break;
														}
														var startYear = startDate
																.getFullYear();
														var startMonth = startDate
																.getMonth() + 1 < 10 ? "0"
																+ (startDate
																		.getMonth() + 1)
																: startDate
																		.getMonth() + 1;
														var startDateNum = startDate
																.getDate() < 10 ? "0"
																+ startDate
																		.getDate()
																: startDate
																		.getDate();
														var endYear = endDate
																.getFullYear();
														var endMonth = endDate
																.getMonth() + 1 < 10 ? "0"
																+ (endDate
																		.getMonth() + 1)
																: endDate
																		.getMonth() + 1;
														var endDateNum = endDate
																.getDate() < 10 ? "0"
																+ endDate
																		.getDate()
																: endDate
																		.getDate();

														var startDateStr = startYear
																+ "-"
																+ startMonth
																+ "-"
																+ startDateNum;
														var endDateStr = endYear
																+ "-"
																+ endMonth
																+ "-"
																+ endDateNum;

														showSaledResult(
																startDateStr,
																endDateStr);
													});
								});

								function showSaledResult(start, end) {
									$.ajax({
										url : "./filtered_data_ex",
										data : {
											"start-date" : start,
											"end-date" : end
										},
										type : "GET",
										dataType : "json",
										success : function(data) {
											updateTableWithNewData(data);
										},
										error : function(error) {
											console.log(error);
										}
									});
								}

								function updateTableWithNewData(data) {
									var table_data = '';
									//$.each(data, function (index, expenditure) {

									for (var i = 0; i < data.length; i++) {
										let expenditure = data[i];
										table_data += '<tr>';
										table_data += '<td>'
												+ expenditure.orderid + '</td>';
										table_data += '<td>'
												+ expenditure.ingredientname
												+ '</td>';
										table_data += '<td>'
												+ expenditure.price + '</td>';
										table_data += "<td>"
												+ new Date(
														expenditure.orderdate)
														.toISOString().split(
																'T')[0]
												+ "</td>";

										table_data += '</tr>';
									}
									//});

									$("#saled").empty();
									$("#saled").append(table_data);
								}
							</script>
							<button type="button" class="resetButton" onclick="resetSearch()">X</button>
					</tr>
				</table>
				<br>
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
					<tbody id="saled">
						<c:forEach items="${elist}" var="expenditure">
							<tr>
								<td>${expenditure.orderid}</td>
								<td>${expenditure.ingredientname}</td>
								<td>${expenditure.price}</td>
								<td><fmt:formatDate value="${expenditure.orderdate}"
										pattern="yyyy-MM-dd" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</form>
	
			<!-- JavaScript Libraries -->
		<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
		<script src="/lib/wow/wow.min.js"></script>
		<script src="/lib/easing/easing.min.js"></script>
		<script src="/lib/waypoints/waypoints.min.js"></script>
		<script src="/lib/counterup/counterup.min.js"></script>
		<script src="/lib/owlcarousel/owl.carousel.min.js"></script>
		<script src="/lib/isotope/isotope.pkgd.min.js"></script>
		<script src="/lib/lightbox/js/lightbox.min.js"></script>

		<!-- Template Javascript -->
		<script src="/js/main.js"></script>
</body>
</html>