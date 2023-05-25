<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<title>식권 사용</title>
   
</head>
<body>
    <h1>식권 사용</h1> <!-- 임시 제목이에요 -->
    <div>
    <form id="phone-form">
        <table>
            <tr>
                <td>식권 종류</td>
                <td><select id="tickettype" name="ticketType">
                <option id="a" value="6000">A</option>
                <option id="b" value="7000">B</option>
                </select></td>
            </tr>
            
            
        <tr>
            <td>전화번호 입력</td>
            <td>
                
                    <input type="text" id="phone-number" name="phone_number">
               
            </td>
        </tr>
        <tr>
            <td><input type="submit" id="add" value="식권 사용"></td>
        </tr>
        <tr>
            <td><input type="button" id="delete" value="취소" style="display:none;"></td>
            
        </tr>
        
        
        </table>
        </form> 
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
         <script>
    $(function() {
        $("#phone-form").submit(function(event) {
            event.preventDefault();
            useMealTicket();
        });

        $("#delete").click(function() {
            cancel();
        });
    });

        function useMealTicket() {
            var ticketType = $("#tickettype").val();
            var selectedQuantity = $("#quantity").val();
            var phoneNumber = $("#phone-number").val();

            // AJAX 요청으로 백엔드와 통신하여 식권 사용 처리할 수 있도록 코드 다음과 같이 넣어야 함
            $.ajax({
                type:"POST",
                url:"/ticketuse/use",
                data:{ "tickettypename": tickettypename, "quantity": quantity, "phone": phone }),
                contentType: "application/json",
                success: function(response) {
                    if (response.success) {
                        alert("식권이 정상적으로 사용되었습니다.");
                    } else {
                        alert("식권 사용 중 오류가 발생했습니다.");
                    }
                },
                error: function(err) {
                    alert("식권 사용 중 오류가 발생했습니다.");
                }
            });
        }

        function cancel() {
            // 취소 작업을 수행하는 로직
        }
    </script>
      
    </div>
</body>
</html>
