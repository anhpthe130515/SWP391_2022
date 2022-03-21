<%-- 
    Document   : navbar
    Created on : Mar 8, 2022, 7:34:57 PM
    Author     : TuanLA
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<section class="header sticky-top">
    <nav class="navbar navbar-expand-lg py-0">
        <a class="navbar-brand" href="/Thuedi/home">THUEDI</a>
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
                <li class="nav-item active py-1">
                    <a class="nav-link" href="#"
                       >Trang chủ</a
                    >
                </li>
                <li class="nav-item py-1">
                    <a class="nav-link" href="/Thuedi/list">Bài đăng</a>
                </li>
                <li class="nav-item py-1">
                    <a class="nav-link" href="/Thuedi/DistrictList">Khám Phá</a>
                </li>

                <c:choose>
                    <c:when test="${sessionScope.user eq null}">
                        <li class="nav-item py-1" >
                            <a class="nav-link" href="login">Đăng nhập</a>
                        </li>
                        <li class="nav-item py-1" >
                            <a class="nav-link" href="login">Đăng ký</a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="nav-item py-1">
                            <div class="dropdown">
                                <button
                                    class="btn user-btn"
                                    style="font-weight: 600; color: #8a4762;"
                                    type="button"
                                    id="dropdownMenuButton"
                                    data-toggle="dropdown"
                                    aria-haspopup="true"
                                    aria-expanded="false"
                                    >
                                    Tài khoản
                                </button>
                                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                    <a class="dropdown-item" href="/Thuedi/userDetail">Thông tin</a>
                                    <a class="dropdown-item" href="/Thuedi/logout">Đăng xuất</a>
                                </div>
                            </div>
                        </li>
                        <li class="nav-item  ml-1 py-1">
                            <a class="nav-link nav-button" href="/Thuedi/Landlord/CreatePost">Đăng bài</a>
                        </li>
                    </c:otherwise>
                </c:choose>

            </ul>

        </div>
    </nav>
</section>
