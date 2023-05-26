<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>비밀번호 찾기</title>
        <!-- Animate.css -->
    <link rel="stylesheet" href="/css/animate.css" />
    <!-- Icomoon Icon Fonts-->
    <link rel="stylesheet" href="/css/icomoon.css" />
    <!-- Bootstrap  -->
    <link rel="stylesheet" href="/css/bootstrap.css" />
    <!-- Flexslider  -->
    <link rel="stylesheet" href="/css/flexslider.css" />
    <!-- Theme style  -->
    <link rel="stylesheet" href="/css/style.css" />
<link rel="stylesheet" href="/css/findpwform.css"/>
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
			<h1 style="color:#ffffff">비밀번호 찾기</h1>
			<form action="/findpw" method="post">
				<label for="userid">아이디:</label> <input type="text" id="userid"
					name="userid" required /> <br /> <label for="email">이메일:</label>
				<input type="email" id="email" name="email" required /> <br />
					<input type="submit"  value="비밀번호 찾기"  style="color:#000000"/>
			</form>
		</div>
	</div>
</body>