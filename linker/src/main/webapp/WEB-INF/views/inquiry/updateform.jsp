<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>글수정</title>
<style>
	table{
		border-collpase: collapse;
		width: 100%;
	
	}

</style>

</head>
<body>
	<form method="post" id="updateform" action="/inquiry/update">
	<input type="hidden" name="_method" value="put">
	<input type="hidden" name="inquirypostid" value="${dto.inquirypostid }">
	
	<table border="1">
		<tr>
			<td>제목</td>
			<td><input name="title" value="${dto.title}"></td>
		</tr>
		<tr>
			<td>작성자</td>
			<td><input name="writer" value="${dto.userid }" readonly></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><div id="smarteditor">
				<textarea name="content" id="editorTxt"
				rows="20" cols="10" style="width:100%"></textarea>
				</div></td>
		</tr>
		<tr>
			<td colspan="2" align="right">
			<input type="button" id="upload" value="수정"></td>
		</tr>
	</table>
	
	
	
	</form>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript" src="/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
	<script>
	let oEditors = []

    smartEditor = function() {
      nhn.husky.EZCreator.createInIFrame({
        oAppRef: oEditors,
        elPlaceHolder: "editorTxt",
        sSkinURI: "/smarteditor/SmartEditor2Skin.html",
        fOnAppLoad : function(){
            oEditors.getById["editorTxt"].exec("PASTE_HTML", ['${dto.content}']);
        },
        fCreator: "createSEditor2"
      })
    }
    
    $(document).ready(function(){
    	smartEditor()
    	
    	$("#upload").click(function(){
    		 oEditors.getById["editorTxt"].exec("UPDATE_CONTENTS_FIELD", []);
    		$("#updateform").submit();
    	})
    })
    	
	
	</script>
	
	
</body>
</html>