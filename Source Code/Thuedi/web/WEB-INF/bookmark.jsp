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
        <%@include file="navbar.jsp" %>

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
                                <a href="PostDetail?id=${o.getPost().getId()}">
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
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </body>
</html>
