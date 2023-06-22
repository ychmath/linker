<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Linker</title>

		<span id="role" style="display: none;">${ user.role }</span>

		<div id="fh5co-about" class="fh5co-section">
			<div class="fh5co-cover" style="height: 50px"></div>
			<div class="container">
				<div class="about-text">
					<h1 class="title">
						<a href="/ingredient/ingredientList">식자재 목록</a>
					</h1>
					<div class="listController">
						<p>
							<b>식자재 추가</b>
						</p>
						<form id="addIngredient" action="/ingredient/insert" method="post">
							<span>식자재명:&nbsp;</span><input name="ingredientname" required>&nbsp;
							<span>단위:&nbsp;</span> <select name="unit" required>
								<option value="KG">KG</option>
								<option value="G">G</option>
								<option value="LB">LB</option>
								<option value="OZ">OZ</option>
							</select><span>유통기한:&nbsp;</span><input name="exp" type="date"required>
							<div>
								<input type="button" id="add" class="button btn btn-primary" value="식자재 등록" />
							</div>
						</form>
					</div>
					<div class="content">
						<form id="deleteIngredient">
								<table class="IngredientList" id="IngredientList">
									<tr>
										<th style="width: 5%;"></th>
										<th>식자재명</th>
										<th>단위</th>
										<th>유통기한</th>
									</tr>
									<c:forEach items="${ ingredientList }" var="ingredient">
										<tr class="ingredientlist">
											<td>
											<input type="checkbox" name="checkList" class="checkList" value="${ ingredient.ingredientid }">
											</td>
											<td>${ ingredient.ingredientname }</td>
											<td>${ ingredient.unit }</td>
											<td>${ ingredient.exp }</td>
										</tr>
									</c:forEach>
								</table>
								<div>
									<input type="button" id="delete" class="button btn btn-primary" value="선택한 식자재 삭제" />
								</div>
								</form>
								<div class="pageController">
									<c:if test="${ begin > end }">
										<a href="change?p=${ begin-1 }">[이전]</a>
									</c:if>
									<c:forEach begin="${ begin }" end="${ end }" var="i">
										<a href="change?p=${ i }">${ i }</a>
									</c:forEach>
									<c:if test="${ end < totalPages }">
										<a href="change?p=${ end + 1 }">[다음]</a>
									</c:if>
								</div>
					</div>
					<%-- main > content end --%>
				</div>
				<%-- main > container end --%>
			</div>
			<%-- main end --%>
		</div>
		<!-- about end -->

		<!-- Footer Start -->
		<div
			class="container-fluid bg-dark text-light footer mt-5 pt-5 wow fadeIn"
			data-wow-delay="0.1s">
			<div class="container">
				<div class="copyright">
					<div class="row">
						<div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
							&copy; <a class="border-bottom" href="#">Linker</a>, All Right
							Reserved.
						</div>
						<div class="col-md-6 text-center text-md-end">
							<!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you'd like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
							Designed By <a class="border-bottom" href="https://htmlcodex.com">HTML
								Codex</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%-- page end --%>

	<!-- JavaScript Libraries -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="/lib/wow/wow.min.js"></script>
	<script src="/lib/easing/easing.min.js"></script>
	<script src="/lib/waypoints/waypoints.min.js"></script>
	<script src="/lib/counterup/counterup.min.js"></script>
	<script src="/lib/owlcarousel/owl.carousel.min.js"></script>
	<script src="/lib/isotope/isotope.pkgd.min.js"></script>
	<script src="/lib/lightbox/js/lightbox.min.js"></script>

	<!-- Template Javascript -->
	<script src="../js/main.js"></script>
	</div>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(function() {
			// 권한 가져오기
			var role = $("#role").text();

			// 열람 권한이 없다면 페이지 이동.
			if (!(role != 'seller' || role != 'admin')) {
				alert("열람 권한이 없는 페이지입니다.");
				location.href = "/main";
			}

			$("#delete").on("click", function() {
				// 체크박스에 체크된 식자재 id 번호 값 찾기
				$(".checkList:checked").each(function(i, item) {
					// target에 value값 저장
					var target = item.value;

					$.ajax({
						url : "/ingredient/delete/" + target,
						method : "delete",
						data : {
							'ingredientid' : target
						}
					}).done(function(result) {

					});
				}); // each end

				alert("삭제가 완료되었습니다.");
				location.replace("/ingredient/change");
			});

			$("#add").on(
					"click",
					function(event) {
						// 바로 전송 차단
						event.preventDefault;

						// 하나라도 값이 입력되지 않은 경우
						if (!$("input[name='ingredientname']").val()
								|| !$("select[name='unit']").val()
								|| !$("input[name='exp']").val()) {
							// submit 하지 않고 alert 출력
							alert("필수 항목을 전부 입력해 주십시오.");
						} else {
							// 전부 입력했다면 submit
							alert("등록이 완료되었습니다.");
							$("#addIngredient").submit();
						}
					});
		});
	</script>
</body>
</html>