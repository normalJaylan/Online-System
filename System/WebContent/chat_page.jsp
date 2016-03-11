<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>聊天室</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="assets/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="assets/css/chat_page.css" rel="stylesheet">
</head>
<body>

	<%
		request.setCharacterEncoding("utf-8");	
	
		String doctorName = new String(request.getParameter("doctor_name").getBytes("iso-8859-1"),"utf-8");
		String patientName = new String(request.getParameter("patient_name").getBytes("iso-8859-1"),"utf-8");
	%>

<img src="assets/img/chat_bg.jpg" style="height: 100%;width: 100%;position: fixed;z-index: -3;">
<div  id="chat_box">
	<header id="chat_header"><h1><%=patientName %></h1></header><!-- 这个是病人的名字 -->
	<div id="chat_conent">
	    <div class="box_left chat_tr">
	        <img class="box_left" src="assets/img/chat_img.png" style="height: 50px;width: 50px;"/>
		    <div>
		        <p class="chat_nick">振翅.随风</p>  
			    <p class="chat_content arrow_left">大范甘迪</p>
	        </div>
	    </div>
	    <div class="box_right chat_tr">
	        <img class="box_right" src="assets/img/chat_img.png" style="height: 50px;width: 50px;"/>
		    <div>
		        <p class="chat_nick">振翅.随风</p>  
			    <p class="chat_content arrow_right">大范甘迪</p>
	        </div>
	    </div>
	</div>
	<footer>
	  <form action="" method="post">
	    <input type="text" name="submit_text" id="submit_text" />
	    <button type="submit" id="submit_button" class="submit_button">发送</button>
	  </form>
	</footer>
</div>
<div id="chat_header" style=" border-radius: 12px 12px 12px 12px;"><h1>填写对<%=patientName %>的报告</h1></div>

<form id="submit_report" action="testRecord.jsp?doctorName=<%=doctorName %>&patientName=<%=patientName %>" method="post">
	<textarea name="context" id="input_about_evaluation"></textarea>
	<button type="submit" id="submit_about_evaluation" class="submit_button">提交报告</button>
</form>

<script src="assets/js/jquery-1.8.2.min.js" ></script>
<script src="assets/js/chat_page.js" ></script>      
</body>
</html>