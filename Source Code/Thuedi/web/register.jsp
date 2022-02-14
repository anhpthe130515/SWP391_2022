<%-- 
    Document   : register
    Created on : Feb 12, 2022, 9:08:50 PM
    Author     : pinkd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="Styles/style.css" />
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous" />
        <title>Thuedi</title>
    </head>
    <body>
        <div class="login-section">
            <h4>Xin chào!</h4>
            <h4>Buổi sáng tốt lành</h4>
            <h5>Đăng ký tài khoản</h5>
            
            <form method="POST">
                <label for="email">Email</label>
                <input class="form-control" type="email" id="email" name="email" required />
                <label for="password">Password</label>
                <input class="form-control" type="password" id="password" name="password" required />
                <label for="name">Họ tên</label>
                <input class="form-control" type="text" id="name" name="name" required />
                <label for="phone">Số điện thoại</label>
                <input class="form-control" type="text" id="phone" name="phone" required />
                <div>
                    <input class="mr-2" type="checkbox" required />
                    <p>Tôi đồng ý với các điều khoản sử dụng dịch vụ</p>
                </div>
                <p style="color: red">${requestScope.error}</p>
                <button class="btn btn-primary">Đăng ký</button>
                <p>Đã có tài khoản? <a href="login">Đăng nhập</a> </p>
            </form>
        </div>

        <!-- JAVASCRIPT -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </body>
</html>
