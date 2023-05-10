<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/loginform.css">
<title>회원 가입</title>
<style>
    #input, #result, #chk_email {
        display: none;
    }
    </style>
</head>
<body>
    <h1>회원 가입</h1>
    <form action="#" method="get" id="joinForm">
        <div class="user-details">
          <div class="input-box">
            <span class="details">이름</span>
            <input type="text" name="name" id="name"
              placeholder="실명을 입력해주세요." required>
          </div>
       
          <div class="input-box">
            <span class="details">아이디</span>
            <input type="text" name="userid" id="userid" 
              placeholder="아이디를 6~20자 이내로 입력하세요." required> 
            <input type="button" id="id_check" value="중복 확인"> 
            <span id="id_msg"></span>
            <input type="hidden" id="id_ck" value=""/>
          </div>

          <div class="input-box">
            <span class="details">비밀번호</span>
            <input type="password" name="password" id="password"
              placeholder="비밀번호를 6~20자 이내로 입력해주세요." required>
            <div id="pw_msg"></div>
          </div>

          <div class="input-box">
            <span class="details">비밀번호 확인</span>
            <input type="password" name="chk_password" id="chk_password"
              placeholder="비밀번호를 다시 입력해주세요." required>
          </div>

          <div class="input-box">
            <span class="details">회사 이메일</span>
            <input type="text" name="email" id="email" 
              placeholder="메일을 입력하세요." required>
            <div id="emailresult"></div>                  
            <input type="button" id="chk_dup_email" value="중복 확인">
            <span id="email_msg"></span>
            <input type="hidden" id="ck" value=""/>
            <input type="button" id="chk_email" value="메일 인증">                   
            <div id="input">
                <input id="ck_num"><input type="button" id="ck_b" value="인증번호 확인">
            </div>
            <div id="result"></div>
          </div>

          <div class="input-box">
            <span class="details">전화번호</span>
            <input type="text" name="phone" id="phone"
              placeholder="전화번호를 입력해주세요.">
          </div>
        </div>
        <div class="button">
          <input type="submit" value="Register">
        </div>
    </form>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
    $(function(){
      $("#id_check").click(function(){
        let id = $("#userid").val();
        if(!id){
          $("#id_msg").html("아이디를 입력하세요")
          return false;
        }
        
        $.ajax({
          url: "/idCheck",
          data: "id=" + id,
          datatype: "text"
        }).done(
          function(data){
            if(data == ""){
              $("#id_msg").html("사용가능한 아이디 입니다.");
              $("#id_ck").val("1");
            }else{
            $("#id_msg").html("이미 사용중인 아이디입니다.");
            $("#id_ck").val("0");
            }
        })
        
      })

      $("#joinForm").submit(function() {
        if ($("#id_ck").val() != "1") {
          $("#id_msg").html("아이디 중복 체크 하셔야 합니다.");
          return false;
        }
        if (!$("#password").val()) {
          alert("비밀번호를 입력해야 합니다.");
          return false;
        }
        if($("#ck").val() != "1"){
          alert("이메일 인증을 완료해주세요.");
          return false;
        }
      })
    })

  let num = "";

    $(function(){
      $("#chk_dup_email").click(function(){
        let email = $("#email").val();
        if(!email){
          $("#email_msg").html("메일 주소를 입력하세요.");
          return false;
        }
        
        $.ajax({
          url: "/emailCheck",
          data: "email=" + email,
          dataType: "text"
        }).done(
          function(data){
            if(data == ""){
              $("#email_msg").html("사용 가능한 이메일입니다.");
              $("#chk_email").css('display', 'block');
            }else{
              $("#email_msg").html("이미 사용중인 이메일입니다.");            
            }
        })
      })

      $("#chk_b").click(function(){
        let ck_num = $("#ck_num").val();
        if(ck_num == num){
          $("#result").html("인증되었습니다.")
          $("#ck").val("1");
        }else{
          $("#result").html("인증 실패했습니다. 다시 확인해주세요.")
        }
      })
    }) 

    </script>
</body>
</html>
