<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>글쓰기</title>
<style>
	table{
		border-collapse: collapse;
		width: 810px;
	}
</style>


</head>
<body>

	<form method="post" id="writenotice" action="write">
		<table border="1">
			<tr>
				<td>제목</td>
				<td><input name="title" id="title"/></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input name="userid" id="userid" value="${user.userid }" readonly/></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><div id="smarteditor">
						<textarea name="content" id="editorTxt" rows="20" cols="10"
							placeholder="내용을 입력해주세요" style="width: 700px"></textarea>
					</div></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<!-- colspan: 셀을 가로로 합병 --> 
					<input type="button" id="upload" value="등록">
				</td>
			</tr>
		</table>
	</form>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript" src="/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
	<script>
let oEditors = []

smartEditor = function() {
  console.log("Naver SmartEditor")
  nhn.husky.EZCreator.createInIFrame({
    oAppRef: oEditors,
    elPlaceHolder: "editorTxt",
    sSkinURI: "/smarteditor/SmartEditor2Skin.html",
    fCreator: "createSEditor2"
  })
} 

$(document).ready(function() {

  smartEditor()

	$("#upload").click(function(){
		 oEditors.getById["editorTxt"].exec("UPDATE_CONTENTS_FIELD", []);
		$("#writenotice").submit();
	});
})


</script>

</body>
</html>