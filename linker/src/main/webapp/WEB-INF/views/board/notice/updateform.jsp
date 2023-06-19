<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>글 수정</title>
<style>
table {
	border-collapse: collapse;
	width: 100%;
}
</style>
</head>
<body>
	<form method="post" id="updateform" action="/notice/update">
		<input type="hidden" name="_method" value="put" /> <input
			type="hidden" name="noticepostid" value="${dto.noticepostid }" />

		<table border="1">
			<tr>
				<td>제목</td>
				<td><input name="title" value="${dto.title }" /></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input name="userid" value="${dto.userid }" readonly /></td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
					<div id="smarteditor">
						<textarea name="content" id="editorTxt" rows="20" cols="10"
							style="width: 100%"></textarea>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="right"><input type="button" id="upload"
					value="수정" /></td>
			</tr>
		</table>
	</form>

	<!-- Footer Start -->
	<div class="container-fluid bg-dark text-light footer mt-0 pt-0">
		<div class="container">
			<div class="copyright">
				<div class="row">
					<div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
						&copy; <a class="border-bottom" href="#">Linker</a>, All Right
						Reserved.
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Footer End -->
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript" src="/smarteditor/js/HuskyEZCreator.js"
		charset="utf-8"></script>
	<script>
		let oEditors = [];

		smartEditor = function() {
			nhn.husky.EZCreator.createInIFrame({
				oAppRef : oEditors,
				elPlaceHolder : "editorTxt",
				sSkinURI : "/smarteditor/SmartEditor2Skin.html",
				fOnAppLoad : function() {
					oEditors.getById["editorTxt"].exec("PASTE_HTML", [
							"${dto.content}", ]);
				},
				fCreator : "createSEditor2",
			});
		};

		$(document).ready(
				function() {
					smartEditor();

					$("#upload").click(
							function() {
								oEditors.getById["editorTxt"].exec(
										"UPDATE_CONTENTS_FIELD", []);
								$("#updateform").submit();
							});
				});
	</script>
</body>
</html>
