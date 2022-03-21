<%-- 
    Document   : admin
    Created on : Mar 18, 2022, 11:56:39 PM
    Author     : pinkd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                        <li class="active">
                            <a href="dashboard">Dashboard</a>
                        </li>
                        <li>
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
                    <div class="row">
                        <div class="col-xl-4 card ">
                            <div class="card-body card-1">
                                <div class="row align-items-center">
                                    <div class="col mr-4">
                                        <div class="card-title text-uppercase">Tổng số bài đăng</div>
                                        <div class="card-value font-weight-bold">${requestScope.numberPost}</div>
                                    </div>
                                    <div class="col-auto">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="65" height="65" fill="currentColor" class="card-icon" viewBox="0 0 16 16">
                                        <path d="M14 4.5V14a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h5.5L14 4.5zm-3 0A1.5 1.5 0 0 1 9.5 3V1H4a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V4.5h-2z"/>
                                        <path d="M4 6.5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-.5.5h-7a.5.5 0 0 1-.5-.5v-7zm0-3a.5.5 0 0 1 .5-.5H7a.5.5 0 0 1 0 1H4.5a.5.5 0 0 1-.5-.5z"/>
                                        </svg>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-4 card ">
                            <div class="card-body card-2">
                                <div class="row align-items-center">
                                    <div class="col mr-4">
                                        <div class="card-title text-uppercase">Tổng số người dùng</div>
                                        <div class="card-value font-weight-bold">${requestScope.numberUser}</div>
                                    </div>
                                    <div class="col-auto">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="65" height="65" fill="currentColor" class="card-icon" viewBox="0 0 16 16">
                                        <path d="M7 14s-1 0-1-1 1-4 5-4 5 3 5 4-1 1-1 1H7zm4-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
                                        <path fill-rule="evenodd" d="M5.216 14A2.238 2.238 0 0 1 5 13c0-1.355.68-2.75 1.936-3.72A6.325 6.325 0 0 0 5 9c-4 0-5 3-5 4s1 1 1 1h4.216z"/>
                                        <path d="M4.5 8a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5z"/>
                                        </svg>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-4 card ">
                            <div class="card-body card-3">
                                <div class="row align-items-center">
                                    <div class="col mr-4">
                                        <div class="card-title text-uppercase">Tổng số report</div>
                                        <div class="card-value font-weight-bold">${requestScope.numberReportPost}</div>
                                    </div>
                                    <div class="col-auto">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="65" height="65" fill="currentColor" class="bi bi-exclamation-octagon-fill" viewBox="0 0 16 16">
                                        <path d="M11.46.146A.5.5 0 0 0 11.107 0H4.893a.5.5 0 0 0-.353.146L.146 4.54A.5.5 0 0 0 0 4.893v6.214a.5.5 0 0 0 .146.353l4.394 4.394a.5.5 0 0 0 .353.146h6.214a.5.5 0 0 0 .353-.146l4.394-4.394a.5.5 0 0 0 .146-.353V4.893a.5.5 0 0 0-.146-.353L11.46.146zM8 4c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 4.995A.905.905 0 0 1 8 4zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
                                        </svg>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
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

