<%-- 
    Document   : updateRole
    Created on : 25-03-2022, 18:58:10
    Author     : AnhPT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="Styles/style.css" />
        <link rel="stylesheet" href="Styles/userDetail.css" />
        <link
            rel="stylesheet"
            href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
            integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
            crossorigin="anonymous"
            />
        <title>Thuedi</title>
    </head>

    <body class="createpost-body">
        <%@include file="navbar.jsp" %>

        <div class="createpost-section" style="width: 20%;">
            <h4>Update Role</h4>

            <form class="update-role-form" method="POST">
                <div class="row">
                    <div class="col">
                        <div><label for="email">Email</label></div>
                        <input type="email" id="email" name="email" value="${user.email}" disabled />
                        <div><label for="name">CCCD/CMND</label></div>
                        <input type="text" id="cccd" name="cccd" style="width: 100%;" required />
                        <div><label for="name" >Contacts</label></div>
                        <input type="text" id="ll" name="ll" style="width: 100%;"required />

                        <button class="submit register-submit mt-2" style="justify-content: center;">Đăng ký</button>
                    </div>
                </div>

            </form>
        </div>
    </body>

</html>
