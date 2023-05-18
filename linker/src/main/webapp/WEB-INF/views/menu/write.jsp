<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>식단표 작성</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.5/css/bootstrap.min.css">
<style>
	.orange{
		background-color: orange;
	}
	.main {
		border-collapse: collapse;
	}
	[contenteditable=true]:empty:before{
		content: attr(placeholder);
		display: block;
	}
	#myTable {
		text-align: center;
	}
</style>
</head>
<body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
$(function(){
	// ajax row data
	var ajax_data = [
		{tname:"조식", line1:"없음", line2:"없음", line3:"없음", line4:"없음", line5:"없음"},
		{tname:"중식", line1:"없음", line2:"없음", line3:"없음", line4:"없음", line5:"없음"},
		{tname:"석식", line1:"없음", line2:"없음", line3:"없음", line4:"없음", line5:"없음"}
	]
	
	// create HTML table
	var random_id = function(){
		var id_num = Math.random().toString(9).substr(2,3);
		var id_str = Math.random().toString(36).substr(2);
		
		return id_num + id_str;
	}
	
	// create data table > start
	var tbl = "";	// 테이블을 저장할 변수 선언
	
	tbl += "<table class=\'table table-hover'\ id=\'myTable'\>";
	
	// crate table header > start
		tbl += "<thead>";
			tbl += "<tr>";
				tbl += "<th>시간</th>";
				tbl += "<th><div class=\'row_data'\ edit_type=\'click'\'>날짜를 입력해 주세요.</div></th>";
				tbl += "<th><div class=\'row_data'\ edit_type=\'click'\'>날짜를 입력해 주세요.</div></th>";
				tbl += "<th><div class=\'row_data'\ edit_type=\'click'\'>날짜를 입력해 주세요.</div></th>";
				tbl += "<th><div class=\'row_data'\ edit_type=\'click'\'>날짜를 입력해 주세요.</div></th>";
				tbl += "<th><div class=\'row_data'\ edit_type=\'click'\'>날짜를 입력해 주세요.</div></th>";
			tbl += "</tr>";
		tbl += "</thead>";
	// create table > header > end

	// create table body > start
		tbl += "<tbody>";
	// create table body rows > start
	$.each(ajax_data, function(index, val){
		// database row id
		var row_id = random_id();
		
		// looping through ajax row data
		tbl += "<tr row_id=\'" + row_id + "'\>";
			tbl += "<td><div class=\'row_data'\  col_name=\'tname'\>" + val["tname"] + "</div></td>";
			tbl += "<td><div class=\'row_data'\ edit_type=\'click'\' col_name=\'line1'\>" + val["line1"] + "</div></td>";
			tbl += "<td><div class=\'row_data'\ edit_type=\'click'\ col_name=\'line2'\>" + val["line2"] + "</div></td>";
			tbl += "<td><div class=\'row_data'\ edit_type=\'click'\ col_name=\'line3'\>" + val["line3"] + "</div></td>";
			tbl += "<td><div class=\'row_data'\ edit_type=\'click'\ col_name=\'line4'\>" + val["line4"] + "</div></td>";
			tbl += "<td><div class=\'row_data'\ edit_type=\'click'\ col_name=\'line5'\>" + val["line5"] + "</div></td>";
		tbl += "</tr>";
	});

	// create table body rows > end	
		tbl += "</tbody>";
	// create table body > end
	tbl += "</table>";
	// create data table > end
	
	// out put table data
	$(document).find(".tbl_user_data").html(tbl);
	
	// make div editable > start
	$(document).on("click", ".row_data", function(event){

		event.preventDefault();

		// make div editable
		$(this).closest("div").attr("contenteditable", "true");
		// add bg css
		$(this).addClass("bg-warning").css("padding", "5px");

		$(this).focus();
		
	});
	// make div editable > end
	
	$("#save").click(function(event){

		event.preventDefault();
		
		var tbl_row = $(this).closest('tr');
		
		tbl_row.find(".row_data")
			.removeAttr("edit_type", "click")
			.removeClass("bg-warning")
			.css("padding", "")

		var row_id = tbl_row.attr('row_id');

		//--->get row data > start
		var arr = {}; 

		tbl_row.find('.row_data').each(function(index, val) 
		{   
			var col_name = $(this).attr('col_name');  
			var col_val  =  $(this).html();
			arr[col_name] = col_val;
		});
		//--->get row data > end

		//use the "arr"	object for your ajax call
		$.extend(arr, {row_id:row_id});
	
		var content = document.getElementById("table");
		// console.log(table.outerHTML);
		$("#content").val(table.outerHTML);
		$("#content").attr("disabled", false);

		$("#writeform").submit();

	});
	
});	// ready end
</script>
<form method="post" id="writeform" action="write">
	<table border="1">
		<tr>
			<td class="orange">제목</td>
			<td><input name="title"/></td>
		</tr>
		<tr>
			<td class="orange">작성자</td>
			<td><input name="userID" value="Berlin" readonly></td>
		</tr>
		<tr>
			<td class="orange">내용</td>
			<td>
				<input name="content" id="content" disabled style="display: none;"/>
				<div class="panel panel-default" id="table">
					<div class="panel-heading"><b>식단표</b></div>
					<div class="panel-body">
					<div class="tbl_user_data">
					</div>
					</div>
				</div>
				<input type="button" id="save" value="새 식단표 등록">
			</td>
		</tr>
	</table>
</form>
</body>
</html>