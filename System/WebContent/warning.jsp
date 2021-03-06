<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<head>
	
	<title>预警中心</title>
	<meta name="keywords" content="" />
	<meta name="description" content="" />
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<link href="assets/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link href="assets/css/inter_style.css" rel="stylesheet" type="text/css">	
</head>
<body>
	<div class="templatemo-container">
		<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 black-bg left-container">
			<h1 class="logo-left hidden-xs margin-bottom-60">心理在线</h1>			
			<div class="tm-left-inner-container">
				<ul class="nav nav-stacked templatemo-nav">
				  <li><a href="inter_index.jsp"><i class="fa fa-home"></i>主界面</a></li>
				  <li><a href="advisory.jsp"><i class="fa fa-question"></i>咨询中心</a></li>
				  <li><a href="recover.jsp"><i class="fa fa-plus-square"></i>康复中心</a></li>
				  <li><a href="report.jsp"><i class="fa fa-edit"></i>报告中心</a></li>
				  <li><a href="warning.jsp" class="active"><i class="fa fa-exclamation"></i>预警中心</a></li>
				   <li><a href="personInformation.jsp" ><i class="fa fa-bullhorn"></i>个人中心</a></li>
				</ul>
			</div>
		</div> <!-- left-->
		<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 white-bg right-container">
			<h1 class="logo-right hidden-xs margin-bottom-60">咨询系统</h1>		
			<table id="hor-minimalist-client" class="hor-minimalist">
					<thead>
					     <tr>
							<th scope="col">姓名</th>
							<th scope="col">年龄</th>
							<th scope="col">性别</th>
							<th scope="col">职业</th>
							<th scope="col">联系方式</th>
							<th scope="col">测评表</th>
							<th scope="col">测评结果</th>
						</tr>
					</thead>
					<tbody>
						 
					</tbody>
            </table>
		</div> <!-- right-->
	</div>
	<script src="assets/js/jquery-1.8.2.min.js"></script>	
	<script src="assets/js/warning.js"></script>
</body>
</html>