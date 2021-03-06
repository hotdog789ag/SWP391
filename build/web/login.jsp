<%-- 
    Document   : login
    Created on : Jun 16, 2022, 1:29:00 PM
    Author     : Trong Duy
--%>

<%@page import="dtos.UserError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/styles.css">
        <title>Login</title>
    </head>
    <body>
        <div class="wrapper">
            <div class="title-text">
                <div class="title login">Login Form</div>
                <div class="title signup">Signup Form</div>
            </div>
            <div class="form-container">
                <div class="slide-controls">
                    <input type="radio" name="slide" id="login" checked>
                    <input type="radio" name="slide" id="signup">
                    <label for="login" class="slide login">Login</label>
                    <label for="signup" class="slide signup">Sign Up</label>
                    <div class="slider-tab"></div>
                </div>
                <div class="form-inner">
                    <form action="MainController" class="login" method="post">
                        <div class="field">
                            <input type="text" name="userID" placeholder="Tên tài khoản" required>
                        </div>
                        <div class="field">
                            <input type="password" name="password" placeholder="Mật khẩu" required>
                        </div>
                        <div class="pass-link"><a href="#">Forgot password?</a></div>
                        <div class="field btn">
                            <div class="btn-layer"></div>
                            <input type="submit" name="action" value="Login">
                        </div>
                        <%
                            String error = (String) request.getAttribute("ERROR");
                            if (error == null) {
                                error = "";
                            }
                        %>
                        <p style="color: red"><%=error%></p>
                        <div class="signup-link">Not a member? <a href="">Signup now</a></div>
                    </form>
                    <%
                        UserError userError = (UserError) request.getAttribute("USER_ERROR");
                        if (userError == null) {
                            userError = new UserError();
                        }
                    %>

                    <form action="MainController" class="signup" id="formSWP" method="post">
                        <div class="field">
                            <input type="text" name="userID" id="userID" placeholder="Tên tài khoản" required>
                            <span class="form-message"></span>
                            <p><%= userError.getUserID()%></p>

                        </div>
                        <div class="field">
                            <input type="text" name="email" id="email" placeholder="Email Address" required>
                            <span class="form-message"></span>
                            <p> <%= userError.getEmail()%></p>
                        </div>
                        <div class="field">
                            <input type="text" name="phone" id="phone" placeholder="Phone" required>
                            <span class="form-message"></span>
                            <p><%= userError.getPhone()%></p>
                        </div>
                        <div class="field">
                            <input type="password" name="password" id="password" placeholder="Password" required>
                            <span class="form-message"></span>
                        </div>
                        <div class="field">
                            <input type="password" id="password_confirm" placeholder="Confirm password" required>
                            <span class="form-message"></span>
                        </div>
                        <div class="field btn">
                            <div class="btn-layer"></div>
                            <input type="submit" name="action" value="Signup">
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!--js-->
        <script src="js/scripts.js"></script>
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                // Mong muốn của chúng ta
                Validator({
                    form: '#formSWP',
                    errorSelector: '.form-message',
                    rules: [
                        Validator.isRequired('#userID', 'Vui lòng nhập lại Tên tài khoản'),
                        Validator.isEmail('#email', 'Email chưa chính xác'),
                        Validator.minLength('#password', 6, 'Nhập vào tối thiểu 6 ký tự'),
                        Validator.isPhone('#phone', 'vui lòng nhập lại số điện thoại'),
                        Validator.isConfirmed('#password_confirm', function () {
                            return document.querySelector('#formSWP #password').value;
                        }, 'Mật khẩu nhập lại không chính xác')
                    ],
                });
            });
        </script>
    </body>
</html>
