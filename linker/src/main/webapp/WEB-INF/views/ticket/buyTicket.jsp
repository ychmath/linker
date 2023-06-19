<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>식권 구매 페이지</title>
<style>
#kakaopay {
	background-color: white;
	border: none;
}
</style>
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Favicon -->
<link href="img/favicon.ico" rel="icon">

<!-- Icon Font Stylesheet -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="lib/animate/animate.min.css" rel="stylesheet">
<link href="lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">

<!-- Customized Bootstrap Stylesheet -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="css/style.css" rel="stylesheet">

</head>
  
<body>

	<!-- Topbar Start -->
	<div class="container-fluid bg-light p-0">
		<div class="row gx-0 d-none d-lg-flex">
			<div class="col-lg-7 px-5 text-start">
				<div class="h-100 d-inline-flex align-items-center py-3 me-4">
					<small class="fa fa-map-marker-alt text-primary me-2"></small> <small>서울특별시
						종로구 종로12길 15 코아빌딩1</small>
				</div>
				<div class="h-100 d-inline-flex align-items-center py-3">
					<small class="far fa-clock text-primary me-2"></small> <small>월
						- 일 : 09.30 AM - 10.00 PM</small>
				</div>
			</div>
			<div class="col-lg-5 px-5 text-end">
				<div class="h-100 d-inline-flex align-items-center py-3 me-4">
					<small class="fa fa-phone-alt text-primary me-2"></small> <small>02-6901-7001</small>
				</div>
			</div>
		</div>
	</div>
	<!-- Topbar End -->

	<!-- Navbar Start -->
	<nav
		class="navbar navbar-expand-lg bg-white navbar-light sticky-top p-0">
		<a href="/"
			class="navbar-brand d-flex align-items-center px-4 px-lg-5">
			<h2 class="m-0 text-primary">Linker</h2>
		</a>
		<button type="button" class="navbar-toggler me-4"
			data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarCollapse">
			<div class="navbar-nav ms-auto p-4 p-lg-0">
				<c:if test="${ user.role == null }">
					<a href="/" class="nav-item nav-link active">Home</a>
					<a href="/notice/notice" class="nav-item nav-link">공지사항</a>
					<a href="/inquiry/inquiry" class="nav-item nav-link">문의사항</a>
					<a href="/menu/list" class="nav-item nav-link">식단표</a>
					<a href="/loginform" class="nav-item nav-link">로그인</a>
					<a href="/joinform" class="nav-item nav-link">회원가입</a>
				</c:if>
				<c:if test="${ user.role == 'admin' }">
					<a href="/" class="nav-item nav-link active">Home</a>
					<a href="/notice/notice" class="nav-item nav-link">공지사항</a>
					<a href="/inquiry/inquiry" class="nav-item nav-link">문의사항</a>
					<a href="/admin" class="nav-item nav-link">관리요약</a>
					<a href="/inquiry/inquiry" class="nav-item nav-link">게시글 관리</a>
					<a href="/notice/notice" class="nav-item nav-link">회원 관리</a>
					<span class="nav-item nav-link">${user.userid} 관리자님 환영합니다.</span>
					<a href="/logout" class="nav-item nav-link">로그아웃</a>
				</c:if>
				<c:if test="${ user.role == 'seller' }">
					<a href="/" class="nav-item nav-link active">Home</a>
					<a href="/notice/notice" class="nav-item nav-link">공지사항</a>
					<a href="/inquiry/inquiry" class="nav-item nav-link">문의사항</a>
					<a href="/menu/write" class="nav-item nav-link">식단표 관리</a>
					<div class="nav-item dropdown">
						<div class="nav-link dropdown-toggle" data-bs-toggle="dropdown">식자재 관리</div>
						<div class="dropdown-menu fade-up m-0">
							<a href="/ingredient/ingredientList" class="dropdown-item">식자재 목록</a>
							<a href="/inventory/inventoryList" class="dropdown-item">재고현황</a> 
							<a href="/inventory/orderList" class="dropdown-item">발주내역</a> 
							<a href="/inventory/useDetailList" class="dropdown-item">사용내역</a>
						</div>
					</div>
					<div class="nav-item dropdown">
						<div class="nav-link dropdown-toggle" data-bs-toggle="dropdown">비용 관리</div>
						<div class="dropdown-menu fade-up m-0">
							<a href="/profitChart" class="dropdown-item">요약</a> 
							<a href="/finance/sales" class="dropdown-item">매출내역</a> 
							<a href="/finance/expenditure" class="dropdown-item">지출내역</a>
						</div>
					</div>
										<div class="nav-item dropdown">
						<div class="nav-link dropdown-toggle" data-bs-toggle="dropdown">나의 정보</div>
						<div class="dropdown-menu fade-up m-0">
							<a href="/updateform" class="dropdown-item">회원정보 수정</a> 
							<a href="/deleteform" class="dropdown-item">회원탈퇴</a>
						</div>
					</div>
					<span class="nav-item nav-link">${user.userid} 판매자님 환영합니다.</span>
					<a href="/logout" class="nav-item nav-link">로그아웃</a>
				</c:if>
				<c:if test="${ user.role == 'buyer' }">
					<a href="/" class="nav-item nav-link active">Home</a>
					<a href="/notice/notice" class="nav-item nav-link">공지사항</a>
					<a href="/inquiry/inquiry" class="nav-item nav-link">문의사항</a>
					<a href="/menu/list" class="nav-item nav-link">식단표</a>
					<a href="/ticket/buyTicket" class="nav-item nav-link">식권 구매</a>
					<div class="nav-item dropdown">
						<div class="nav-link dropdown-toggle" data-bs-toggle="dropdown">나의 정보</div>
						<div class="dropdown-menu fade-up m-0">
							<a href="/ticketorder/ticketorderform" class="dropdown-item">식권 구매내역</a> 
							<a href="/ticketuse/ticketuseform" class="dropdown-item">식권 사용내역</a>
							<a href="/updateform" class="dropdown-item">회원정보 수정</a> 
							<a href="/deleteform" class="dropdown-item">회원탈퇴</a>
						</div>
					</div>
					<span class="nav-item nav-link">${user.userid} 구매자님 환영합니다.</span>
					<a href="/logout" class="nav-item nav-link">로그아웃</a>
				</c:if>
			</div>
		</div>
	</nav>
	<!-- Navbar End -->
	<h1>식권 구매</h1>

	<div>
		<table>

			<tr>
				<td><img src="/img/ticketA.png" id="picA" width="50%"></td>
				<td><img src="/img/ticketB.png" id="picB" width="55%"
					style="display: none"></td>
			</tr>

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
				<td><input type="button" id="add" value="추가"></td>
			</tr>

			<tr>
				<td><span id="A"></span><input type="button" id="delete"
					value="삭제" style="display: none;"></td>

			</tr>

			<tr>
				<td><span id="B"></span><input type="button" id="delete2"
					value="삭제" style="display: none;"></td>
			</tr>

			<tr>
				<td>총합계</td>
				<td><span id="totalprice">0</span>원</td>
			</tr>



		</table>
	</div>
	<form method="get" id="buyTicket" action="/ticket/buyTicket1"
		name="form">
		<c:forEach items="${ids}" var="ticketid" varStatus="status">
			<!-- 			tickettype/quantity -->
			<input type="hidden"
				name="ticketOrderDto[${status.index}].tickettype"
				value="${ticketid}">
			<input type="hidden" name="ticketOrderDto[${status.index}].quantity"
				value="0" id="${ticketid}">


		</c:forEach>


		<button id="kakaopay">
			<img src="/img/kakaopay.png">
		</button>
	</form>

	<p>----------------------------------------------------------------------------------------------------</p>

	<h4>식권 상세 정보</h4>
	<div>
		<table>
			<tr>
				<td>식권A</td>
			</tr>
			<tr>
				<td>한식, 중식, 양식 코너에서 사용 가능</td>
			</tr>

			<tr>
				<td>식권B</td>
			</tr>

			<tr>
				<td>프리미엄 코너에서 사용 가능</td>
			</tr>
		</table>
	</div>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$("#kakaopay").click(function() {

			var A = $("#A").text();
			var B = $("#B").text();

			if (A == "" && B == "") {
				alert("구매하실 식권을 1가지 이상 선택하세요.");
				return false;
			} else {
				if (A) {
					$("#1").val($("#A > span:nth-child(2)").text());
				}
				if (B) {
					$("#2").val($("#B > span:nth-child(2)").text());
				}

				$("#buyTicket").submit();
			}
		})

		$("#tickettype").change(function() {
			if ($(this).val() == '6000') {
				$("#picA").show();
				$("#picB").hide();
			} else {
				$("#picA").hide();
				$("#picB").show();
			}
		})

		//select태그와 span태그를 가져옴 
		const ticketTypeSelect = document.getElementById("tickettype");
		//const: 상수 값 
		const quantitySelect = document.getElementById("quantity");
		const totalPriceSpan = document.getElementById("price");

		function calculateTotalPrice() {
			const ticketTypePrice = parseInt(ticketTypeSelect.value);
			//ticketTypeSelect 객체에서 현재 선택된 option의 value값을 가져와서 parseInt() 함수를 통해 정수형으로 변환한 후 ticketTypePrice 변수에 저장
			//value값이 A가 아니라 6000이어야 되기 때문
			const quantitySelectPrice = parseInt(quantitySelect.value);
			//toLocaleString(): 숫자를 지역화된 문자열로 변환하여 반환하는 메서드.
			//즉, 해당 지역에서 사용하는 언어와 통화에 맞게 변환하여 문자열로 반환함
			const totalPrice = ticketTypePrice * quantitySelectPrice;
			//totalPriceSpan.textContent = totalPrice.toLocaleString();
			totalPriceSpan.textContent = totalPrice.toString();
		}
		//이벤트를실행할타겟.addEventListener('이벤트타입', 실행할함수);
		//이벤트 리스너는 사용자가 DOM 요소에 특정 이벤트를 발생시켰을 때 호출되는 함수
		ticketTypeSelect.addEventListener("change", calculateTotalPrice);
		quantitySelect.addEventListener("change", calculateTotalPrice);

		function calculateTotalPrice2() {
			const ticketTypePrice = parseInt(ticketTypeSelect.value);
			//ticketTypeSelect 객체에서 현재 선택된 option의 value값을 가져와서 parseInt() 함수를 통해 정수형으로 변환한 후 ticketTypePrice 변수에 저장
			//value값이 A가 아니라 6000이어야 되기 때문
			const quantitySelectPrice = parseInt(quantitySelect.value);
			//toLocaleString(): 숫자를 지역화된 문자열로 변환하여 반환하는 메서드
			//즉, 해당 지역에서 사용하는 언어와 통화에 맞게 변환하여 문자열로 반환함
			const totalPrice = ticketTypePrice * quantitySelectPrice;
			//return totalPrice.toLocaleString();
			return totalPrice.toString();
		}

		$("#add")
				.click(
						function() {
							let a = $("#tickettype option:selected").text(); //option:selected=> 선택된 것
							const quantitySelectPrice = parseInt(quantitySelect.value);
							var A = $("#A").text();
							var B = $("#B").text();
							var deleteBtn = $("#delete");
							var deleteBtn2 = $("#delete2");

							if ('A' == a) {
								if (A != "") {
									alert("삭제하고 다시 추가해주세요.")
								} else {
									$("#A").append(
											"<span class='p'>" + a + "</span>");
									$("#A").append(
											" <span class='p'>"
													+ quantitySelectPrice
													+ "</span>개");
									$("#A").append(
											"<span class='p' id='calculateATotalPrice2'> "
													+ calculateTotalPrice2()
													+ "원</span>");
									deleteBtn.show();
								}

							} else {
								if (B != "") {
									alert("삭제하고 다시 추가해주세요.")
								} else {
									$("#B")
											.append(
													"<span class='p'> " + a
															+ "</span>");
									$("#B").append(
											"<span class='p'> "
													+ quantitySelectPrice
													+ "</span>개");
									$("#B").append(
											"<span class='p' id='calculateBTotalPrice2'> "
													+ calculateTotalPrice2()
													+ "원</span>");
									deleteBtn2.show();
								}
							}

							function calculateTotalPrice3() {
								const totalPrice2Span = document
										.getElementById("totalprice");

								let aPrice = $("#calculateATotalPrice2").text();
								let bPrice = $("#calculateBTotalPrice2").text();

								/* $("#A .p:nth-child(3)").each(function () {
								//$("#A .p:nth-child(3)"): #A 이하의 요소들 중에서, 그 중에서 p 클래스를 가진 요소들 중에서 순서상 3번째에 해당하는 요소를 선택하는 jQuery 선택자 표현
								  //each(): jQuery에서 제공하는 반복문 함수. 선택한 요소들 각각에 대해 지정된 함수를 실행함
								aPrice += parseInt($(this).text());
								});

								$("#B .p:nth-child(3)").each(function () {
								  bPrice += parseInt($(this).text());
								}); */

								if (aPrice == "") {
									aPrice = 0;
								}
								if (bPrice == "") {
									bPrice = 0;
								}

								const totalPrice = parseInt(aPrice)
										+ parseInt(bPrice);

								totalPrice2Span.textContent = totalPrice
										.toString();

							}
							return calculateTotalPrice3();
						})

		$("#delete").click(function() {
			const amount = parseInt($("#calculateATotalPrice2").text());
			//alert(amount);
			$("#A").text("");
			$(this).hide();
			updateTotalPrice3(amount);
		})

		$("#delete2").click(function() {
			const amount = parseInt($("#calculateBTotalPrice2").text())
			//alert(amount);
			$("#B").text("");
			$(this).hide();
			updateTotalPrice3(amount);
		})

		function updateTotalPrice3(amount) {
			const $totalPrice2 = parseInt($("#totalprice").text());
			//alert($totalPrice2)
			const totalAmount = $totalPrice2 - amount;
			$("#totalprice").text(totalAmount.toString());
		}
	</script>

</body>
</html>