<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
  <head>
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
    <link rel="stylesheet" href="/css/findidform.css"/>
         <style>
    #name{
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
    <meta charset="UTF-8" />
    <title>아이디 찾기</title>
  </head>
<body>
   
    <div class="container">
        <div class="content">
            <h1 style="color:#ffffff">아이디 찾기</h1>
            <form action="/find-id" method="post">
                <label for="name">이름:</label>
                <input type="text" id="name" name="name" required />
                <br />
                <label for="email">이메일:</label>
                <input type="email" id="email" name="email" required />
                <br />
                <button type="submit" style="color:#ffffff">아이디 찾기</button>
            </form>
        </div>
    </div>
</body>
</html>
