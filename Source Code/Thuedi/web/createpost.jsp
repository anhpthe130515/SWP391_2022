<%-- 
    Document   : createpost
    Created on : Feb 12, 2022, 2:55:07 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thuedi</title>
    </head>
    <body>
        <div class="login-section">
            <h5>Tạo bài đăng</h5>

            <form action="CreatePost" method="post">
                <input value="3" type="text" style="visibility: hidden" id="user_id" name="user_id">
                <label for="title">Tiêu đề</label>
                <input type="text" id="title" name="title">
                <label for="detail">Thân bài đăng</label>
                <input type="text" id="detail" name="detail">
                <label for="price">Giá</label>
                <input type="number" id="price" name="price">
                <label for="Area">Diện tích</label>
                <input type="text" id="area" name="area">
                <label for="nob">Số phòng ngủ</label>
                <input type="text" id="nob" name="nob">
                <label for="nor">Số phòng vệ sinh</label>
                <input type="text" id="nor" name="nor">
                <label for="direction">Hướng</label>
                <input type="text" id="direction" name="direction">
                <label for="address">Địa chỉ</label>
                <input type="text" id="address" name="address">
                <label for="address_detail">Địa chỉ cụ thể</label>
                <input type="text" id="address_detail" name="address_detail">
                <label for="property_type">Loại bất động sản</label>
                <input type="text" id="property_type" name="property_type">
                <button class="submit" type="submit" name="" id="">Đăng bài</button>
            </form>
        </div>
    </body>
</html>
