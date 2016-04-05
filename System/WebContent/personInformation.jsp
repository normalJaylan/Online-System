<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" %>
<!DOCTYPE html>
<head>
	
	<title>个人信息</title>
	<meta name="keywords" content="" />
	<meta name="description" content="" />
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<link href="assets/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link href="assets/css/inter_style.css" rel="stylesheet" type="text/css">	
</head>
<body>
<%
		String name = session.getAttribute("name").toString();
		session.setAttribute("name",name);
	%>
	<div class="templatemo-container">
		<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 black-bg left-container">
			<h1 class="logo-left hidden-xs margin-bottom-60">心理在线</h1>			
			<div class="tm-left-inner-container">
				<ul class="nav nav-stacked templatemo-nav">
				  <li><a href="inter_index.jsp"><i class="fa fa-home"></i>主界面</a></li>
				  <li><a href="advisory.jsp"><i class="fa fa-question"></i>咨询中心</a></li>
				  <li><a href="recover.jsp"><i class="fa fa-plus-square"></i>康复中心</a></li>
				  <li><a href="report.jsp"><i class="fa fa-edit"></i>报告中心</a></li>
				  <li><a href="warning.jsp"><i class="fa fa-exclamation"></i>预警中心</a></li>
				   <li><a href="personInformation.jsp"  class="active"><i class="fa fa-bullhorn"></i>个人信息</a></li>
				</ul>
			</div>
		</div> <!-- left-->
		<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 white-bg right-container">
			<h1 class="logo-right hidden-xs margin-bottom-60">咨询系统</h1>		
            <div id="personInfo_table">
                <img src="assets/img/chat_img.png" style="border-radius: 50%;margin-left: 30px;height: 80px;width: 80px;">
                <label>我就是一个普通的人，但是是不一样的烟火！</label>
	            <ul class="personInfo_table_ul">
	            	<li>姓名：<span>@name</span><button class="btnplayit">修改</button></li>
	            	<li>年龄：<span>@age</span><button class="btnplayit">修改</button></li>
	            	<li>电话：<span>@phone</span><button class="btnplayit">修改</button></li>
	            	<li>职业：<span>@job</span><button class="btnplayit">修改</button></li>
	            	<li>邮箱：<span>@Email</span><button class="btnplayit">修改</button></li>
	            </ul>
            </div>	
		</div> <!-- right-->
	</div>
	<script src="assets/js/jquery-1.8.2.min.js" ></script>
	<script src="assets/js/inter_index.js"></script>\
	<script type="text/javascript">
		var name = '<%= name%>';
		showPersonInfo(name);
	</script>
</body>
</html>