<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
<title>修改报告</title>
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
	String patientName = new String(request.getParameter("patient_name").getBytes("iso-8859-1"),"utf-8");
%>

<img src="assets/img/chat_bg.jpg" style="height: 100%;width: 100%;position: fixed;z-index: -3;">
<div id="chat_header" style=" border-radius: 12px 12px 12px 12px;"><h1>@填写对@名字的报告</h1></div>
<form id="submit_report" action="" method="post">
	<textarea id="input_about_evaluation"></textarea>
	<button id="submit_about_evaluation" class="submit_button" type="submit">提交报告</button>
</form>
<script src="assets/js/jquery-1.8.2.min.js" ></script>
<script src="assets/js/inter_index.js" ></script>      
<script src="assets/js/report.js" ></script>
<script type="text/javascript">
	var patientName = '<%= patientName%>';
	showContext(patientName);
</script>
</body>
</html>