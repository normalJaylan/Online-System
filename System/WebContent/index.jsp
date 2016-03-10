<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en" class="no-js">

    <head>

        <meta charset="utf-8">
        <title>心理在线咨询系统</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">

        <!-- CSS -->
        <link rel="stylesheet" href="assets/css/reset.css">
        <link rel="stylesheet" href="assets/css/style.css">

        <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
            <script src="assets/js/html5.js"></script>
        <![endif]-->

    </head>

    <body>

        <div class="page-container">
            <h1>登录-心理在线咨询系统</h1>
            <form action="loginCheck.jsp" method="post"><!-- 这里是登录页面的jsp -->
                <input type="text" name="name" class="username" placeholder="用户名">
                <input type="password" name="pwd" class="password" placeholder="密码">
                <button type="submit" class="submit_button submit_login">登录</button>
                <button type="button" id="register" class="submit_button submit_a">注册</button>
                <input type="radio" class="select_id" name="Identity" value="Painter" checked="checked"/> 咨询者
                <input type="radio" class="select_id" name="Identity" value="Docter" /> 医生
                <input type="radio" class="select_id" name="Identity" value="Mannager" /> 管理员
                <div class="error"><span>+</span></div>
            </form>
        </div>
      
     
        
        <div id="into_name"></div>
        <div id="into_password"></div>
		<img class="bg_img" src="assets/img/3.jpg" />
        <!-- Javascript -->
        <script src="assets/js/jquery-1.8.2.min.js" ></script>
        <script src="assets/js/login.js" ></script>
        <script type="text/javascript">
            var para = "<%= request.getParameter("para")%>"
        	check_login(para);
        </script>
    </body>
</html>

