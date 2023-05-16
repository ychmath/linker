<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴 수정</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.5/css/bootstrap.min.css">
</head>
<body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	$(function(){
		var ajax_data = [];
		
		// make div editable > start
		$(document).on("click", ".row_data", function(event){

			event.preventDefault();
			
			// make div editable
	    		$(this).closest("div").attr("contenteditable", "true");
			// add bg css
			$(this).addClass("bg-warning").css("padding", "5px");
			
			$(this).focus();
			
		});//on 
		// make div editable > end
		
		$("#save").click(function(event){

			event.preventDefault();
			
			$("div").removeClass("bg-warning");
			$("div").removeAttr("contenteditable");
			
			//--->get row data > start
			var arr = {}; 
			var tbl_row = $(this).closest('tr');
			var row_id = tbl_row.attr('row_id');

			tbl_row.find('.row_data').each(function(index, val) 
			{   
				var col_name = $(this).attr("col_name");  
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

		$("#updateform").submit();
		
		});//click
	});	// ready endu
</script>

<form method="post" id="updateform" action="/menu/update/${ dto.menuID }" >
<input type="hidden" name="_method" value="put"/>
	<table border="1">
		<tr>	
			<td class="orange">제목</td>
			<td>
				<input name="title" value="${ dto.title }"/>
				<input name="menuID" value="${ dto.menuID }" type="hidden"/> 
			</td>
		</tr>
		<tr>
			<td class="orange">작성자</td>
			<td><input name="userID" value="${ dto.userID }" readonly></td>
		</tr>
		<tr>
			<td class="orange">내용</td>
			<td>
				<input name="content" id="content" disabled style="display: none;"/>
				${ dto.content }
            </td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="button" id="save" value="글 수정 완료"/> 
			</td>
		</tr>
	</table>
</form>
</body>
</html>