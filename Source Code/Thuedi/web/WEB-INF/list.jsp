<%-- 
    Document   : list
    Created on : 28-02-2022, 01:29:17
    Author     : AnhPT
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="Styles/style.css" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous" />
    <title>Thuedi</title>
</head>

<body>
    <%@include file="navbar.jsp" %>

    <section class="main-content mt-4">
        <section class="search-filter-section">
            <div class="search">
                <div class="input-group mb-3">
                    <input
                        type="text"
                        class="form-control"
                        placeholder="Từ khóa, Đường, Quận"
                        />
                    <div class="input-group-append">
                        <button
                            class="btn btn-outline-secondary"
                            type="button"
                            id="button-addon2"
                            >
                            Search
                        </button>
                    </div>
                </div>
            </div>

            <!--            <div class="filter">
                            <div class="dropdown">
                                <button
                                    class="btn btn-secondary dropdown-toggle"
                                    type="button"
                                    id="dropdownMenuButton"
                                    data-toggle="dropdown"
                                    >
                                    Khu vực
                                </button>
                                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
            <c:forEach items="${requestScope.listDistricts}" var="listDis">
                <a class="dropdown-item" href="#" id="${listDis.id}">${listDis.name}</a>
            </c:forEach>
        </div>
    </div>-->

            <div class="w3-half w3-margin-bottom" >
                <select class="btn btn-secondary dropdown-toggle"  name="district">
                    <option value="">Khu vực</option>
                    <c:forEach items="${requestScope.listDistricts}" var="listDis">
                        <option value="${listDis.id}" <c:if test="${listDis.id == requestScope.district}">selected="selected"</c:if>>${listDis.name}</option>
                    </c:forEach>
                    <!--load tu database ra cac category-->
                </select>
            </div>

            <!--            <div class="dropdown">
                            <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown">
                                Loại bất động sản
                            </button>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
            <c:forEach items="${requestScope.listPropertyTypes}" var="listPro">
                <a class="dropdown-item" href="#">${listPro.name}</a>
            </c:forEach>
        </div>
    </div>-->

            <div class="w3-half w3-margin-bottom">
                <select class="btn btn-secondary dropdown-toggle">
                    <option value="">Loại bất động sản</option>
                    <c:forEach items="${requestScope.listPropertyTypes}" var="listPro">
                        <option value="${listPro.id}" <c:if test="${listPro.id == requestScope.propertyType}">selected="selected"</c:if>>${listPro.name}</option>
                    </c:forEach>
                    <!--load tu database ra cac category-->
                </select>
            </div>

            <!--            <div class="dropdown">
                            <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown">
                                Giá thuê
                            </button>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                <a class="dropdown-item" href="#">< 3 Triệu</a>
                                <a class="dropdown-item" href="#">3 - 5 Triệu</a>
                                <a class="dropdown-item" href="#">5 - 7 Triệu</a>
                                <a class="dropdown-item" href="#">> 7 Triệu</a>
                            </div>
                        </div>-->

            <div class="w3-half w3-margin-bottom">
                <select class="btn btn-secondary dropdown-toggle"  name="propertyType">
                    <option value="">Giá thuê</option>
                    <option value="">< 3 Triệu</option>
                    <option value="">3 - 7 Triệu</option>
                    <option value="">> 7 Triệu</option>
                    <!--load tu database ra cac category-->
                </select>
            </div>

            <div class="dropdown">
                <button class="btn btn-secondary" type="button">Lọc thêm</button>
            </div>

            </div>
        </section>

        <section class="property mt-3">
            <div class="property-list">
                <h5>Phòng Trọ Sinh Viên Giá Hạt Ngô</h5>
                <div class="property-list-result">
                    <b>${requestScope.page*8-7} - <c:out default="None" value="${requestScope.page*8 > numPost ? numPost : page*8}"/> trong ${requestScope.numPost} kết quả</b>
                </div>
                <ul>
                    <!-- ITEMS LIST -->
                    <c:forEach items="${requestScope.lst}" var="a" varStatus="loop">
                        <li class="property-list-items">
                            <a href="" >
                                <ul class="item">
                                    <div class="item-img">
                                        <img src="/Thuedi/PostImage/${a.id}" onError="this.onerror=null;this.src='https://dichvuchuyendo.net/wp-content/uploads/2020/10/phong-tro.jpg'"/>
                                    </div>
                                    <ul class="item-infor">
                                        <li class="item-infor-title">${a.title}</li>
                                        <li class="font-weight-light">${a.addressDetail}</li>
                                        <ul class="item-attr">
                                            <li><b><fmt:formatNumber pattern="#####">${a.area}</fmt:formatNumber>m2</b></li>
                                            <li>${a.numberOfRestrooms} VS</li>
                                            <li>${a.numberOfBedrooms} PN</li>
                                        </ul>
                                        <li class="price">${a.price} triệu</li>
                                        <li class="item-date"><fmt:formatDate pattern = "dd/MM/yyyy" value = "${a.createDate}" /></li>
                                    </ul>
                                </ul>
                            </a>
                            <button class="add-favorite">
                                <svg
                                    xmlns="http://www.w3.org/2000/svg"
                                    width="18"
                                    height="18"
                                    fill="currentColor"
                                    class="bi bi-heart"
                                    viewBox="0 0 16 16"
                                    >
                                <path
                                    d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"
                                    />
                                </svg>
                            </button>
                        </li>
                    </c:forEach>
                </ul>

                <!-- PAGINATION -->
                <nav>
                    <ul class="pagination justify-content-center mt-5">
                        <li class="page-item disabled">
                            <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
                        </li>
                        <li class="page-item" aria-current="page"></li>
                            <c:forEach var="counter" begin="1" end="${requestScope.numPage}">
                            <li class="page-item"><a class="page-link" <c:if test="${param.page eq counter}">style="font-weight: 800;"</c:if> href="list?page=${counter}">${counter}</a></li>    
                            </c:forEach>
                        <li class="page-item">
                            <a class="page-link" href="#">Next</a>
                        </li>
                    </ul>
                </nav>
            </div>

            <!-- SIDEBAR -->
            <div class="side-bar">
                <div class="widget-item">
                    <p>Loại bất động sản</p>
                    <ul>
                        <li>Phòng trọ</li>
                        <li>Chung cư</li>
                        <li>Nhà</li>
                        <li>Văn Phòng</li>
                        <li>Mặt bằng</li>
                    </ul>
                </div>

            </div>
        </section>
    </section>
    <%@include file="footer.jsp" %>

    <!-- JAVASCRIPT -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>

</html>
