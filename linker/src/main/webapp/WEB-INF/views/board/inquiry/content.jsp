<%@ page contentType="text/html; charset=UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

            <!DOCTYPE html>
            <html>

            <head>
                <!-- jQuery, Bootstrap 라이브러리 CSS, JS 포함 -->
                <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
                    integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
                    crossorigin="anonymous">
                <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
                    integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
                    crossorigin="anonymous"></script>
                <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
                    integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
                    crossorigin="anonymous"></script>
                <title>글 상세보기</title>
                <style>
                    table {
                        border-collapse: collpase;
                        width: 100%;
                    }
                </style>
            </head>

            <body style="padding-top: 5rem;">
                <form>
                    <div id="container">
                        <div class="pt-1">
                            <input type="button" name="title" id="title" value="제목: ${dto.title}"
                              style="border-radius:5px; width:100%; padding:5px;" readonly>
                          </div>
                            <tr>
                                <td>작성자</td>
                                <td>${dto.userid }</td>
                            </tr>
                            <tr>
                                <td>내용</td>
                                <td>${dto.content }</td>
                            </tr>
                            <tr>
                                <td>작성일</td>
                                <td>
                                    <fmt:formatDate value="${dto.creationdate }" />
                                </td>
                            </tr>

                            <tr>
                                <td colspan="2" align="right">
                                    <c:if test="${user.userid == dto.userid }">
                                        <a href="/inquiry/update/${dto.inquirypostid }">수정</a>
                                        <a id="${dto.inquirypostid }" href="#">삭제</a>
                                    </c:if>
                                    <a href="../inquiry">목록 이동</a>
                                </td>
                            </tr>
                        
                    </div>
                </form>

                <div>
                    <span>
                        <input type="button" value="답글쓰기"
                            onclick="location.href='/inquiry/writeComm?inquirypostid=${dto.inquirypostid }&ref=${dto.ref }&restep=${dto.restep }&relevel=${dto.relevel }'" />
                    </span>
                    <span>
                        <input type="button" value="목록" onclick="location.href='../inquiry'" />
                    </span>
                </div>
                <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
                <script>
                    $(function () {
                        $("a[id]").click(function () {
                            let no = $(this).attr("id");
                            $.ajax({
                                url: "/inquiry/delete",
                                data: "inquirypostid=" + no,
                                method: "delete",
                            }).done(function () {
                                location.href = "/inquiry/inquiry";
                            });
                            return false; //하이퍼링크 이동x
                        });
                    });
                </script>
            </body>

            </html>