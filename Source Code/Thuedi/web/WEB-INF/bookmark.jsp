<%-- 
    Document   : bookmark
    Created on : Mar 15, 2022, 11:20:31 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="../Styles/style.css" />
        <link
            rel="stylesheet"
            href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
            integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
            crossorigin="anonymous"
            />
        <title>Thuedi</title>
    </head>
    <body>
        <section class="header" id="navbar">
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
                               >Home <span class="sr-only">(current)</span></a
                            >
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Link</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Link</a>
                        </li>
                        <li class="nav-item">
                            <a
                                class="nav-link disabled"
                                href="#"
                                tabindex="-1"
                                aria-disabled="true"
                                >Disabled</a
                            >
                        </li>
                    </ul>
                    <form class="form-inline my-2 my-lg-0">
                        <a
                            class="btn btn-outline-success my-2 my-sm-0 ml-3"
                            type="submit"
                            href="/Thuedi/Landlord/CreatePost"
                            >
                            Post
                        </a>
                    </form>
                </div>
            </nav>
        </section>

        <section class="main-content">
            <h5 class="mb-2">Bài đăng đã lưu</h5>
            <section class="manager-post">
                <!-- USER INFORMATION -->
                <div class="landlord-side-bar">
                    <div class="widget-item">
                        <div class="avatar">
                            <img
                                src="https://www.nj.gov/njgf/assets/images/EC_Members_Default.jpg"
                                class="rounded-circle mb-2"
                                width="125px"
                                height="125px"
                                alt=""
                                />
                            <span class="font-weight-bold h5">${user.getEmail()}</span>
                            <span>Tổng số bài đăng: ${post_bookmark.size()}</span>
                            <span>Ngày tham gia: <span id="joinDate">${user.getCreateDate()}</span></span>
                        </div>
                    </div>
                </div>
                <div class="manager-post-list">
                    <ul>
                        <!-- ITEMS LIST -->
                        <c:forEach items="${requestScope.post_bookmark}" var="o">
                            <li class="property-list-items">
                                <a href="#">
                                    <ul class="item">
                                        <div class="item-img">
                                            <img src="/Thuedi/PostImage/${o.getPost().getId()}" onError="this.onerror=null;this.src='https://dichvuchuyendo.net/wp-content/uploads/2020/10/phong-tro.jpg'"/>
                                        </div>

                                        <ul class="item-infor">
                                            <li class="item-infor-title">
                                                ${o.getPost().getTitle()}
                                            </li>
                                            <li class="font-weight-light">${o.getPost().getAddressDetail()} - Ngọc Khánh - Ba Đình</li>
                                            <ul class="item-attr">
                                                <li><b><fmt:formatNumber pattern="#####">${o.getPost().getArea()}</fmt:formatNumber>m2</b></li>
                                                <li>${o.getPost().getNumberOfRestrooms()} VS</li>

                                                <li>${o.getPost().getNumberOfBedrooms()} PN</li>
                                            </ul>
                                            <li class="price">${o.getPost().getPrice()} VNĐ</li>
                                            <c:set var = "date" value="${o.getPost().getCreateDate()}"/>
                                            <li class="item-date"><fmt:formatDate pattern = "dd/MM/yyyy" value = "${date}" /></li>
                                        </ul>
                                    </ul>
                                </a>
                                <!-- DELETE BUTTON -->
                                <form action="" method="POST">
                                    <input value="${o.getBookmark().getId()}" name="id" id="id" hidden/>                                
                                    <button type="submit" class="btn-delete">
                                        <svg
                                            xmlns="http://www.w3.org/2000/svg"
                                            width="18"
                                            height="18"
                                            fill="currentColor"
                                            class="bi bi-trash"
                                            viewBox="0 0 16 16"
                                            >
                                        <path
                                            d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"
                                            />
                                        <path
                                            fill-rule="evenodd"
                                            d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"
                                            />
                                        </svg>
                                    </button>
                                </form>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </section>
        </section>
        <!--<section class="footer">Footer demo</section>-->

        <!-- JAVASCRIPT -->
        <script>
            let joinDate = document.getElementById("joinDate");
            let date = new Date(joinDate.textContent);
            let formatedDate = date.toLocaleDateString();
            joinDate.innerHTML = formatedDate;
        </script>
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"
        ></script>
        <script
            src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
            integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
            crossorigin="anonymous"
        ></script>
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
            integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
            crossorigin="anonymous"
        ></script>
    </body>
</html>