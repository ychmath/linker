<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
  <title>회원가입</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Favicon -->
  <link href="img/favicon.ico" rel="icon">

  <!-- Icon Font Stylesheet -->
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

  <!-- Libraries Stylesheet -->
  <link href="lib/animate/animate.min.css" rel="stylesheet">
  <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
  <link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">

  <!-- Customized Bootstrap Stylesheet -->
  <link href="css/bootstrap.min.css" rel="stylesheet">

  <!-- Template Stylesheet -->
  <link href="css/style.css" rel="stylesheet">
  <link href="css/comm/basicform.css" rel="stylesheet">
</head>

<body>

  <!-- Topbar Start -->
  <div class="container-fluid bg-light p-0">
    <div class="row gx-0 d-none d-lg-flex">
      <div class="col-lg-7 px-5 text-start">
        <div class="h-100 d-inline-flex align-items-center py-3 me-4">
          <small class="fa fa-map-marker-alt text-primary me-2"></small>
          <small>서울특별시 종로구 종로12길 15 코아빌딩1</small>
        </div>
        <div class="h-100 d-inline-flex align-items-center py-3">
          <small class="far fa-clock text-primary me-2"></small>
          <small>월-일: 09.30 AM - 10.00 PM</small>
        </div>
      </div>
      <div class="col-lg-5 px-5 text-end">
        <div class="h-100 d-inline-flex align-items-center py-3 me-4">
          <small class="fa fa-phone-alt text-primary me-2"></small>
          <small>02-6901-7001</small>
        </div>
      </div>
    </div>
  </div>
  <!-- Topbar End -->

  <!-- Navbar Start -->
  <nav class="navbar navbar-expand-lg bg-white navbar-light sticky-top p-0">
    <a href="/" class="navbar-brand d-flex align-items-center px-4 px-lg-5">
      <h2 class="m-0 text-primary">Linker</h2>
    </a>
    <button type="button" class="navbar-toggler me-4" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarCollapse">
      <div class="navbar-nav ms-auto p-4 p-lg-0">
        <c:if test="${ user.role == null }">
          <a href="/" class="nav-item nav-link ">Home</a>
          <a href="/notice/notice" class="nav-item nav-link">공지사항</a>
          <a href="/inquiry/inquiry" class="nav-item nav-link">문의사항</a>
          <a href="/menu/list" class="nav-item nav-link ">식단표</a>
          <a href="/loginform" class="nav-item nav-link">로그인</a>
          <a href="/joinform" class="nav-item nav-link">회원가입</a>
        </c:if>
      </div>
    </div>
  </nav>
  <!-- Navbar End -->
 <div class="center-wrapper content-wrapper">
  <form action="joinform" method="post" id="joinForm">
    <div class="container">
      <div class="content">
        <!-- INPUT -->
        <fieldset class="userjoin">
          <legend>회원정보 입력</legend>
          <div class="info" id="info__id">
            <span class="member-type">회원 유형</span>
            <input type="radio" id="buyer" name="role" value="buyer" checked />
            <label for="buyer">구매자</label>
            <input type="radio" id="seller" name="role" value="seller" />
            <label for="seller">판매자</label>
          </div>
          <div class="info" id="info__id">
            <input type="text" name="name" id="name" placeholder="이름" style="color: black;" required />
            <div id="name_msg"></div>
          </div>
          <div class="info" id="info__id">
            <div id="id-input">
              <input type="text" name="userid" id="userid" placeholder="아이디" style="color: black;" required />
              <input type="button" class="btn" id="id_check" value="중복 확인" style="color: #000000" />
              <div id="id_msg" class="error"></div>
              <input type="hidden" id="id_ck" value="" />
            </div>
          </div>
          <div class="info" id="info__pw">
            <input type="password" name="password" id="password" style="color: black;" placeholder="비밀번호 입력" required />
            <div id="pw_msg" class="error"></div>
          </div>
          <div class="info" id="info__pwRe">
            <input type="password" name="chk_password" id="chk_password" style="color: black;" placeholder="비밀번호 재입력" required />
            <div id="chk_pw_msg" class="error"></div>
          </div>
          <div class="info" id="info__email">
            <div id="id-input">
              <input type="email" name="email" id="email" placeholder="이메일" style="color: black;" required />
              <input type="hidden" name="email_verified" id="email_verified" value="0" />
              <input type="button" id="mail_ck" class="btn" value="이메일 인증" style="color: #000000" />
              <div id="emailresult"></div>
              <div id="email_msg" class="error"></div>
              <input type="hidden" id="ck" value="" />
            </div>
            <div id="input">
              <input id="ck_num" style="color: black;" />
              <input type="button" id="ck_b" class="btn" value="인증 확인" style="color: #000000" />
            </div>
            <div id="result" class="error"></div>
          </div>
          <div class="info" id="info__mobile">
            <input type="text" id="phone" name="phone" placeholder="휴대폰 번호 입력" style="color: black;" oninput="oninputPhone(this);" />
            <div id="phone_msg" class="error"></div>
          </div>
        </fieldset>

        <fieldset class="agrrretype">
          <div class="all-oh">
            <input type="checkbox" name="agreeAllButton" id="agreeAllButton">
            <span style="color: #000000">모두 동의합니다</span>
          </div>
          <fieldset class="agreech">
            <div class="m-box">
              <div class="mandatory">
                <label for="mandatoryTerms1" style="color: #000000">
                  <input type="checkbox" id="mandatoryTerms1" name="mandatoryTerms">
                  이용약관 동의<strong>(필수)</strong>
                </label>
              </div>
              <div class="mandatory">
                <input type="checkbox" id="mandatoryTerms2" name="mandatoryTerms">
                <label for="mandatoryTerms2" style="color: #000000">
                  개인정보 수집, 이용동의 <strong>(필수)</strong>
                </label>
              </div>
              <div class="optional">
                <input type="checkbox" id="optionalTerms1" name="optionalTerms">
                <label for="optionalTerms1" style="color: #000000">
                  개인정보 이용 동의<strong>(선택)</strong>
                </label>
              </div>
              <div class="optional">
                <input type="checkbox" id="optionalTerms2" name="optionalTerms">
                <label for="optionalTerms2" style="color: #000000">
                  이벤트, 혜택정보 수신동의
                  <strong class="select_disable">(선택)</strong>
                </label>
              </div>
            </div>
          </fieldset>
        </fieldset>
      </div>
      <input type="submit" id="registerButton" class="btn" value="가입하기" style="color: black" />
    </div>
  </form>
  </div>
  
  <!-- Footer Start -->
  <div class="container-fluid bg-dark text-light footer mt-0 pt-0">
    <div class="container">
      <div class="copyright">
        <div class="row">
          <div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
            &copy; <a class="border-bottom" href="#">Linker</a>, All Right Reserved.
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- Footer End -->

  <!-- JavaScript Libraries -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
  <script src="lib/wow/wow.min.js"></script>
  <script src="lib/easing/easing.min.js"></script>
  <script src="lib/waypoints/waypoints.min.js"></script>
  <script src="lib/counterup/counterup.min.js"></script>
  <script src="lib/owlcarousel/owl.carousel.min.js"></script>
  <script src="lib/isotope/isotope.pkgd.min.js"></script>
  <script src="lib/lightbox/js/lightbox.min.js"></script>

  <!-- Template Javascript -->
  <script src="js/main.js"></script>
  <script src="js/login/join.js"></script>
</body>

</html>