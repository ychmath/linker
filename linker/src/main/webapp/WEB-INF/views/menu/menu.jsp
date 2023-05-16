<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>식단표</title>
<style>
	.calendar {
		width: 500px;
	}
	.calendar table {
		width: 100%;
	}
	.calendar table > caption {
		font-size: larger;
		font-weight: bolder;
		color: red;
		text-align: left;
		padding: 10px 20px;
	}
	.calendar table > thead > tr > th.saturday {
		color: gray;
	}
	.calendar table > thread > tr > th.sunday {
		color: red;
	}
	.calendar table > tbody > tr > td > span.saturday {
		color: gray;
	}
	.calendar table > tbody > tr > td > span.sunday {
		color: red;
	}
	.calendar table > tbody > tr > td {
		padding: 10px 10px;
		text-align: center;
	}
	.calendar table > tbody > tr > td > span {
		display: block;
		padding: 10px 10px;
	}
	.calendar table > tbody > tr > td > span.today {
		border: 1px solid red;
		border-radius: 50%;
		color: white;
		background-color: red;
		padding: 9px 9px;
	}
	.calendar > .calendar-header {
		positon: relative;
		font-size: larger;
		font-weight: bolder;
		color: red;
		line-height: 50px;
	}
	.calendar > .calendar-header > .calendar-yearmonth {
		position: relative;
		font-size: larger;
		font-weight: bolder;
		color: red;
		line-height: 50px;
	}
	.calendar > .calendar-header > .calendar-controller {
		position: absolute;
		top: 11px;
		right: 0px;
	}
	.calendar > .calendar-header > .calendar-controller > button {
		float: left;
		width: 25px;
		height: 28px;
		padding: 1px 4px 0 4px;
		border: 1px solid #cbcbcb;
		background-color: #fff;
		font-size: 12px;
		cursor: pointer;
	}
	.calendar > .calendar-header > .calendar-controller > button.calendar-today {
		width: 40px;
	}
</style>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
</head>
<body>
	<p id="title">식단표 작성하기</p>
	<div id="container">
		<div class="calendar">
			<div class="calendar-header">
				<span class="calendar-yearmonth"></span>
				<div class="calendar-controller">
					<button type="button" class="calendar-prev">&lt;</button>
					<button type="button" class="calendar-next">&gt;</button>
					<button type="button" class="calendar-today">오늘</button>
				</div>
			</div>
			<div id="calendar"></div>
		</div>
	</div>
<script>
	function calendarHTML (date, options) {
		// 데이터 검증
		if (date == undefined || date == null || typeof date != "object" || !date instanceof Date) {
			return "";
		}
/* 		
		// 공휴일 => 식단표로 활용 가능할듯합니다.
		var hashmapHoliday = [];
		hashmapHoliday["5-5"] = {"title" : "어린이날"}
		
		if (options.arHoliday != undefined && options.arHoliday != null && Array.isArray(options.arHoliday)) {
			Object.assign(hashmapHoliday, options.arHoliday);
		}
 */
		// 기본값 설정
		var settings = {
				showDay: true,
				showFullDayName: false,
				showToday: true
				// arHoliday: hashmapHoliday
		};
		
		// 기본값 처리
		if (options != undefined && options != null) {
			Object.assign(settings, options);
		}
		
		// 요일
		var days = ["일", "월", "화", "수", "목", "금", "토"];
		// 달력 연도
		var calendarYear = date.getFullYear();
		// 달력 월
		var calendarMonth = date.getMonth() + 1;
		// 달력 일
		var calendarToday = date.getDate();
		
		var monthLastDate = new Date(calendarYear, calendarMonth, 0);
		// 달력 월의 마지막 일
		var calendarMonthLastDate = monthLastDate.getDate();
		
		var monthStartDay = new Date(calendarYear, date.getMonth(), 1);
		// 달력 월의 시작 요일
		var calendarMonthStartDay = monthStartDay.getDay();
		
		// 주 카운트
		var calendarWeekCount = Math.ceil((calendarMonthStartDay + calendarMonthLastDate) / 7);
		
		// 오늘
		var today = new Date();
		
		var html = "";
		html += "<table>"
		// showDay가 true일때만 요일을 보여 줌
		if (settings.showDay) {
			html += "<thead><tr>";
			for (var index = 0; index < days.length; index++) {
				html += "<th";
				if (index == 0) {
					html += " class=\'sunday\'";
				} else if (index == 6) {
					html += " class=\'saturday\'";
				}
				html += ">" + days[index];
				// showFullDayName이 true일 경우 요일까지 붙임
				if (settings.showFullDayName) {
					html += "요일";
				}
				html += "</th>"
			}
			html += "</tr></thead>";
		}
		html += "<tbody>";

		// 날짜 위치
		var calendarPos = 0;
		// 날짜값
			var calendarDay = 0;
	for (var index1 = 0; index1 < calendarWeekCount; index1++) {
		html += "<tr>";
		for (var index2 = 0; index2 < 7; index2++) {
			html += "<td>";
			if (calendarMonthStartDay <= calendarPos && calendarDay < calendarMonthLastDate) {
				calendarDay++;
				html += "<span";
				if (settings.showToday && calendarYear == today.getFullYear() && calendarMonth == today.getMonth() + 1
					&& calendarDay == today.getDate()) {
					html += " class=\"today\"";
				} else {
					if (index2 == 0) {
						html += " class=\"sunday\"";
					} else if (index2 == 6) {
						html += " class=\"saturday\"";
					}
				}
				html += ">" + calendarDay + "</span>";
			}
			html += "</td>";
			calendarPos++;
		}
		html += "</tr>";
	}
	html += "</tbody>";
	html += "</table>";
	return html;
/* 		var calendarDay = 0;
		for(var index1 = 0; index1 < calendarWeekCount; index1++) {
			html += "<tr>";
			for(var index2 = 0; index2 < 7; index2++){
				html += "<td";
				// 날짜값 삽입
				if (calendarMonthStartDay <= calendarPos && calendarDay < calendarMonthLastDate){
					calendarDay++;
					html += " data-date=\'" 
						+ calendarYear + "-" + (calendarMonth < 10 ? "0" : "")
						+ calendarMonth + "-" + (calendarDay < 10 ? "0" : "")
						+ calendarDay + "\'";
					html += "<span";
					// 입력된 년, 월, 일과 비교하여 날짜 처리
					if (calendarYear == today.getFullYear() && calendarMonth == today.getMonth() + 1
							&& calendarDay == today.getDate()) {
						// 입력된 날이 오늘인 경우
						html += " class=\'today\'";
					} else {
						// 공휴일 처리
						var holiday = false;
						
						if (Object.keys(hashmapHoliday).length > 0) {
							var holidayInfo = hashmapHoliday[calendarYear + "-" + calendarMonth + "-" + calendarDay];
						}
						if (holidayInfo == null) {
							holidayInfo = hashmapHoliday[calendarMonth + "-" + calendarDay];
						}
						if (holidayinfo != undefined && holidayInfo != null) {
							html += " class=\'holiday\' title=\'" + holidayInfo.title + "\'";
							holiday = true;
						}
						if (!holiday) {
							// 주말 처리
							if (index2 == 0) {
								html += " class=\'sunday'";
							} else if (index2 == 6) {
								html += " class=\'saturday\'";
							}
						}
					}
					html += ">" + calendarDay + "</span>";
				}
				html += "</td>";
				calendarPos++;
			}
			html += "</tbody>";
			html += "</tr>"
		}
		html += "</table>";
		return html; */
	} // calendarHTML end

	// 버튼을 사용하기 위한 calendar 함수 생성
	function calendar (date) {
		// 년월
		$(".calendar-yearmonth").html(date.getFullYear() + "." + (date.getMonth() + 1));

		// 달력 객체 생성
		var html = calendarHTML(date);
		$("#calendar").html(html);
	}
	
	var date = new Date();
	
	calendar(date);
	
 	// 이전 달 이동 버튼 클릭
	$(".calendar-controller > .calendar-prev").on("click", function(){
		var yearmonth = $(".calendar-yearmonth").text().split(".");
		calendar(new Date(parseInt(yearmonth[0]), parseInt(yearmonth[1]) - 2, 1));
	});
	
	// 다음 달 이동 버튼 클릭
	$(".calendar-controller > .calendar-next").on("click", function(){
		var yearmonth = $(".calendar-yearmonth").text().split(".");
		calendar(new Date(parseInt(yearmonth[0]), parseInt(yearmonth[1]), 1));
	});
	
	// 오늘 이동 버튼 클릭
	$(".calendar-controller > .calendar-today").on("click", function(){
		calendar(new Date());
	});
	
	// 날짜 클릭
	$(document).on("click", ".calendar table > tbody > tr > td", function(event){
		alert("날짜 클릭");
		
/* 		// 이벤트가 부모 태그로 전파되는 것 방지
		event.stopPropagation();
		
		var eventTarget = event.target;
		while (eventTarget.tagName != "TD") {
			eventTarget = eventTarget.parentElement;
		}
		if ($(eventTarget).attr("data-date") != undefined) {
			alert($(eventTarget).attr("data-date"));
		} */
	});
</script>
</body>
</html>