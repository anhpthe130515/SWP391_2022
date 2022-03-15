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
    </head>
    <body>
        <c:forEach items="${requestScope.districts}" var="o">
            <h3><a href="AreaReview?id=${o.getId()}">${o.getName()}</a></h3>
        </c:forEach>
    </body>
</html>
