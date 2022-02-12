<%-- 
    Document   : login
    Created on : Feb 11, 2022, 2:49:04 PM
    Author     : TuanLA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="Styles/style.css" />
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous" />
        <title>Thuedi</title>
        <style>

        </style>
    </head>
    <body>
        <div class="login-section">
            <h4>Xin chào!</h4>
            <h4 id="says">Buổi sáng tốt lành</h4>
            <h5>Đăng nhập tài khoản</h5>

            <form action="login" method="post">
                <label for="email">Email</label>
                <input type="text" id="email" name="email">
                <label for="password">Password</label>
                <input type="password" id="password" name="password">
                <a class="forget-password" href="#">forget password?</a>
                <button class="submit" type="submit" name="" id="">Login</button>
                <a href="register.html">Create Account</a>
            </form>
        </div>

        <!-- JAVASCRIPT -->
        <script>
            var id = document.getElementById("says");
            var currentTime = new Date();
            var time = currentTime.getHours();
            if (time >= 0 && time <= 12) {
                id.innerHTML = "Buổi sáng tốt lành";
            } else
            if (time > 12 && time < 18) {
                id.innerHTML = "Buổi chiều vui vẻ";
            } else {
                id.innerHTML = "Buổi tối an lành";
            }
            console.log("current time is: " + time + "h" + currentTime.getMinutes() + "m");
        </script>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </body>
</html>
