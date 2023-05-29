<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>식권 구매 페이지</title>
<style>
#kakaopay{
	background-color: white;
	border: none;
}

</style>
</head>
<body>
	<h1>식권 구매</h1>
	
	<div>
	<table>
	
		<tr>
			<td>식권 종류</td>
			<td><select id="tickettype" name="tickettype">
				<option id="a" value="6000">A</option>
				<option id="b" value="7000">B</option>
				</select></td>
		</tr>
		
		<tr>
			<td>수량</td>
			<td><select id="quantity" name="quantity">
				<option>1</option>
				<option>2</option>
				<option>3</option>
				<option>4</option>
				<option>5</option>
				<option>6</option>
				<option>7</option>
				<option>8</option>
				<option>9</option>
				<option>10</option>
				<option>11</option>
				<option>12</option>
				<option>13</option>
				<option>14</option>
				<option>15</option>
				<option>16</option>
				<option>17</option>
				<option>18</option>
				<option>19</option>
				<option>20</option>
				</select>개</td>
		</tr>

		<tr>
			<td>합계</td>
			<td><span id="price">6000</span>원</td>
		</tr>

		
		<tr>
			<td><span id="A"></span><input type="button" id="delete" value="삭제" style="display:none;"></td>
			
		</tr>
		
		<tr>
			<td><span id="B"></span><input type="button" id="delete2" value="삭제" style="display:none;"></td>
		</tr>
		
		<tr>
			<td>총합계</td>
			<td><span id="totalprice">0</span>원</td>
		</tr>
			
		
		
	</table>
	</div>

</body>
</html>