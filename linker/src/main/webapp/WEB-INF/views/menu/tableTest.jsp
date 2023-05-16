<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.5/css/bootstrap.min.css">
<title>테이블 테스트</title>
</head>
<body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
$(function(){
	// ajax row data
	var ajax_data = [
		{fname:"Code", lname:"Width Mark", email:"mark@codewithmark.com"},
		{fname:"Mary", lname:"Moe", email:"mary@gmail.com"},
		{fname:"John", lname:"Doe", email:"john@yahoo.com"},
		{fname:"Julie", lname:"Dooley", email:"julie@gmail.com"}
	]
	
	// create HTML table
	var random_id = function(){
		var id_num = Math.random().toString(9).substr(2,3);
		var id_str = Math.random().toString(36).substr(2);
		
		return id_num + id_str;
	}
	
	// create data table > start
	var tbl = "";
	tbl += "<table class=\'table table-hover'\>";
	
	// crate table header > start
	tbl += "<thead>";
	tbl += "<tr>";
	tbl += "<th>Firt Name</th>";
	tbl += "<th>Last Name</th>";
	tbl += "<th>Email</th>";
	tbl += "<th>Options</th>";
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
		tbl += "<td><div cass=\'row_data'\ edit_type=\'click'\ col_name=\'fname'\>" + val["fname"] + "</div></td>";
		tbl += "<td><div class=\'row_data'\ edit_type=\'clcik'\' col_name=\'lname'\>" + val["lname"] + "</div></td>";
		tbl += "<td><div class=\'row_data'\ edit_type=\'click'\ col_name=\'email'\>" + val["email"] + "</div></td>";
		
		// edit options > start
		tbl += "<td>";
		tbl += "<span class=\'btn_edit'\><a href=\'#'\ class='btn btn-link'\ row_id=\'" + row_id + "\'>Edit</a></span>";
		
		//only show this button if edit button is clicked
		tbl += "<span class=\'btn_save'\><a href=\'#'\ class=\'btn btn-link'\ row_id=\'" + row_id + "'\>Save</a> | </span>";
		tbl += "<span class=\'btn_cancel'\><a href=\'#'\ class=\'btn btn-click'\ row_id=\'" + row_id + "'\>Cancel</a> | </span>";
		tbl += "</td>";
		// edit options > end
		
		tbl += "</tr>";
	});
	// create table body rows > end
	
	tbl += "</tbody>";
	// create table body > end
	
	tbl += "</table>";
	// create data table > end
	
	// out put table data
	$(document).find(".tbl_user_data").html(tbl);
	$(document).find(".btn_save").hide();
	$(document).find(".btn_cancel").hide();
	
	// make div editable > start
	$(document).on("click", ".row_data", function(event){
		
		event.preventDefault();
		
		if($(this).attr("edit_type") == "button"){
			return false;
		}
		
		// make div editable
		$(this).closest("div").attr("contenteditable", "true");
		// add bg css
		$(this).addClass("bg-warning").css("padding", "5px");
		
		$(this).focus();
	});
	// make div editable > end
	
//--->button > edit > start	
	$(document).on('click', '.btn_edit', function(event) 
	{
		event.preventDefault();
		var tbl_row = $(this).closest('tr');

		var row_id = tbl_row.attr('row_id');

		tbl_row.find('.btn_save').show();
		tbl_row.find('.btn_cancel').show();

		//hide edit button
		tbl_row.find('.btn_edit').hide(); 

		//make the whole row editable
		tbl_row.find('.row_data')
		.attr('contenteditable', 'true')
		.attr('edit_type', 'button')
		.addClass('bg-warning')
		.css('padding','3px')

		//--->add the original entry > start
		tbl_row.find('.row_data').each(function(index, val) 
		{  
			//this will help in case user decided to click on cancel button
			$(this).attr('original_entry', $(this).html());
		}); 		
		//--->add the original entry > end

	});
	//--->button > edit > end
	
	// button > cancel > start
	$(document).on("click", ".btn_cancel", function(event){
		
		event.preventDefault();
		
		var tbl_row = $(this).closest("tr");
		
		var row_id = tbl_row.attr("row_id");
		
		// hide save and cancel buttons
		tbl_row.find(".btn_save").hide();
		tbl_row.find(".btn_cancel").hide();
		
		// show edit button
		tbl_row.find(".btn_edit").show();
		
		// make the whole row editable
		tbl_row.find(".row_data")
			.attr("edit_type", "click")
			.removeClass("bg-warning")
			.css("padding", "")
			
		tbl_row.find(".row_data").each(function(index, val){
			$(this).html($(this).attr("original_entry"));
		});
	});
	// button > cancel > end
	
	//--->save whole row entery > start	
	$(document).on('click', '.btn_save', function(event) 
	{
		event.preventDefault();
		var tbl_row = $(this).closest('tr');

		var row_id = tbl_row.attr('row_id');

		
		//hide save and cacel buttons
		tbl_row.find('.btn_save').hide();
		tbl_row.find('.btn_cancel').hide();

		//show edit button
		tbl_row.find('.btn_edit').show();


		//make the whole row editable
		tbl_row.find('.row_data')
		.attr('edit_type', 'click')
		.removeClass('bg-warning')
		.css('padding','') 

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

		//out put to show
		$('.post_msg').html( '<pre class="bg-success">'+JSON.stringify(arr, null, 2) +'</pre>')
		 

	});
	//--->save whole row entery > end
	
});	// ready end
</script>
<div class="panel panel-defult">
	<div class="panel-heading"><b>Demo</b></div>
	<div class="panel-body">
		<div class="tbl_user_data"></div>
	</div>
</div>
<div class="panel panel-default">
	<div class="panel-heading"><b>HTML table Edits/Updates</b></div>
	<div class="panel-body">
		<p>All the changes will be displayed below</p>
		<div class="post_msg"></div>
	</div>
</div>
</body>
</html>