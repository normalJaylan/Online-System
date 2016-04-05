<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" %>
<%@ page errorPage="errorPage.jsp" %>
<!DOCTYPE html>
<html>
<head>
	
	<title>首页</title>
	<meta name="keywords" content="" />
	<meta name="description" content="" />
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<link href="assets/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link href="assets/css/unslider.css" rel="stylesheet" type="text/css">
	<link href="assets/css/inter_style.css" rel="stylesheet" type="text/css">
	<link href="assets/css/glDatePicker.flatwhite.css" rel="stylesheet" type="text/css">
</head>
<body>

	
	<%
		String name = session.getAttribute("name").toString();
	%>

	<div class="templatemo-container">
		<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 black-bg left-container">
			<h1 class="logo-left hidden-xs margin-bottom-60">心理在线</h1>			
			<div class="tm-left-inner-container">
				<ul class="nav nav-stacked templatemo-nav">
				  <li><a href="inter_index.jsp" class="active"><i class="fa fa-home"></i>主界面</a></li>
				  <li><a href="advisory.jsp" ><i class="fa fa-question"></i>咨询中心</a></li>
				  <li><a href="recover.jsp"><i class="fa fa-plus-square"></i>康复中心</a></li>
				  <li><a href="report.jsp"><i class="fa fa-edit"></i>报告中心</a></li>
				  <li><a href="warning.jsp"><i class="fa fa-exclamation"></i>预警中心</a></li>
				   <li><a href="personInformation.jsp"><i class="fa fa-bullhorn"></i>个人信息</a></li>
				</ul>
			</div>
		</div> <!-- left-->
		<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 white-bg right-container">
			<h1 class="logo-right hidden-xs" >咨询系统</h1>		
			<div id="my-slider" class="my-slider">
			    <ul>
			        <li><img style="height: 230px;" src="assets/img/g1.png" /></li>
			        <li><img style="height: 230px;" src="assets/img/g2.png" /></li>
			        <li><img style="height: 230px;" src="assets/img/g3.png" /></li>
			    </ul>
			</div>
			<input type="text" id="mydate" gldp-id="mydate" />
		    <div gldp-el="mydate"
		         style="width:400px; height:300px;display: block !important;">
		    </div>
		    <ul class="news_ul">
		    	<li class="new_li">
		    		<div>
		    			<div>
		    				<p>标题</p>
		    				<h1>这就是正文的内容</h1>
		    			</div>
		    		</div>
		    	</li>
		    	<li class="new_li">
		    		<div>
		    			<div>
		    				<p>标题</p>
		    				<h1>这就是正文的内容</h1>
		    			</div>
		    		</div>
		    	</li>
		    </ul>
		    <div class="new_p">
		    	<p>标题</p>
		    	<h1 style="word-break: break-all; height: 162px;">这就是正文的内容fgdgdfgdfgfdgdfgkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk</h1>
		    </div>	
		</div> <!-- right-->
	</div>
	<script src="assets/js/jquery-1.8.2.min.js"></script>
	<script src="assets/js/unslider.js"></script>
	<script src="assets/js/glDatePicker.min.js"></script>
	<script src="assets/js/inter_index.js"></script>	
</body>
</html>