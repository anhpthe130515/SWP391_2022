<%-- 
    Document   : landingPage
    Created on : Mar 21, 2022, 10:34:34 AM
    Author     : TuanLA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <title>Thuedi</title>
        <!-- Import Boostrap css, js, font awesome here -->
        <link
            rel="stylesheet"
            href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
            />
        <link
            href="https://use.fontawesome.com/releases/v5.0.4/css/all.css"
            rel="stylesheet"
            />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
        <link href="Styles/landingPage.css" rel="stylesheet" />
    </head>
    <body>
        <!-- Navigation -->
        <!--    <nav class="navbar navbar-expand-md navbar-light bg-light fixed-top">
              <div class="container">
                <a class="navbar-branch" href="#">START BOOTSTRAP</a>
                <button
                  class="navbar-toggler"
                  type="button"
                  data-toggle="collapse"
                  data-target="#navbarResponsive"
                >
                  <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                  <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                      <a class="nav-link" href="#">SIGN IN</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="#">LOG IN</a>
                    </li>
                  </ul>
                </div>
              </div>
            </nav>-->
        <%@include file="navbar.jsp" %>
        <!--HeaderMaster-->

        <div
            id="carouselExampleIndicators"
            class="carousel slide"
            data-ride="carousel"
            >
            <ol class="carousel-indicators">
                <li
                    data-target="#carouselExampleIndicators"
                    data-slide-to="0"
                    class="active"
                    ></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img
                        class="d-block w-100 h-100vh"
                        src="https://file.hstatic.net/200000044142/article/thiet-ke-chung-cu-toi-gian_f6f1226e6202407d88f28aa2aecd20c2.jpg"
                        alt="First slide"
                        />
                </div>
                <div class="carousel-item">
                    <img
                        class="d-block w-100 h-100vh"
                        src="https://www.teahub.io/photos/full/38-385059_new-york-apartment.jpg"
                        alt="Second slide"
                        />
                </div>
                <div class="carousel-item">
                    <img
                        class="d-block w-100 h-100vh"
                        src="https://images7.alphacoders.com/424/424076.jpg"
                        alt="Third slide"
                        />
                </div>
            </div>
            <a
                class="carousel-control-prev"
                href="#carouselExampleIndicators"
                role="button"
                data-slide="prev"
                >
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a
                class="carousel-control-next"
                href="#carouselExampleIndicators"
                role="button"
                data-slide="next"
                >
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
            <div class="filterImage"></div>
            <div class="caption">
                <h1 class="masthead-heading mb-0 display-3 font-weight-bold">Thuedi</h1>
                <h2 class="masthead-subheading mb-0 font-weight-bold mt-3">
                    Mang tới cho bạn những căn nhà tốt nhất
                </h2>
                <a class="btn btn-primary btn-custom mt-5 lead" href="#infor"
                   >Tìm hiểu thêm</a
                >
            </div>
        </div>
        <!---->
        <section class="information" id="infor">
            <div class="container px-5">
                <div class="row">
                    <div class="col-lg-6 my-auto p-5 order-lg-1 text p-5">
                        <h2 class="font-weight-bold display-4">
                            Thông tin chi tiết
                        </h2>
                        <p>
                            Giúp bạn ngồi một chỗ cũng hình dung ra được căn nhà của mình
                        </p>
                    </div>
                    <div class="col-lg-6 order-lg-2 p-5">
                        <img class="fluid rounded-circle" src="https://anhbinhminh.info/wp-content/uploads/2021/08/IMG_5654_tn.jpg" alt="" />
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-6 p-5">
                        <img class="fluid rounded-circle" src="https://ko-box.net/data/files/2019/05/31/38b0487e3af704e6f711d29dce8da817.jpg" alt="" />
                    </div>
                    <div class="col-lg-6 my-auto p-5 text">
                        <h2 class="font-weight-bold display-4">Bài đăng chất lượng</h2>
                        <p>
                            Với đội ngũ kiểm duyệt và xác thực thông tin của bài đăng đông đảo, giúp bạn không lo những bài đăng lừa đảo
                        </p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-6 order-lg-1 my-auto p-5 text">
                        <h2 class="font-weight-bold display-4">Covid-19</h2>
                        <p>Hỗ trợ đặc biệt cho người bị Covid</p>
                    </div>
                    <div class="col-lg-6 p-5 order-lg-2">
                        <img class="fluid rounded-circle" src="https://bcp.cdnchinhphu.vn/334894974524682240/2022/3/18/covid19-1647601644762796511986.jpg" alt="" />
                    </div>
                </div>
            </div>
        </section>
        <%@include file="footer.jsp" %>
        <!-- JavaScript Bundle with Popper -->
        <script
            src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
            integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
            crossorigin="anonymous"
        ></script>
        <script
            src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
            integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
            crossorigin="anonymous"
        ></script>
        <script
            src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
            integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
            crossorigin="anonymous"
        ></script>
    </body>
</html>

