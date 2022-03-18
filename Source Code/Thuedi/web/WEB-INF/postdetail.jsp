<%-- 
    Document   : postdetail
    Created on : Mar 8, 2022, 5:59:05 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="Styles/comments.css" />
        <link rel="stylesheet" href="Styles/style.css" />
        <link
            rel="stylesheet"
            href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
            integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
            crossorigin="anonymous"
            />
        <title>Thuedi</title>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAEaRkuGOICP3om0r-q8qdGYqv2Ur1Wf1s&libraries=places&callback=initialize" async defer></script>
    </head>
    <body>
        <section class="header">
            <nav class="navbar navbar-expand-lg">
                <a class="navbar-brand" href="#">THUEDI</a>
                <button
                    class="navbar-toggler"
                    type="button"
                    data-toggle="collapse"
                    data-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent"
                    aria-expanded="false"
                    aria-label="Toggle navigation"
                    >
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="#"
                               >Trang chủ</a
                            >
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Bài đăng</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Khám Phá</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Lê Anh Tuấn</a>
                        </li>
                        <li class="nav-item" >
                            <a class="nav-link" href="#">Đăng nhập</a>
                        </li>
                    </ul>
                    <form class="form-inline my-2 my-lg-0">
                        <button
                            class="btn btn-outline-success my-2 my-sm-0 ml-3"
                            type="submit"
                            >
                            Đăng bài
                        </button>
                    </form>
                </div>
            </nav>
        </section>

        <section class="main-content">
            <section class="property">
                <div class="property-list">
                    <div
                        id="carouselExampleControls"
                        class="carousel slide"
                        data-ride="carousel"
                        >
                        <div class="carousel-inner">
                            <div class="carousel-item">
                                <img src="/images/item1.jpg" class="d-block w-100" alt="..." />
                            </div>
                            <div class="carousel-item">
                                <img src="/images/item2.jpg" class="d-block w-100" alt="..." />
                            </div>
                            <div class="carousel-item">
                                <img src="/images/image3.png" class="d-block w-100" alt="..." />
                            </div>
                        </div>
                        <a
                            class="carousel-control-prev"
                            href="#carouselExampleControls"
                            role="button"
                            data-slide="prev"
                            >
                            <span
                                class="carousel-control-prev-icon"
                                aria-hidden="true"
                                ></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a
                            class="carousel-control-next"
                            href="#carouselExampleControls"
                            role="button"
                            data-slide="next"
                            >
                            <span
                                class="carousel-control-next-icon"
                                aria-hidden="true"
                                ></span>
                            <span class="sr-only">Next</span>
                        </a>
                    </div>
                    <div class="main-infor">
                        <h4 class="mt-3">${requestScope.post.getTitle()}</h4>
                        <p class="mb-0">Thôn 7 - Thạch Hòa - Thạch Thất</p>
                        <p class="price">4 triệu</p>
                        <h5>Thông tin chính</h5>
                        <div class="infor">
                            <div class="infor-item">
                                <svg
                                    xmlns="http://www.w3.org/2000/svg"
                                    width="25"
                                    height="25"
                                    fill="currentColor"
                                    class="bi bi-dot"
                                    viewBox="0 0 16 16"
                                    >
                                <path d="M8 9.5a1.5 1.5 0 1 0 0-3 1.5 1.5 0 0 0 0 3z" />
                                </svg>
                                Diện tích
                            </div>
                            <div class="infor-item">20m2</div>
                            <div class="infor-item">
                                <svg
                                    xmlns="http://www.w3.org/2000/svg"
                                    width="25"
                                    height="25"
                                    fill="currentColor"
                                    class="bi bi-dot"
                                    viewBox="0 0 16 16"
                                    >
                                <path d="M8 9.5a1.5 1.5 0 1 0 0-3 1.5 1.5 0 0 0 0 3z" />
                                </svg>
                                Nhà tắm
                            </div>
                            <div class="infor-item">1</div>
                            <div class="infor-item">
                                <svg
                                    xmlns="http://www.w3.org/2000/svg"
                                    width="25"
                                    height="25"
                                    fill="currentColor"
                                    class="bi bi-dot"
                                    viewBox="0 0 16 16"
                                    >
                                <path d="M8 9.5a1.5 1.5 0 1 0 0-3 1.5 1.5 0 0 0 0 3z" />
                                </svg>
                                Phòng ngủ
                            </div>
                            <div class="infor-item">1</div>
                            <div class="infor-item">
                                <svg
                                    xmlns="http://www.w3.org/2000/svg"
                                    width="25"
                                    height="25"
                                    fill="currentColor"
                                    class="bi bi-dot"
                                    viewBox="0 0 16 16"
                                    >
                                <path d="M8 9.5a1.5 1.5 0 1 0 0-3 1.5 1.5 0 0 0 0 3z" />
                                </svg>
                                Hướng
                            </div>
                            <div class="infor-item">Bắc</div>
                            <div class="infor-item">
                                <svg
                                    xmlns="http://www.w3.org/2000/svg"
                                    width="25"
                                    height="25"
                                    fill="currentColor"
                                    class="bi bi-dot"
                                    viewBox="0 0 16 16"
                                    >
                                <path d="M8 9.5a1.5 1.5 0 1 0 0-3 1.5 1.5 0 0 0 0 3z" />
                                </svg>
                                Cho F0, F1 thuê
                            </div>
                            <div class="infor-item">Có</div>
                            <div class="infor-item">
                                <svg
                                    xmlns="http://www.w3.org/2000/svg"
                                    width="25"
                                    height="25"
                                    fill="currentColor"
                                    class="bi bi-dot"
                                    viewBox="0 0 16 16"
                                    >
                                <path d="M8 9.5a1.5 1.5 0 1 0 0-3 1.5 1.5 0 0 0 0 3z" />
                                </svg>
                                Ngày đăng
                            </div>
                            <div class="infor-item">12/03/2022</div>
                        </div>
                        <h5 class="mt-4">Giới thiệu</h5>
                        <p>
                            Lorem ipsum dolor, sit amet consectetur adipisicing elit.
                            Asperiores perferendis natus reprehenderit error, ducimus dolorem
                            quibusdam, obcaecati optio consequatur repellat quo voluptatem
                            voluptatum dolorum commodi eaque incidunt itaque nobis quis!
                        </p>
                        <h5 class="mt-4">Xung quanh</h5>
                        <iframe
                            src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3724.56646411855!2d105.51651245313043!3d21.010008696074426!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31345b59dd6595c7%3A0x46465b8b95bd072d!2zTmjDoCBUcuG7jSBHw7NjIEjDoCBO4buZaQ!5e0!3m2!1svi!2s!4v1647187819991!5m2!1svi!2s"
                            width="100%"
                            height="350px"
                            style="border: 0; border-radius: 8px"
                            allowfullscreen=""
                            loading="lazy"
                            ></iframe>
                        <h5 class="mt-4">Bình Luận</h5>

                        <section class="content-item" id="comments">
                            <div class="container">
                                <div class="row">
                                    <div class="col-sm">
                                        <form action="##">
                                            <div class="media pb-0 border-0 cmt-box">
                                                <a class="pull-left" href="#"
                                                   ><img
                                                        class="media-object"
                                                        src="https://scontent.fhan3-5.fna.fbcdn.net/v/t1.6435-9/67353113_2609163919310902_6950528713075195904_n.jpg?_nc_cat=109&ccb=1-5&_nc_sid=174925&_nc_ohc=a9G1HdxTzAMAX-Vc19d&_nc_ht=scontent.fhan3-5.fna&oh=00_AT8saWQnUl2oi1ySdngwoSZzsssCPPLiBDq-J1RZa3Z2Qw&oe=62546717"
                                                        alt=""
                                                        /></a>
                                                <div class="media-body">
                                                    <textarea
                                                        class="form-control"
                                                        id="message"
                                                        placeholder="Your message"
                                                        required=""
                                                        ></textarea>
                                                    <button type="submit" class="cmt-button">
                                                        Submit
                                                    </button>
                                                </div>
                                            </div>
                                        </form>

                                        <h3>2 Bình luận</h3>
                                        <ul class="cmt-list">
                                            <!-- COMMENT 1 - START -->
                                            <li class="media">
                                                <a class="pull-left" href="#"
                                                   ><img
                                                        class="media-object"
                                                        src="https://scontent.fhan3-5.fna.fbcdn.net/v/t1.6435-9/67353113_2609163919310902_6950528713075195904_n.jpg?_nc_cat=109&ccb=1-5&_nc_sid=174925&_nc_ohc=a9G1HdxTzAMAX-Vc19d&_nc_ht=scontent.fhan3-5.fna&oh=00_AT8saWQnUl2oi1ySdngwoSZzsssCPPLiBDq-J1RZa3Z2Qw&oe=62546717"
                                                        alt=""
                                                        /></a>
                                                <div class="media-body">
                                                    <h4 class="media-heading">TuanLA</h4>
                                                    <p>
                                                        Lorem ipsum dolor sit amet, consectetur adipiscing
                                                        elit. Lorem ipsum dolor sit amet, consectetur
                                                        adipiscing elit. Lorem ipsum dolor sit amet,
                                                        consectetur adipiscing elit. Lorem ipsum dolor sit
                                                        amet, consectetur adipiscing elit. Lorem ipsum dolor
                                                        sit amet, consectetur adipiscing elit. Lorem ipsum
                                                        dolor sit amet, consectetur adipiscing elit.
                                                    </p>
                                                    <ul
                                                        class="list-unstyled list-inline media-detail pull-left"
                                                        >
                                                        <li>
                                                            <svg
                                                                xmlns="http://www.w3.org/2000/svg"
                                                                width="16"
                                                                height="16"
                                                                fill="currentColor"
                                                                class="bi bi-calendar-fill mr-1"
                                                                viewBox="0 0 16 16"
                                                                >
                                                            <path
                                                                d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V5h16V4H0V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5z"
                                                                />
                                                            </svg>
                                                            13/03/2022
                                                        </li>
                                                    </ul>
                                                </div>
                                            </li>
                                            <!-- COMMENT 1 - END -->
                                            <!-- COMMENT 1 - START -->
                                            <li class="media">
                                                <a class="pull-left" href="#"
                                                   ><img
                                                        class="media-object"
                                                        src="https://scontent.fhan3-5.fna.fbcdn.net/v/t1.6435-9/67353113_2609163919310902_6950528713075195904_n.jpg?_nc_cat=109&ccb=1-5&_nc_sid=174925&_nc_ohc=a9G1HdxTzAMAX-Vc19d&_nc_ht=scontent.fhan3-5.fna&oh=00_AT8saWQnUl2oi1ySdngwoSZzsssCPPLiBDq-J1RZa3Z2Qw&oe=62546717"
                                                        alt=""
                                                        /></a>
                                                <div class="media-body">
                                                    <h4 class="media-heading">TuanLA</h4>
                                                    <p>
                                                        Lorem ipsum dolor sit amet, consectetur adipiscing
                                                        elit. Lorem ipsum dolor sit amet, consectetur
                                                        adipiscing elit. Lorem ipsum dolor sit amet,
                                                        consectetur adipiscing elit. Lorem ipsum dolor sit
                                                        amet, consectetur adipiscing elit. Lorem ipsum dolor
                                                        sit amet, consectetur adipiscing elit. Lorem ipsum
                                                        dolor sit amet, consectetur adipiscing elit.
                                                    </p>
                                                    <ul
                                                        class="list-unstyled list-inline media-detail pull-left"
                                                        >
                                                        <li>
                                                            <svg
                                                                xmlns="http://www.w3.org/2000/svg"
                                                                width="16"
                                                                height="16"
                                                                fill="currentColor"
                                                                class="bi bi-calendar-fill mr-1"
                                                                viewBox="0 0 16 16"
                                                                >
                                                            <path
                                                                d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V5h16V4H0V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5z"
                                                                />
                                                            </svg>
                                                            13/03/2022
                                                        </li>
                                                    </ul>
                                                </div>
                                            </li>
                                            <!-- COMMENT 1 - END -->
                                            <!-- COMMENT 1 - START -->
                                            <li class="media">
                                                <a class="pull-left" href="#"
                                                   ><img
                                                        class="media-object"
                                                        src="https://scontent.fhan3-5.fna.fbcdn.net/v/t1.6435-9/67353113_2609163919310902_6950528713075195904_n.jpg?_nc_cat=109&ccb=1-5&_nc_sid=174925&_nc_ohc=a9G1HdxTzAMAX-Vc19d&_nc_ht=scontent.fhan3-5.fna&oh=00_AT8saWQnUl2oi1ySdngwoSZzsssCPPLiBDq-J1RZa3Z2Qw&oe=62546717"
                                                        alt=""
                                                        /></a>
                                                <div class="media-body">
                                                    <h4 class="media-heading">TuanLA</h4>
                                                    <p>
                                                        Lorem ipsum dolor sit amet, consectetur adipiscing
                                                        elit. Lorem ipsum dolor sit amet, consectetur
                                                        adipiscing elit. Lorem ipsum dolor sit amet,
                                                        consectetur adipiscing elit. Lorem ipsum dolor sit
                                                        amet, consectetur adipiscing elit. Lorem ipsum dolor
                                                        sit amet, consectetur adipiscing elit. Lorem ipsum
                                                        dolor sit amet, consectetur adipiscing elit.
                                                    </p>
                                                    <ul
                                                        class="list-unstyled list-inline media-detail pull-left"
                                                        >
                                                        <li>
                                                            <svg
                                                                xmlns="http://www.w3.org/2000/svg"
                                                                width="16"
                                                                height="16"
                                                                fill="currentColor"
                                                                class="bi bi-calendar-fill mr-1"
                                                                viewBox="0 0 16 16"
                                                                >
                                                            <path
                                                                d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V5h16V4H0V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5z"
                                                                />
                                                            </svg>
                                                            13/03/2022
                                                        </li>
                                                    </ul>
                                                </div>
                                            </li>
                                            <!-- COMMENT 1 - END -->
                                            <!-- COMMENT 1 - START -->
                                            <li class="media">
                                                <a class="pull-left" href="#"
                                                   ><img
                                                        class="media-object"
                                                        src="https://scontent.fhan3-5.fna.fbcdn.net/v/t1.6435-9/67353113_2609163919310902_6950528713075195904_n.jpg?_nc_cat=109&ccb=1-5&_nc_sid=174925&_nc_ohc=a9G1HdxTzAMAX-Vc19d&_nc_ht=scontent.fhan3-5.fna&oh=00_AT8saWQnUl2oi1ySdngwoSZzsssCPPLiBDq-J1RZa3Z2Qw&oe=62546717"
                                                        alt=""
                                                        /></a>
                                                <div class="media-body">
                                                    <h4 class="media-heading">TuanLA</h4>
                                                    <p>
                                                        Lorem ipsum dolor sit amet, consectetur adipiscing
                                                        elit. Lorem ipsum dolor sit amet, consectetur
                                                        adipiscing elit. Lorem ipsum dolor sit amet,
                                                        consectetur adipiscing elit. Lorem ipsum dolor sit
                                                        amet, consectetur adipiscing elit. Lorem ipsum dolor
                                                        sit amet, consectetur adipiscing elit. Lorem ipsum
                                                        dolor sit amet, consectetur adipiscing elit.
                                                    </p>
                                                    <ul
                                                        class="list-unstyled list-inline media-detail pull-left"
                                                        >
                                                        <li>
                                                            <svg
                                                                xmlns="http://www.w3.org/2000/svg"
                                                                width="16"
                                                                height="16"
                                                                fill="currentColor"
                                                                class="bi bi-calendar-fill mr-1"
                                                                viewBox="0 0 16 16"
                                                                >
                                                            <path
                                                                d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V5h16V4H0V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5z"
                                                                />
                                                            </svg>
                                                            13/03/2022
                                                        </li>
                                                    </ul>
                                                </div>
                                            </li>
                                            <!-- COMMENT 1 - END -->
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </section>
                    </div>
                </div>

                <!-- SIDEBAR -->
                <div class="side-bar">
                    <div class="widget-item">
                        <div class="postdetail-avatar">
                            <img
                                src="https://www.nj.gov/njgf/assets/images/EC_Members_Default.jpg"
                                class="rounded-circle mb-2"
                                width="80px"
                                height="80px"
                                alt=""
                                />
                            <div>
                                <p class="font-weight-bold h5 mb-1">Lê Anh Tuấn</p>
                                <p>Ngày tham gia: 20/02/2022</p>
                            </div>
                        </div>
                        <hr class="mt-15px" />
                        <!-- PHONE BUTTON  -->
                        <div class="widget-item-contact">
                            <div>
                                <svg
                                    xmlns="http://www.w3.org/2000/svg"
                                    class="phone"
                                    viewBox="0 0 20 20"
                                    fill="currentColor"
                                    >
                                <path
                                    d="M2 3a1 1 0 011-1h2.153a1 1 0 01.986.836l.74 4.435a1 1 0 01-.54 1.06l-1.548.773a11.037 11.037 0 006.105 6.105l.774-1.548a1 1 0 011.059-.54l4.435.74a1 1 0 01.836.986V17a1 1 0 01-1 1h-2C7.82 18 2 12.18 2 5V3z"
                                    />
                                </svg>
                                <span class="h6 ml-1 phone-number">0972536780</span>
                            </div>

                            <button class="btn btn-show-phone">Bấm để hiện số</button>
                        </div>

                        <!-- EMAIL BUTTON  -->
                        <a
                            href="mailto:abc@example.com?subject = [Thuedi] Hỏi Thêm Thông Tin Phòng Trọ"
                            >
                            <div class="widget-item-contact-email">
                                <svg
                                    xmlns="http://www.w3.org/2000/svg"
                                    width="26"
                                    height="26"
                                    fill="currentColor"
                                    class="bi bi-envelope-fill"
                                    viewBox="0 0 16 16"
                                    >
                                <path
                                    d="M.05 3.555A2 2 0 0 1 2 2h12a2 2 0 0 1 1.95 1.555L8 8.414.05 3.555ZM0 4.697v7.104l5.803-3.558L0 4.697ZM6.761 8.83l-6.57 4.027A2 2 0 0 0 2 14h12a2 2 0 0 0 1.808-1.144l-6.57-4.027L8 9.586l-1.239-.757Zm3.436-.586L16 11.801V4.697l-5.803 3.546Z"
                                    />
                                </svg>
                                <span class="email ml-2">Gửi Email</span>
                            </div>
                        </a>
                    </div>
                    <div class="report">
                        <a href="#comments" >Report</a>
                    </div>

                </div>
            </section>
        </section>
        <section class="footer">Footer demo</section>



        !--        <h1>${requestScope.error}</h1>
        <h1>
            ${requestScope.post.getTitle()}
            <br>
            ${requestScope.post.getDetail()}
            <br>
            ${requestScope.post.getPrice()}
            <br>
            ${requestScope.post.getArea()}
            <br>
            ${requestScope.post.getNumberOfBedrooms()}
            <br>
            ${requestScope.post.getDirection()}
            <br>
            ${requestScope.post.getAddress()}
            <br>
            ${requestScope.post.getAddressDetail()}
            <br>
            ${requestScope.post.getPropertyType()}
            <br>
            ${requestScope.post.getCreateDate()}
            <br>
        </h1>-->
        <div id="map" style="width: 50vw; height: 50vh;"></div>

        <script>
            var map;

            function initialize() {
                // Create a map centered in Pyrmont, Sydney (Australia).
                map = new google.maps.Map(document.getElementById('map'), {
                    center: {lat: 21.024178, lng: 105.832500},
                    zoom: 12
                });

                // Search for Google's office in Australia.
                var request = {
                    location: map.getCenter(),
                    radius: '500',
                    query: '${requestScope.post.getAddressDetail()}'
                };

                var service = new google.maps.places.PlacesService(map);
                service.textSearch(request, callback);
            }
            // Checks that the PlacesServiceStatus is OK, and adds a marker
            // using the place ID and location from the PlacesService.
            function callback(results, status) {
                console.log(status, results);
                if (status == google.maps.places.PlacesServiceStatus.OK) {
                    var marker = new google.maps.Marker({
                        map: map,
                        place: {
                            placeId: results[0].place_id,
                            location: results[0].geometry.location
                        }
                    });
                }
            }
        </script>

        <form method="post" action="create?id=${requestScope.post.getId()}">
            <textarea name="content"></textarea>
            <button>Comment</button>
        </form>
        <c:forEach items="${requestScope.comments}" var="comment">
            <div>
                <h5>${comment.getComment()}</h5>
                <h5>${comment.getUserId()}</h5>
                <h5>${comment.getCreateDate()}</h5>
                <a href="delete?commentId=${comment.getId()}">Delete</a>
            </div>
        </c:forEach>

        <!-- JAVASCRIPT -->
        <script>
            let slider = document.querySelectorAll(".carousel-item");
            let phoneNumber = document.querySelector(".phone-number");
            let showPhoneNumber = document.querySelector(".btn-show-phone");
            slider[0].classList.add("active");

            //hidden phone number
            let slidePhone = phoneNumber.innerHTML.slice(6);
            let hiddenPhone = phoneNumber.innerHTML.slice(0, 6) + "****";
            phoneNumber.innerHTML = hiddenPhone;
            showPhoneNumber.addEventListener("click", function () {
                phoneNumber.innerHTML = phoneNumber.innerHTML.slice(0, 6) + slidePhone;
            })


        </script>
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
