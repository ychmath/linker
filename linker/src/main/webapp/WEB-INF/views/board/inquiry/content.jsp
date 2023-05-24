<%@ page contentType="text/html; charset=UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
  <head>
    <title>글 상세보기</title>
    <style>
      table {
        border-collapse: collpase;
        width: 100%;
      }
    </style>
  </head>
  <body>
    <div id="container">
      <table border="1">
        <tr>
          <td>제목</td>
          <td>${dto.title }</td>
        </tr>
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
          <td><fmt:formatDate value="${dto.creationdate }" /></td>
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
      </table>
    </div>

    <div>
      <span>
        <input
          type="button"
          value="답글쓰기"
          onclick="location.href='/inquiry/writeComm?inquirypostid=${dto.inquirypostid }&ref=${dto.ref }&restep=${dto.restep }&relevel=${dto.relevel }'"
        />
      </span>
      <span>
        <input
          type="button"
          value="목록"
          onclick="location.href='../inquiry'"
        />
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
