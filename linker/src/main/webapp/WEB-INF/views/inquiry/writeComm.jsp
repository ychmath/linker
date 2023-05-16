<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<div>
	<form method="post" name="writeComm" id="writeComm">
		<table>
			<tbody>
				<tr>
					<th>작성자</th>
					<td><input type="text" name="userid" value="${user.userid }" readonly></td>
				</tr>
				
				<tr>
					<th>제목</th>
					<td>
					<c:if test="${dto.inquirypostid == 0 }">
					<input type="text" name="title" maxlength="50" />
					</c:if>
					<c:if test="${dto.inquirypostid != 0 }">
					<input type="text" name="title" maxlength="50" value="[답변]" />
					</c:if>
					</td>
				</tr>
				
				<tr>
					<th>내용</th>
					<td><textarea name="content"></textarea></td>
				</tr>

			</tbody>
		</table>
		<div>
			<span><input type="submit" value="작성" /></span>
			<span><input type="reset" value="다시 작성" /></span>
			<a href="inquiry"><span>글목록</span></a>
		</div>
		</form>
	</div>
</body>
</html>