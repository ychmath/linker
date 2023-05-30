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
	.orange {
		width: 10%;
	}
	.tname {
		width: 10%;
	}
</style>
</head>
<body>
	<div class="fh5co-cover" style="height: 200px"></div>
	<div class="fh5co-loader"></div>
	<div id="page">
		<nav class="fh5co-nav" role="navigation">
			<!-- <div class="top-menu"> -->
			<div class="container">
				<div class="row">
					<div class="col-xs-12 text-right menu-1 menu-wrap">
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
					</div>	<%-- menu wrap end --%>
				</div>	<%-- row end --%>
					
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
					</div>	<%-- menu wrap end --%>
				</div>	<%-- row end --%>
			</div>
			<!-- </div> -->
		</nav>

		<div id="fh5co-slider" class="fh5co-section animate-box">
			<div class="fh5co-cover" style="height: 200px"></div>

			<div class="main">
				<div class="container">
					<div class="content">
						<h1 class="title">${ dto.title }</h1>
							<table class="menu">
								<tr>
									<td class="orange">작성자</td>
									<td>${ dto.userID }</td>
								</tr>
								<tr>
									<td class="orange">등록일</td>
									<td><fmt:formatDate value="${ dto.creationDate }" dateStyle="long"/></td>
								</tr>
								<tr>
									<td class="orange">내용</td>
									<td>${ dto.content }</td>
								</tr>
								<tr>
									<td colspan="2" align="right">
									<!-- 작성자의 id와 현재 게시글의 id가 같을 경우 -->
									<c:if test="${ dto.userID == user.userid }">
										<a href="/menu/update/${ dto.menuID }">글 수정</a>
										<a id="delete" href="/menu/delete/${ dto.menuID }">글 삭제</a>
									</c:if>
										<a href="../list">목록 이동</a> 
									</td>
								</tr>
							</table>
				</div>	<%-- main > content end --%>
				</div>	<%-- main > container end --%>
			</div>	<%-- main end --%>

		<footer id="fh5co-footer" role="contentinfo" class="fh5co-section">
			<div class="container">
				<div class="row copyright">
					<div class="col-md-12 text-center">
						<p>
							<small class="block">&copy; 2023 Soldesk Project. All
								Rights Reserved.</small> <small class="block">Designed by <a
								href="http://freehtml5.co/" target="_blank">Linker</a>
							</small>
						</p>
					</div>
				</div>
			</div>
		</footer>
			</div>	<%-- footer > container end --%>
	</div>	<%-- page end --%>

	<div class="gototop js-top">
		<a href="#" class="js-gotop"><i class="icon-arrow-up22"></i></a>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
	$(function(){
		$("#delete").click(function(){
			var menuID = ${ dto.menuID };
			
			$.ajax({
				url: "/menu/delete/" + ${ dto.menuID },
				method: "delete",
				data:{menuID:menuID}
			}).done(function(result){
				alert("삭제가 완료되었습니다.");
				location.replace(result);
			});
			return false;
		});
			
	});
	</script>
</body>
</html>