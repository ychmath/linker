<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Linker</title>
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
	.menu {
		border-bottom: 1px solid gray;
	}
	.title {
		width: 700px;
		margin-top: 30px;
	}
	.pageController {
		width: 100%;
		text-align: center;
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
	if (!(role == 'seller' || role == 'admin')) {
		alert("열람 권한이 없는 페이지입니다.");
		location.href = "/main";
	}
	
	// ajax row data
	// 테이블에 넣어 둘 기본값을 정한다.
	var ajax_data = [
		{tname:"조식", line1:"없음", line2:"없음", line3:"없음", line4:"없음", line5:"없음"},
		{tname:"중식", line1:"없음", line2:"없음", line3:"없음", line4:"없음", line5:"없음"},
		{tname:"석식", line1:"없음", line2:"없음", line3:"없음", line4:"없음", line5:"없음"}
	]
	
	// create HTML table	
	// create data table > start
	var tbl = "";	// 테이블을 저장할 변수 선언
	
	tbl += "<table class=\'table table-hover'\ id=\'myTable'\>";
	
	// 반복문으로 테이블 2개 생성
	for (var i = 0; i < 2; i++) {
		// crate table header > start
		tbl += "<thead>";
			tbl += "<tr>";
				tbl += "<th>시간</th>";
				// 총 5일치가 한 줄이 되므로 <th> 태그 5번 반복
				for(let i = 0; i < 5; i++) {
					tbl += "<th><div class=\'row_data'\ edit_type=\'click'\'>날짜를 입력해 주세요.</div></th>";
				}
			tbl += "</tr>";
		tbl += "</thead>";
	// create table > header > end

	// create table body > start
		tbl += "<tbody>";
	// create table body rows > start
	$.each(ajax_data, function(index, val){
		// 지정해 둔 배열만큼 열과 행을 만든다.
		tbl += "<tr>";
			tbl += "<td class=\'tname'\><div class=\'row_data'\  col_name=\'tname'\>" + val["tname"] + "</div></td>";
			tbl += "<td><div class=\'row_data'\ edit_type=\'click'\'>" + val["line1"] + "</div></td>";
			tbl += "<td><div class=\'row_data'\ edit_type=\'click'\>" + val["line2"] + "</div></td>";
			tbl += "<td><div class=\'row_data'\ edit_type=\'click'\>" + val["line3"] + "</div></td>";
			tbl += "<td><div class=\'row_data'\ edit_type=\'click'\>" + val["line4"] + "</div></td>";
			tbl += "<td><div class=\'row_data'\ edit_type=\'click'\>" + val["line5"] + "</div></td>";
		tbl += "</tr>";
	});
	// create table body rows > end	
		tbl += "</tbody>";
	}
	// create table body > end
	tbl += "</table>";
	// create data table > end

	// make div editable > start
	// 클래스가 row_data인 경우 click했을 경우 이벤트가 발생한다.
	$(document).on("click", ".row_data", function(){
		// 클릭한 row_data 자식 div 클래스에 contenteditable 속성을 true로 지정
		$(this).closest("div").attr("contenteditable", "true");
		// add bg css
		$(this).addClass("bg-warning").css("padding", "5px");

		$(this).focus();
	
	});
	// make div editable > end
	
	// 테이블 객체를 tbl_user_data 위치에 html 전달
	$(document).find(".tbl_user_data").html(tbl);

	$("#save").click(function(event){
		// 클릭했을 경우 바로 submit하지 않고 정지
		event.preventDefault();

		// 수정 가능 여부, css 여부 삭제
		$("div").removeClass("bg-warning");
		$("div").removeAttr("contenteditable");

		// 전송할 content에 수정된 table의 html을 가져온다.
		$("#content").val(table.outerHTML);
		// disabled였던 content를 false로 바꾸면서 전송 가능하도록 한다.
		$("#content").attr("disabled", false);

		// 폼 submit
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
          	<!-- 로그인한 유저의 권한을 저장하는 span 태그 -->
            <span id="role" style="display: none;">${ user.role }</span>
            	<ul class="userStatus">
            		<c:if test="${ user.userid == null }">
           				<li class="login"><a href="/loginform">로그인</a></li>
                		<li class="signup"><a href="/joinform">회원가입</a></li>
              		</c:if>
              		<c:if test="${ user.userid != null }">
    					<li class="myinfo">${ user.userid } 회원님 환영합니다!</li>
        				<li class="logout"><a href="/logout">로그아웃</a></li>
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
                <li><a href="/notice/notice">공지사항</a></li>
                <li><a href="/inquiry/inquiry">문의사항</a></li>
                <li class="active"><a href="/menu/list">식단표</a></li>
             <c:if test="${ user.role == 'seller' }">
                <li><a href="/finance/sales">매출</a></li>
                <li><a href="/finance/expenditure">지출</a></li>
                <li><a href="/ingredient/ingredientList">식자재 관리</a></li>
                <li><a href="/profitChart">차트</a></li>
       		</c:if>
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
						<td><input name="title" style="background-color: inherit;"/></td>
					</tr>
					<tr>
						<td class="orange">작성자</td>
						<td><input name="userID" style="background-color: inherit; color: white;" value="${ user.userid }" readonly></td>
					</tr>
					<tr>
						<td class="orange">내용</td>
						<td>
							<!-- 아래 content에 table 내용이 들어갑니다. -->
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
                  <a href="http://freehtml5.co/" target="_blank">Linker</a></small
                >
              </p>
            </div>
          </div>
        </div>
      </footer>
    </div>
  </div>
</body>
</html>