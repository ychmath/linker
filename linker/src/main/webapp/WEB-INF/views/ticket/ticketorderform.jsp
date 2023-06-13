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
<title>식권 구매 내역</title>
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

#C {
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

th {
	background-color: #D9D9D9;
}

td {
	text-align: center;
}

th:first-child, td:first-child {
	border-left: none;
}

#B>div {
	width: 100%;
	box-sizing: border-box; /* border와 padding을 포함한 크기를 지정합니다. */
	float: left; /* 좌우 정렬을 위해 float 속성을 사용합니다. */
}

#B>div:first-child {
	padding-right: 104px; /* 첫 번째 div 요소 오른쪽에 10px의 padding을 추가합니다. */
}

#B>div:last-child {
	padding-left: 10px; /* 마지막 div 요소 왼쪽에 10px의 padding을 추가합니다. */
}

#B table {
	width: 100%;
	height: 100%;
}

.test_obj input[type="radio"] {
	display: none;
}

.test_obj input[type="radio"]+span {
	display: inline-block;
	/*         padding: 15px 10px;
 */
	border: 1px solid #dfdfdf;
	background-color: #ffffff;
	text-align: center;
	cursor: pointer;
	width: 60px;
	height: 30px;
	float: left;
}

.test_obj input[type="radio"]:checked+span {
	background-color: #113a6b;
	color: #ffffff;
}

#start-date-input {
	float: left;
}

#end-date-input {
	float: left;
}

#P {
	float: left;
}

#myButton {
	float: left;
}

#page {
	text-align: center;
}
</style>

<body>
	<%-- <form:form> --%>
	<form
		action="${pageContext.request.contextPath}/finance/filtered_data_t"
		method="get">
		<div>
			<!--  id="B" -->
			<div>
				<!-- style="display:flex; align-items:center;" -->

				<p>
					<strong>식권 구매 내역</strong>
				</p>
				<br>
				<table id="data-table">
					<tr>
						<th id="C">날짜</th>
						<td id="I"><label class="test_obj"> <input
								type="radio" name="date" value="today"> <span>오늘</span>
						</label> <label class="test_obj"> <input type="radio" name="date"
								value="1month"> <span>1개월</span>
						</label> <label class="test_obj"> <input type="radio" name="date"
								value="3month"> <span>3개월</span>
						</label> <label class="test_obj"> <input type="radio" name="date"
								value="1year"> <span>1년</span>
						</label> <label class="test_obj"> <input type="radio" name="date"
								value="total"> <span>전체</span>
						</label> <label for="start-date-input"></label> <input type="date"
							id="start-date-input" name="start-date" min="2021-01-01" max=""
							value="" required oninput="restrictEndDate()"> <label
							for="end-date-input"><a id="P">~</a></label> <input type="date"
							id="end-date-input" name="end-date" min="" max="" value=""
							required oninput="restrictStartDate()"> <script
								src="https://code.jquery.com/jquery-3.6.0.min.js"></script> <script>
									function search() {
										var start_date = document
												.getElementById('start-date-input').value;
										var end_date = document
												.getElementById('end-date-input').value;
										var currentPage = 1;

										//window.location.href = `./finance/filtered_data?start_date=${start_date}&end_date=${end_date}`;}
										showSaledResult(start_date, end_date,
												currentPage);
									}
								</script>
							<button type="button" id="myButton" onclick="search()">검색</button>

							<script>
								function setMaxDate(elementId) {
									//var today = new Date();
									var currentDate = new Date();
									var currentYear = currentDate.getFullYear();
									var currentMonth = currentDate.getMonth() + 1 < 10 ? "0"
											+ (currentDate.getMonth() + 1)
											: currentDate.getMonth() + 1;
									var currentDateNum = currentDate.getDate() < 10 ? "0"
											+ currentDate.getDate()
											: currentDate.getDate();
									var currentDateString = currentYear + "-"
											+ currentMonth + "-"
											+ currentDateNum;

									document.getElementById(elementId)
											.setAttribute("max",
													currentDateString);
								}

								function restrictEndDate() {
									var startDateValue = document
											.getElementById("start-date-input").value;
									document
											.getElementById("end-date-input")
											.setAttribute("min", startDateValue);
								}

								function restrictStartDate() {
									var endDateValue = document
											.getElementById("end-date-input").value;
									document.getElementById("start-date-input")
											.setAttribute("max", endDateValue);
								}

								setMaxDate("start-date-input");
								setMaxDate("end-date-input");

								function resetSearch() {

									location
											.assign("${pageContext.request.contextPath}/ticket/ticketorderform");

								}

								$(function() {
									$("input[type='radio'][name='date']")
											.on(
													"change",
													function() {
														var dateRange = $(this)
																.val();

														/* var startDate = LocalDateTime.parse(startDate + "T00:00:00");
														var endDate = LocalDateTime.parse(endDate + "T23:59:59"); */

														var startDate = "";
														var endDate = "";

														// dateRange에 따라 startDate와 endDate값을 설정합니다.
														switch (dateRange) {
														case "today":
															startDate = new Date();
															endDate1 = new Date();
															endDate = new Date(
																	endDate1
																			.setDate(endDate1
																					.getDate() + 1));
															break;
														case "1month":
															startDate = new Date();
															startDate
																	.setMonth(startDate
																			.getMonth() - 1);
															endDate1 = new Date();
															endDate = new Date(
																	endDate1
																			.setDate(endDate1
																					.getDate() + 1));
															break;
														case "3month":
															startDate = new Date();
															startDate
																	.setMonth(startDate
																			.getMonth() - 3);
															endDate1 = new Date();
															endDate = new Date(
																	endDate1
																			.setDate(endDate1
																					.getDate() + 1));
															break;
														case "1year":
															startDate = new Date();
															startDate
																	.setFullYear(startDate
																			.getFullYear() - 1);
															endDate1 = new Date();
															endDate = new Date(
																	endDate1
																			.setDate(endDate1
																					.getDate() + 1));
															break;
														case "total":
															startDate = new Date();
															endDate1 = new Date();
															endDate = new Date(
																	endDate1
																			.setDate(endDate1
																					.getDate() + 1));
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
																endDateStr, 1);
													});
								});

								function showSaledResult(start, end, page) {
									$.ajax({
										url : "./filtered_data_t",
										data : { //파라미터 값 받아옴
											"start-date" : start,
											"end-date" : end,
											"p" : page

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

								function goToPage(page) {
									currentPage = page; //지정된 페이지 번호를 현재 페이지로 설정
									search(); //검색 함수를 호출하여 결과를 가져옴
								}

								function updateTableWithNewData(data) {
									var table_data = ''; //나중에 HTML 테이블에 추가될 요소들을 저장할 변수
									//$.each(data, function (index, ticket) {

									for (var i = 0; i < data[1].length; i++) {

										let ticket = data[1][i];

										let orderDate = new Date(
												ticket.orderdate);
										orderDate
												.setHours(orderDate.getHours() + 9);
										let koreanDate = orderDate
												.toISOString().split('T')[0];

										table_data += '<tr>';
										table_data += '<td>'
												+ ticket.ticketorderid
												+ '</td>';
										table_data += "<td>" + koreanDate
												+ "</td>";
										table_data += '<td>'
												+ ticket.tickettypename
												+ '</td>';
										table_data += '<td>' + ticket.price
												+ '</td>';
										table_data += '<td>' + ticket.quantity
												+ '</td>';
										table_data += '<td>'
												+ ticket.totalprice + '</td>';
										table_data += '</tr>';

										//기존 Date코드 (UTC+9여서 하루 늦게 반영됐었음. 현재 코드로 수정)
										//new Date(ticket.orderdate).toISOString().split('T')[0]

									}
									//});

									$("#saled").empty();
									$("#saled").append(table_data);

									$("#page").empty();
									//[{"totalPages":6,"count":55,"end":5,"pageNum":5,"begin":1},

									var pageData = data[0];
									var page_str = ""; //사용될 HTML 문자열을 저장할 page_str 변수를 선언하고 빈 문자열을 할당함
									//console.log(pageData.begin);

									if (pageData.begin > pageData.pageNum) {

										page_str += "<span onclick=showSaledResult('"
												+ pageData.startDate
												+ "','"
												+ pageData.endDate
												+ "','"
												+ (pageData.begin - 1)
												+ "')> 이전 </span> ";
									}

									for (index = pageData.begin; index <= pageData.end; index++) {

										page_str += "<span onclick=showSaledResult('"
												+ pageData.startDate
												+ "','"
												+ pageData.endDate
												+ "','"
												+ index
												+ "')>"
												+ index
												+ ' </span> ';

									}

									if (pageData.end < pageData.totalPages) {

										page_str += "<span onclick=showSaledResult('"
												+ pageData.startDate
												+ "','"
												+ pageData.endDate
												+ "','"
												+ (pageData.end + 1)
												+ "')> 다음 </span> ";
									}

									$("#page").append(page_str);

								}
							</script>
					</tr>
				</table>
				<br>
			</div>
			<div>
				<table>
					<thead>
						<tr>
							<th scope="col" id="ticketorderid">식권 구매 번호</th>
							<th scope="col" id="orderdate">구매 일자</th>
							<th scope="col" id="tickettypename">식권 종류</th>
							<th scope="col" id="price">식권 가격</th>
							<th scope="col" id="quantity">수량</th>
							<th scope="col" id="totalprice">결제 금액</th>
						</tr>
					</thead>

					<tbody id="saled">

						<c:forEach items="${pList}" var="purchase">
							<tr>
								<td>${purchase.ticketorderid}</td>
								<td><fmt:formatDate value="${purchase.orderdate}"
										pattern="yyyy-MM-dd" /></td>
								<td>${purchase.tickettypename}</td>
								<td>${purchase.price}</td>
								<td>${purchase.quantity}</td>
								<td>${purchase.totalprice}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</form>

	<div id="page">
		<c:if test="${begin > pageNum }">
			<a href="ticketorderform?p=${begin-1 }">[이전]</a>
		</c:if>
		<c:forEach begin="${begin }" end="${end }" var="i">
			<a href="ticketorderform?p=${i }">${i }</a>
		</c:forEach>
		<c:if test="${end < totalPages }">
			<a href="ticketorderform?p=${end+1 }">[다음]</a>
		</c:if>
	</div>
	<c:if test="${count == 0 }">
 	아직 구매한 식권이 없습니다.
 	</c:if>


</body>
</html>
