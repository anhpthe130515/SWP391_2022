<%-- 
    Document   : areareview
    Created on : Mar 15, 2022, 6:40:17 PM
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
    </head>
    <body>
        <c:forEach items="${requestScope.subdistricts}" var="o">
            <h3><a href="AreaReview?sub_id=${o.getId()}">${o.getName()}</a></h3>
        </c:forEach>
        <p>${requestScope.reviewdata.getAreaReview() != null ? requestScope.reviewdata.getAreaReview() : "To be added later"}</p>
    </body>
</html>
