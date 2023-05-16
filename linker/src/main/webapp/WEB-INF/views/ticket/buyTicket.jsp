<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>식권 구매 페이지</title>
</head>
<body>
	<h1>식권 구매</h1>
	
	<form action="totalTicket">
	<table>
		<tr>
			<td>식권 종류</td>
			<td><select name="ticketType">
				<option value="A">A: 6000원</option>
				<option value="B">B: 7000원</option>
				</select></td>
		</tr>
		
		<tr>
			<td>수량</td>
			<td><input type="text" name="quantity" id="quantity" value="1"></td>
		</tr>
		
		<tr>
			<td><input type="submit" value="구매"></td>
		</tr>
			
	</table>
	</form>
</body>
</html>