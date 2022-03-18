<%-- 
    Document   : navbar
    Created on : Mar 8, 2022, 7:34:57 PM
    Author     : TuanLA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
                    <a class="nav-link" href="#">Le Anh Tuan</a>
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
