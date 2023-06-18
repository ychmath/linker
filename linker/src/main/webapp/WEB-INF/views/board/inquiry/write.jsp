<%@ page contentType="text/html; charset=UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>

        <!-- jQuery, Bootstrap 라이브러리 CSS, JS 포함 -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
            integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
            integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
            crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
            integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
            crossorigin="anonymous"></script>
        <title>글쓰기</title>
<style>
#upload_btn {
	height: 30px;
	border-top: none;
	border-left: none;
	border-right: none;
	border-bottom: 3px;
	
}
</style>
    </head>

    <body >
    
        <form method="post" id="writenotice" action="write">
            <form>
                <div class="pt-1">
                    <input type="text" name="title" id="title" placeholder="제목을 입력하세요" required
                        style="border-radius:5px; width:100%; padding:5px;">
                </div>
                <div class="pt-1">
                    <input name="userid" id="userid" value="${user.userid }"  style="border-radius:5px; width:100%; padding:5px;" readonly />
                </div>
                <div class="pt-1">
                    <div id="smarteditor">
                    <textarea name="content"  id="editorTxt" rows="20" cols="10" placeholder="내용을 입력해주세요" required
                    style="border-radius:5px; width:100%; padding:5px;"></textarea>
                    </div>
                </div>
                <div class="pt-1 text-right" colspan="2" align="right">
                        <!-- colspan: 셀을 가로로 합병 -->
                        <input type="button"  class="upload_btn" id="upload" style="width:10%; padding:5px;" value="등록" />
                </div>
            </form>
        </form>

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script type="text/javascript" src="/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
        <script>
            let oEditors = [];

            smartEditor = function () {
                console.log("Naver SmartEditor");
                nhn.husky.EZCreator.createInIFrame({
                    oAppRef: oEditors,
                    elPlaceHolder: "editorTxt",
                    sSkinURI: "/smarteditor/SmartEditor2Skin.html",
                    fCreator: "createSEditor2",
                });
            };

            $(document).ready(function () {
                smartEditor();

                $("#upload").click(function () {
                    oEditors.getById["editorTxt"].exec("UPDATE_CONTENTS_FIELD", []);
                    $("#writenotice").submit();
                });
            });
        </script>
    </body>

    </html>