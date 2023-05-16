<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>문의사항</title>
<style>
#inquiry{
	margin-left: auto;
	margin-right: auto;
	width: 700px;
}

#search{
	margin-left: 860px;
}

table{
	border: 1px solid black;
	width: 700px;
	border-collapse: collapse;
	margin-left: auto;
	margin-right: auto;
}

#notice{
	background-color: white;
}

th{
	border: 1px solid black;
	margin-left: auto;
	margin-right: auto;
	background-color: gray;
}

a{
	margin-left: 1040px;
}

</style>


</head>
<body>
	<div id="inquiry">
		<h1>문의사항</h1>
	</div>

	<table>
		<tr>
			<th id="notice">공지사항</th>
			<th>문의사항</th>
		</tr>
	</table>

	<div id="search">
		<form action="search">
			<select name="searchn">
				<option value="0">제목</option>
				<option value="1">작성자</option>
			</select>
			<input type="text" name="search" size="15" maxlength="40" />
			<input type="submit" value="검색" />
		</form>
	</div>

	<table>
		<tr>
			<th>게시글 번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
		</tr>
	
	</table>
	
	<div>
		<a href="write">글쓰기</a>
	</div>

</body>
</html>