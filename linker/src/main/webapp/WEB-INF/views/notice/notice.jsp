<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>공지사항</title>
<style>
#notice{
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

#inquiry{
	background-color: white;
}

th{
	border: 1px solid black;
	background-color: gray;
}

a{
	margin-left: 1040px;
}
</style>
</head>
<body>
	<div id="notice">
	<h1>공지사항</h1>
	</div>
	
	<div id="search">
		<form action="action">
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
			<th>공지사항</th>
			<th id="inquiry">문의사항</th>
		</tr>
	</table>
	
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