<%-- 
    Document   : postdetail
    Created on : Mar 8, 2022, 5:59:05 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html style="height: 100%">
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
    <body style="position: relative;min-height: 100%; padding-bottom: 21rem">
        <%@include file="navbar.jsp"%>

        <section class="main-content ">
            <section class="property">
                <div class="property-list">

                    <!--CAROUSEL-->
                    <div
                        id="carouselExampleControls"
                        class="carousel slide"
                        data-ride="carousel"
                        >
                        <div class="carousel-inner">
                            <c:forEach items="${listImageId}" var="o">
                                <div class="carousel-item">
                                    <img id="image"src="/Thuedi/PostImage/${o}" class="d-block w-100"/>
                                </div>
                            </c:forEach>
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
                        <p class="mb-0">${requestScope.post.getAddressDetail()}</p>
                        <p class="price">${requestScope.post.getPrice()} VNĐ</p>
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
                            <div class="infor-item">
                                <fmt:formatNumber pattern="#####">${requestScope.post.getArea()}</fmt:formatNumber>m2
                                </div>
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
                                <div class="infor-item">${requestScope.post.getNumberOfBedrooms()}</div>
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
                            <div class="infor-item">${requestScope.post.getNumberOfRestrooms()}</div>
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
                            <div class="infor-item">${requestScope.post.getDirection()}</div>
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
                            <div class="infor-item">${post.isAcceptCovidPatient()==true?"Có":"Không"}</div>
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
                            <div class="infor-item"><fmt:formatDate pattern = "dd/MM/yyyy" value = "${requestScope.post.getCreateDate()}" /></div>
                        </div>
                        <h5 class="mt-4">Giới thiệu</h5>
                        <p>
                            ${requestScope.post.getDetail()}
                        </p>
                        <h5 class="mt-4">Xung quanh</h5>

                        <!--MAP-->
                        <div id="map" style="width: 100%; height: 350px;"></div>

                        <div class="mt-3">
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
                                Báo cáo bài viết
                            </button>
                            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                                 aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">Báo cáo bài viết</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body modal-body-postDetail">
                                            <form method="post" action="/Thuedi/User/ReportPost">
                                                <input style="display:none" type="text" name="id" value="${requestScope.post.getId()}"/>
                                                <label for="detail">Vui lòng điền nội dung bạn muốn báo cáo</label>
                                                <input style="width:100%; margin-top:20px" type="text" name="detail"/>
                                                <div class="modal-footer modal-footer-postDetail">
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                    <button type="submit" class="btn btn-primary">Báo cáo</button>
                                                </div>
                                            </form>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>

                        <!--COMMENTS-->
                        <h5 class="mt-4">Bình Luận</h5>

                        <section class="content-item" id="comments">
                            <div class="container">
                                <div class="row">
                                    <div class="col-sm">
                                        <!--FORM-->
                                        <form method="post" action="/Thuedi/User/comment?id=${requestScope.post.getId()}">
                                            <div class="media pb-0 border-0 cmt-box">
                                                <a class="pull-left" href="#"
                                                   ><img
                                                        class="media-object"
                                                        src="/Thuedi/PostImage/${comment.getUserDetail().getUserId()} "
                                                        onError="this.onerror=null;this.src='https://scontent.fhan3-5.fna.fbcdn.net/v/t1.6435-9/67353113_2609163919310902_6950528713075195904_n.jpg?_nc_cat=109&ccb=1-5&_nc_sid=174925&_nc_ohc=-Se--Qeha08AX-xImWj&_nc_ht=scontent.fhan3-5.fna&oh=00_AT_NUcycQRrLxd5hFdmGDGs1hstNCV6RrL-50tTHcjiC5Q&oe=62585B97'"
                                                        /></a>
                                                <div class="media-body">
                                                    <textarea
                                                        class="form-control"
                                                        name="content"
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

                                        <!--<h3>Bình luận</h3>-->

                                        <ul class="cmt-list">
                                            <!-- COMMENT  - START -->
                                            <c:forEach items="${requestScope.comments}" var="comment">
                                                <li class="media">
                                                    <a class="pull-left" href="#"
                                                       ><img
                                                            class="media-object"
                                                            src="/Thuedi/PostImage/${comment.getUserDetail().getUserId()}"
                                                            onError="this.onerror=null;this.src='https://scontent.fhan3-5.fna.fbcdn.net/v/t1.6435-9/67353113_2609163919310902_6950528713075195904_n.jpg?_nc_cat=109&ccb=1-5&_nc_sid=174925&_nc_ohc=-Se--Qeha08AX-xImWj&_nc_ht=scontent.fhan3-5.fna&oh=00_AT_NUcycQRrLxd5hFdmGDGs1hstNCV6RrL-50tTHcjiC5Q&oe=62585B97'"
                                                            /></a>
                                                    <div class="media-body">
                                                        <h4 class="media-heading">${comment.getUserDetail().getName()}</h4>
                                                        <p>${comment.getComment().getComment()}</p>
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
                                                                <fmt:formatDate pattern = "dd/MM/yyyy" value = "${comment.getComment().getCreateDate()}"/>
                                                            </li>
                                                            <li>
                                                                <a style="padding-right: 10px" href="DeleteComment?id=${comment.getComment().getId()}">Delete</a>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </li>
                                                <!-- COMMENT  - END -->
                                            </c:forEach>
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
                                <p class="font-weight-bold h5 mb-1">${requestScope.authorDetail.getName()}</p>
                                <p>Ngày tham gia: 
                                    <fmt:formatDate pattern = "dd/MM/yyyy" value = "${author.getCreateDate()}" />
                                </p>
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
                                <span class="h6 ml-1 phone-number">${requestScope.authorDetail.getPhone()}</span>
                            </div>

                            <button class="btn btn-show-phone">Bấm để hiện số</button>
                        </div>

                        <!-- EMAIL BUTTON  -->
                        <a
                            href="mailto:${requestScope.author.getEmail()}?subject = [Thuedi] Hỏi Thêm Thông Tin Phòng Trọ"
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

                    <div
                        class="modal fade"
                        id="report"
                        tabindex="-1"
                        aria-labelledby="exampleModalLabel"
                        aria-hidden="true"
                        >
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">
                                        Thông báo
                                    </h5>
                                    <button
                                        type="button"
                                        class="btn btn-light"
                                        data-bs-dismiss="modal"
                                        aria-label="Close"
                                        >
                                        <svg
                                            xmlns="http://www.w3.org/2000/svg"
                                            width="16"
                                            height="16"
                                            fill="currentColor"
                                            class="bi bi-x-lg"
                                            viewBox="0 0 16 16"
                                            >
                                        <path
                                            fill-rule="evenodd"
                                            d="M13.854 2.146a.5.5 0 0 1 0 .708l-11 11a.5.5 0 0 1-.708-.708l11-11a.5.5 0 0 1 .708 0Z"
                                            />
                                        <path
                                            fill-rule="evenodd"
                                            d="M2.146 2.146a.5.5 0 0 0 0 .708l11 11a.5.5 0 0 0 .708-.708l-11-11a.5.5 0 0 0-.708 0Z"
                                            />
                                        </svg>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    Bạn có muốn xóa bài viết này không ?
                                </div>
                                <div class="modal-footer">
                                    <button
                                        type="button"
                                        class="btn btn-secondary"
                                        data-bs-dismiss="modal"
                                        >
                                        Thoát
                                    </button>
                                    <a href="DeletePost?id=${o.getId()}" class="btn btn-primary">
                                        Đồng ý
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div

                </div>
            </section>
        </section>
        <section class="footer">Footer demo</section>


        <!-- JAVASCRIPT -->
        <script>
            let image = document.getElementById("image");
            let caroseo = document.querySelector(".carousel-inner");
            if (image !== null) {
                let slider = document.querySelectorAll(".carousel-item");
                slider[0].classList.add("active");
            } else {
                caroseo.innerHTML = "<div class='carousel-item active'> <img src='https://bandon.vn/resize/1000x700/a-c/zc-1/f/uploads/posts/thiet-ke-nha-tro-dep-2020-bandon-0.jpg' class='d-block w-100'/></div><div class='carousel-item'> <img src='https://dichvuchuyendo.net/wp-content/uploads/2020/10/phong-tro-co-gac-lung.jpg' class='d-block w-100'/></div>";
            }
            //hidden phone number
            let phoneNumber = document.querySelector(".phone-number");
            let showPhoneNumber = document.querySelector(".btn-show-phone");
            let slidePhone = phoneNumber.innerHTML.slice(6);
            let hiddenPhone = phoneNumber.innerHTML.slice(0, 6) + "****";
            phoneNumber.innerHTML = hiddenPhone;
            showPhoneNumber.addEventListener("click", function () {
                phoneNumber.innerHTML = phoneNumber.innerHTML.slice(0, 6) + slidePhone;
            });


        </script>
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
