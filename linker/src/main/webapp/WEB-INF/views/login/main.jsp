<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html >
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>Linker</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <link
      href="https://fonts.googleapis.com/css?family=Cormorant+Garamond:300,300i,400,400i,500,600i,700"
      rel="stylesheet"
    />
    <link
      href="https://fonts.googleapis.com/css?family=Satisfy"
      rel="stylesheet"
    />

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

    <!-- Modernizr JS -->
    <script src="/js/modernizr-2.6.2.min.js"></script>
    <!-- FOR IE9 below -->
    <!--[if lt IE 9]>
      <script src="js/respond.min.js"></script>
    <![endif]-->
    <script>
      function checkLoginStatus() {
        const isLoggedIn = false;

        const loginSignupButtons = document.querySelectorAll(".login-signup");
        if (!isLoggedIn) {
          loginSignupButtons.forEach((button) => {
            button.style.display = "block";
          });
        } else {
          loginSignupButtons.forEach((button) => {
            button.style.display = "none";
          });
        }
      }
    </script>
  </head>
  <body onload="checkLoginStatus()">
    <div class="fh5co-loader"></div>
    <div id="page">
      <nav class="fh5co-nav" role="navigation">
        <!-- <div class="top-menu"> -->
        <div class="container">
          <div class="row">
            <div class="col-xs-12 text-right menu-1 menu-wrap">
              <ul>
                <li>	<h3><a href="/checkPassword"><i class="bi bi-person-fill"></i>${user.userid}</a>님이 로그인하셨습니다.</h3></li>
              </ul>
            </div>
          </div>

          <div class="row">
            <div class="col-xs-12 text-center logo-wrap">
              <div id="fh5co-logo">
                <a href="/">Linker<span>.</span></a>
              </div>
            </div>

            <div class="col-xs-12 text-left menu-1 menu-wrap">
              <ul>
                <li class="active"><a href="/">홈</a></li>
                <li><a href="/notice/notice">공지사항</a></li>
                <li><a href="/inquiry/inquiry">문의사항</a></li>
                <li><a href="/menu/list">식단표</a></li>
                <li><a href="/finance/sales">매출</a></li>
                <li><a href="/finance/expenditure">지출</a></li>
                <li><a href="/ticketorder/ticket">식권구매</a></li>
                <li><a href="/profitChart">차트</a></li>
              </ul>
            </div>
          </div>
        </div>
        <!-- </div> -->
      </nav>

      <div id="fh5co-slider" class="fh5co-section animate-box">
        <div class="fh5co-cover" style="height: 200px"></div>
        <div class="container">
          <div class="row">
            <div class="col-md-6 animate-box">
              <div class="fh5co-heading">
                <h2>식단표</h2>
                <p>신선한 재료, 최상급의 식자재로 만든 프리미엄 식단!!!</p>
              </div>
            </div>
            <div class="col-md-6 col-md-push-1 animate-box">
              <aside id="fh5co-slider-wrwap">
                <div class="flexslider">
                  <ul class="slides">
                    <li style="background-image: url(/img/gallery_7.jpeg)">
                      <div class="overlay-gradient"></div>
                      <div class="container-fluid">
                        <div class="row">
                          <div
                            class="col-md-12 col-md-offset-0 col-md-pull-10 slider-text slider-text-bg"
                          >
                            <div class="slider-text-inner">
                              <div class="desc">
                                <h2>조식</h2>
                                <p>맛있돠</p>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </li>
                    <li style="background-image: url(/img/gallery_6.jpeg)">
                      <div class="overlay-gradient"></div>
                      <div class="container-fluid">
                        <div class="row">
                          <div
                            class="col-md-12 col-md-offset-0 col-md-pull-10 slider-text slider-text-bg"
                          >
                            <div class="slider-text-inner">
                              <div class="desc">
                                <h2>중식</h2>
                                <p>맛있돠</p>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </li>
                    <li style="background-image: url(/img/gallery_5.jpeg)">
                      <div class="overlay-gradient"></div>
                      <div class="container-fluid">
                        <div class="row">
                          <div
                            class="col-md-12 col-md-offset-0 col-md-pull-10 slider-text slider-text-bg"
                          >
                            <div class="slider-text-inner">
                              <div class="desc">
                                <h2>석식</h2>
                                <p>맛있돠</p>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </li>
                  </ul>
                </div>
              </aside>
            </div>
          </div>
        </div>
      </div>

      <footer id="fh5co-footer" role="contentinfo" class="fh5co-section">
        <div class="container">
          <div class="row copyright">
            <div class="col-md-12 text-center">
              <p>
                <small class="block"
                  >&copy; 2023 Soldesk Project. All Rights Reserved.</small
                >
                <small class="block"
                  >Designed by
                  <a href="http://freehtml5.co/" target="_blank">Linker</a>
                </small>
              </p>
            </div>
          </div>
        </div>
      </footer>
    </div>

    <div class="gototop js-top">
      <a href="#" class="js-gotop"><i class="icon-arrow-up22"></i></a>
    </div>

    <!-- jQuery -->
    <script src="/js/jquery.min.js"></script>
    <!-- jQuery Easing -->
    <script src="/js/jquery.easing.1.3.js"></script>
    <!-- Bootstrap -->
    <script src="/js/bootstrap.min.js"></script>
    <!-- Waypoints -->
    <script src="/js/jquery.waypoints.min.js"></script>
    <!-- Waypoints -->
    <script src="/js/jquery.stellar.min.js"></script>
    <!-- Flexslider -->
    <script src="/js/jquery.flexslider-min.js"></script>
    <!-- Main -->
    <script src="/js/main.js"></script>
  </body>
</html>
