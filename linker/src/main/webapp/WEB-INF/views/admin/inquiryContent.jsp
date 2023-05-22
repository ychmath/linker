<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세 보기</title>
</head>
<body>
	<div class="main">
		<table class="content" border="1">
			<tr><td>제목</td><td>${ dto.title }</td>
			<tr><td>작성자</td><td>${ dto.userid }</td>
			<tr><td>내용</td><td>${ dto.content }</td>
			<tr><td>등록일</td><td><fmt:formatDate value="${ dto.creationdate }" dateStyle="long"/></td>
			<tr><td colspan="2" align="right">
				<a id="delete" href="/admin/inquiry/delete/${ dto.inquirypostid }">글 삭제</a>
				<a href="../inquiry">목록 이동</a>
			</td></tr>
		</table>
	</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(function(){
		$("#delete").click(function(){
			var inquirypostid = ${ dto.inquirypostid };

			$.ajax({
				url:"/admin/inquiry/delete/" + inquirypostid,
				method:"delete",
				data:{"inquirypostid":inquirypostid}
			}).done(function(result){
				alert("삭제가 완료되었습니다.");
				location.replace(result);
			});	// ajax end

			return false;
		});	// click end
	}); // ready end
</script>
</body>
</html>