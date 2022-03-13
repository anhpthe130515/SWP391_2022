<%-- 
    Document   : postdetail
    Created on : Mar 8, 2022, 5:59:05 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>
            ${requestScope.post.getTitle()}
            <br>
            ${requestScope.post.getDetail()}
            <br>
            ${requestScope.post.getPrice()}
            <br>
            ${requestScope.post.getArea()}
            <br>
            ${requestScope.post.getNumberOfBedrooms()}
            <br>
            ${requestScope.post.getDirection()}
            <br>
            ${requestScope.post.getAddress()}
            <br>
            ${requestScope.post.getAddressDetail()}
            <br>
            ${requestScope.post.getPropertyType()}
            <br>
            ${requestScope.post.getCreateDate()}
            <br>
        </h1>
    </body>
</html>
