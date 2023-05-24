<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>Linker</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />

<link
	href="https://fonts.googleapis.com/css?family=Cormorant+Garamond:300,300i,400,400i,500,600i,700"
	rel="stylesheet" />
<link href="https://fonts.googleapis.com/css?family=Satisfy"
	rel="stylesheet" />

<!-- Animate.css -->
<link rel="stylesheet" href="/css/animate.css" />
<!-- Icomoon Icon Fonts-->
<link rel="stylesheet" href="/css/icomoon.css" />
<!-- Bootstrap  -->
<link rel="stylesheet" href="/css/bootstrap.css" />
<!-- Flexslider  -->
<link rel="stylesheet" href="/css/flexslider.css" />

<!-- Theme style  -->
<link rel="stylesheet" href="/css/style.css" />

<!-- Modernizr JS -->
<script src="/js/modernizr-2.6.2.min.js"></script>
<!-- FOR IE9 below -->
<!--[if lt IE 9]>
      <script src="js/respond.min.js"></script>
    <![endif]-->
<style>
	.content {
		width: 100%;
		align-self: center;
		align-content: stretch;
	}
	.menu {
		width: 100%;
		border: 1px solid gray;
		border-collapse: collapse;
		margin-top: 30px;
	}
	.write {
		width: 100%;
		align-self: flex-end;
		text-align: right;		
	}
	.table-hover {
		color: black;
	}
	.menu {
		border-bottom: 1px solid gray;
	}
	.title {
		width: 700px;
		color: white;
		margin-top: 30px;
	}
	.pageController {
		width: 100%;
		text-align: center;
	}
	.orange {
		color: white;
	}
	#myTable {
		width: 100%;
		table-layout: fixed;
	}
</style>
</head>
<body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
$(function(){
	// 권한 가져오기
	var role = $("#role").text();
	
	// 열람 권한이 없다면 페이지 이동.
	if (role == 'buyer') {
		alert("열람 권한이 없는 페이지입니다.");
		location.href = "/main";
	}
	
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
	
	for (var i = 0; i < 2; i++) {
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
			tbl += "<td class=\'tname'\><div class=\'row_data'\  col_name=\'tname'\>" + val["tname"] + "</div></td>";
			tbl += "<td><div class=\'row_data'\ edit_type=\'click'\' col_name=\'line1'\>" + val["line1"] + "</div></td>";
			tbl += "<td><div class=\'row_data'\ edit_type=\'click'\ col_name=\'line2'\>" + val["line2"] + "</div></td>";
			tbl += "<td><div class=\'row_data'\ edit_type=\'click'\ col_name=\'line3'\>" + val["line3"] + "</div></td>";
			tbl += "<td><div class=\'row_data'\ edit_type=\'click'\ col_name=\'line4'\>" + val["line4"] + "</div></td>";
			tbl += "<td><div class=\'row_data'\ edit_type=\'click'\ col_name=\'line5'\>" + val["line5"] + "</div></td>";
		tbl += "</tr>";
	});

	// create table body rows > end	
		tbl += "</tbody>";
	}
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
			.css("padding", "");

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
<div class="fh5co-loader"></div>
<div id="page">
<nav class="fh5co-nav" role="navigation">
        <!-- <div class="top-menu"> -->
        <div class="container">
          <div class="col-xs-12 text-right menu-1 menu-wrap">
            <span id="role" style="display: none;">${ user.role }</span>
            <ul>
              <c:if test="${user == null}">
                <li class="login-signup"><a href="login.html">로그인</a></li>
                <li class="login-signup"><a href="signup.html">회원가입</a></li>
              </c:if>
            </ul>
          </div>
          <div class="row">
            <div class="col-xs-12 text-center logo-wrap">
              <div id="fh5co-logo">
                <a href="/main">Linker<span>.</span></a>
              </div>
            </div>

            <div class="col-xs-12 text-left menu-1 menu-wrap">
              <ul>
                <li><a href="/main">홈</a></li>
                <li><a href="notice.html">공지사항</a></li>
                <li><a href="inquiry.html">문의사항</a></li>
                <li class="active"><a href="/menu/list">식단표</a></li>
              </ul>
            </div>
          </div>
        </div>
        <!-- </div> -->
      </nav>

 	<div class="fh5co-cover" style="height: 200px"></div>
      
      <div id="fh5co-about" class="fh5co-section">
    
        <div class="container">
			<form method="post" id="writeform" action="write">
				<table border="1" style="color:black;">
					<tr>
						<td class="orange">제목</td>
						<td><input name="title" style="background-color: inherit; color: white;"/></td>
					</tr>
					<tr>
						<td class="orange">작성자</td>
						<td><input name="userID" style="background-color: inherit; color: white;" value="${ user.userid }" readonly></td>
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
							<input type="button" id="save" value="새 식단표 등록" style="margin-left: auto;">
						</td>
					</tr>
				</table>
			</form>
   		</div>

      <footer id="fh5co-footer" role="contentinfo" class="fh5co-section">
        <div class="container">
          <div class="row copyright">
            <div class="col-md-12 text-center">
              <p>
                <small class="block"
                  >&copy; 2023 Soldesk Project. All Rights Reserved.</small>
                <small class="block"
                  >Designed by
                  <a href="/main" target="_blank">Linker</a></small
                >
              </p>
            </div>
          </div>
        </div>
      </footer>
    </div>
  </div>
  
      <!-- jQuery -->
    <script src="/js/jquery.min.js"></script>
    <!-- jQuery Easing -->
    <script src="/js/jquery.easing.1.3.js"></script>
    <!-- Bootstrap -->
    <script src="/js/bootstrap.min.js"></script>
    <!-- Waypoints -->
    <script src="/js/jquery.waypoints.min.js"></script>
    <!-- Waypoints -->
    <script src="/js/jquery.stellar.min.js"></script>
    <!-- Flexslider -->
    <script src="/js/jquery.flexslider-min.js"></script>
    <!-- Main -->
    <script src="/js/main.js"></script>
  
</body>
</html>