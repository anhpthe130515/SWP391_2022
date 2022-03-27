<%-- 
    Document   : landlordmanagepost
    Created on : Feb 17, 2022, 4:55:52 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
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
            <h5 class="mb-2">Quản Lý Bài Đăng</h5>
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
                            <span>Tổng số bài đăng: ${posts.size()}</span>
                            <span>Ngày tham gia: <span id="joinDate">${user.getCreateDate()}</span></span>
                        </div>
                    </div>
                </div>
                <div class="manager-post-list">
                    <ul>
                        <!-- ITEMS LIST -->
                        <c:forEach items="${requestScope.posts}" var="o">
                            <li class="property-list-items">
                                <a href="../PostDetail?id=${o.getId()}">
                                    <ul class="item">
                                        <div class="item-img">
                                            <img src="/Thuedi/PostImage/${o.getId()}" onError="this.onerror=null;this.src='https://dichvuchuyendo.net/wp-content/uploads/2020/10/phong-tro.jpg'"/>
                                        </div>

                                        <ul class="item-infor">
                                            <li class="item-infor-title">
                                                ${o.getTitle()}
                                            </li>
                                            <li class="font-weight-light">${o.getAddressDetail()} - Ngọc Khánh - Ba Đình</li>
                                            <ul class="item-attr">
                                                <li><b><fmt:formatNumber pattern="#####">${o.getArea()}</fmt:formatNumber>m2</b></li>
                                                <li>${o.getNumberOfRestrooms()} VS</li>

                                                <li>${o.getNumberOfBedrooms()} PN</li>
                                            </ul>
                                            <li class="price">${o.getPrice()} VNĐ</li>
                                                <c:set var = "date" value="${o.getCreateDate()}"/>
                                            <li class="item-date"><fmt:formatDate pattern = "dd/MM/yyyy" value = "${date}" /></li>
                                        </ul>
                                    </ul>
                                </a>
                                <!-- EDIT BUTTON -->
                                <a
                                    href="updatePost?id=${o.getId()}"
                                    class="btn-edit"
                                    >
                                    <svg
                                        xmlns="http://www.w3.org/2000/svg"
                                        width="18"
                                        height="18"
                                        fill="currentColor"
                                        class="bi bi-pencil-square"
                                        viewBox="0 0 16 16"
                                        >
                                    <path
                                        d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"
                                        />
                                    <path
                                        fill-rule="evenodd"
                                        d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"
                                        />
                                    </svg>
                                </a>

                                <!-- DELETE-MODAL -->
                                <div class="modal fade" id="deleteModal${o.getId()}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">Thông báo</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                Bạn chắc chắn muốn xóa bài viết này?
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                                                <!--<button type="button" class="btn btn-primary">Đồng ý</button>-->
                                                <a href="DeletePost?id=${o.getId()}" class="btn btn-primary">Đồng ý</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- DELETE BUTTON -->
                                <button
                                    type="button" 
                                    class="btn-delete" 
                                    data-toggle="modal" 
                                    data-target="#deleteModal${o.getId()}"
                                    >
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

