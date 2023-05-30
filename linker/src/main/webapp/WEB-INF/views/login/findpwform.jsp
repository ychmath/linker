<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>비밀번호 찾기</title>
        <!-- Animate.css -->
<link rel="stylesheet" href="/css/login/findpwform.css"/>
<link rel="stylesheet" href="/css/style.css"/>
<script>
      function showResult(message, success) {
        if (message) {
          alert(message);
          if (success) {
            location.href = "/loginform";
          }
        }
      }
    </script>
             <style>
    #userid{
    	width:300px;
    	height:50px;
    	border-top:none;
    	border-left:none;
    	border-right:none;
    	border-bottom: 3px solid #000000;
    }
        #email{
    	width:300px;
    	height:50px;
    	border-top:none;
    	border-left:none;
    	border-right:none;
    	border-bottom: 3px solid #000000;
    }

  </style>
</head>
<body onload="showResult('${message}', ${success});">
	<div class="container">
		<div class="content">
			<h1 style="color: black;">비밀번호 찾기</h1>
			<form action="/findpw" method="post">
				<label for="userid" style="color: black;">아이디:</label> <input type="text" id="userid"
					name="userid" required style="color: black;" />  <label for="email" style="color: black;">이메일:</label>
				<input type="email" id="email" name="email" required style="color: black;" />
					<input type="submit"  value="비밀번호 찾기"  style="color:#000000"/>
			</form>
		</div>
	</div>
</body>