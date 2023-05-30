<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
  <head>
        <!-- Animate.css -->

    <link rel="stylesheet" href="/css/login/findidform.css"/>
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
            <h1 style="color: black;">아이디 찾기</h1>
            <form action="/find-id" method="post">
                <label for="name" style="color: black;" >이름:</label>
                <input type="text" id="name" name="name" required  style="color: black;"/>
                <br />
                <label for="email" style="color: black;">이메일:</label>
                <input type="email" id="email" name="email" required  style="color: black;"/>
                <br />
                <button type="submit" style="color: #ffffff;">아이디 찾기</button>
            </form>
        </div>
    </div>
</body>
</html>
