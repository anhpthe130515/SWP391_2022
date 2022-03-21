<%-- 
    Document   : adminUser
    Created on : Mar 19, 2022, 12:30:34 AM
    Author     : pinkd
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link
            rel="stylesheet"
            href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
            integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
            crossorigin="anonymous"
            />
        <link rel="stylesheet" href="../Styles/admin.css" />
        <title>Thuedi Admin</title>
    </head>
    <body id="body-pd">
        <div class="wrapper">
            <!-- Sidebar  -->
            <div class="menu">
                <nav id="sidebar">
                    <div class="sidebar-header">
                        <h3>Thuedi</h3>
                        <h4>Management</h4>
                    </div>

                    <ul class="list-unstyled components">
                        <li >
                            <a href="dashboard">Dashboard</a>
                        </li>
                        <li class="active">
                            <a href="user">User</a>
                        </li>
                        <li>
                            <a href="report">Report</a>
                        </li>
                        <li>
                            <a href="post">Post</a>
                        </li>
                    </ul>

                </nav>
            </div>
            <!-- Page Content  -->
            <div id="content">
                <nav class="navbar navbar-expand-lg navbar-light bg-light">
                    <div class="container-fluid">
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="nav navbar-nav ml-auto">
                                <li class="nav-item">
                                    <img
                                        src="https://scontent.fhan4-3.fna.fbcdn.net/v/t39.30808-6/258715019_3354221161471837_6414080374251820074_n.jpg?_nc_cat=100&ccb=1-5&_nc_sid=174925&_nc_ohc=nmHYKgNf9EQAX8GuxDh&_nc_ht=scontent.fhan4-3.fna&oh=00_AT_-cdO-WBDnwkA5Egf-yJtZmJKE1ET9ylwYsZjxEgU7RA&oe=623A61A5"
                                        alt=""
                                        width="45px"
                                        class="rounded-circle"
                                        />
                                </li>
                                <li class="nav-item">
                                    <div class="dropdown">
                                        <button
                                            class="btn btn-secondary"
                                            type="button"
                                            id="dropdownMenuButton"
                                            data-toggle="dropdown"
                                            aria-haspopup="true"
                                            aria-expanded="false"
                                            >
                                            ${requestScope.userDetail.getName()}
                                        </button>
                                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                            <a class="dropdown-item" href="../logout">Logout</a>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>


                <div class="main-content">
                    <h4>Quản lý người dùng</h4>
                    <table class="table">
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">User Id</th>
                            <th scope="col">Họ và tên</th>
                            <th scope="col">Số điện thoại</th>
                            <th scope="col">Email</th>
                            <th scope="col">Role</th>
                            <th scope="col">Ngày tạo</th>
                            <th scope="col">Trạng thái</th>
                            <th scope="col"></th>
                            <th scope="col"></th>
                            <th scope="col"></th>
                        </tr>
                        <c:forEach items="${requestScope.allUser}" var="user" varStatus="loop">
                            <tr>
                                <th scope="row">${loop.index +1}</th>
                                <td>${user.getUser().getId()}</td>
                                <td>${user.getDetail().getName()}</td>
                                <td>${user.getDetail().getPhone()}</td>
                                <td>${user.getUser().getEmail()}</td>
                                <c:choose>
                                    <c:when test="${user.getUser().getRoleId() == 1}">
                                        <td>Admin</td>
                                    </c:when>
                                    <c:when test="${user.getUser().getRoleId() == 2}">
                                        <td>User</td>
                                    </c:when>
                                    <c:otherwise>
                                        <td>Landlord</td>
                                    </c:otherwise>
                                </c:choose>
                                <td><fmt:formatDate pattern = "dd/MM/yyyy" value = "${user.getUser().getCreateDate()}"/></td>
                                <td>${user.getUser().isIsDeleted() ? 'Không hoạt động' : 'Hoạt động'}</td>
                                <td>
                                    <a class="table-btn btn-delete" href="../banUser?id=${user.getUser().getId()}">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
                                        <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
                                        <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
                                        </svg>Ban</a></td>
                                <td><a class="table-btn btn-delete" href="../unbanUser?id=${user.getUser().getId()}">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
                                        <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
                                        <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
                                        </svg>Unban</a></td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>

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
