<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>유통기한별 식자재 검색</title>
  </head>
  <body>
    <div id="center">
      <div id="title"><h1>유통기한으로 식자재 검색</h1></div>
      <form
        id="searchByDate"
        action="/ingredient/searchbydate/result"
        method="get"
      >
        <p><b>검색 기간을 설정하세요.</b></p>
        <input type="date" class="exp" name="startDay" id="startDay" /> -
        <input type="date" class="exp" name="endDay" id="endDay" />
        <input type="button" id="search" value="검색" />
      </form>
    </div>
  </body>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script>
    $(function () {
      $("#search").click(function () {
        let startDay = $("#startDay").val();
        let endDay = $("#endDay").val();

        if (!startDay || !endDay || endDay < startDay) {
          alert("올바른 날짜값을 입력해 주세요.");
          $("#name").focus();
          return false;
        }

        $("#searchByDate").submit();
      }); // search click end
    }); // ready end
  </script>
</html>
