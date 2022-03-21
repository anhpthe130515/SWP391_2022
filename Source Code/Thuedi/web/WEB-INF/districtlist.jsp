<%-- 
    Document   : districtlist
    Created on : Mar 15, 2022, 6:46:06 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link
            rel="stylesheet"
            href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
            integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
            crossorigin="anonymous"
            />
        <link rel="stylesheet" href="Styles/style.css" />
        <link rel="stylesheet" href="Styles/reviewArea.css" />
    </head>
    <body>
  <%@include file="navbar.jsp" %>
        <div class="container mt-4">
            <h4 class="text-center">Review Các Khu Vực Trong Địa Bàn Hà Nội</h4>
            <div class="row">
                <c:forEach items="${requestScope.districts}" var="o">
                    <div class="col-3">
                        <a href="AreaReview?id=${o.getId()}">
                            <div class="district">${o.getName()}</div>
                        </a>
                    </div>
                </c:forEach>

            </div>
        </div>
         <%@include file="footer.jsp" %>
    </body>
</html>
