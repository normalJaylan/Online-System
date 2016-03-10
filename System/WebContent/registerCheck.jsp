<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" %>
<%@ page import="java.util.*" import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title></title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	
	%>
	
	<jsp:useBean id="doctor" class="com.project.DoctorInfo"></jsp:useBean>
	<jsp:setProperty property="*" name="doctor"/>
	
	<%
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/test?useUnicode=true&characterEncoding=utf-8";
			Connection conn = DriverManager.getConnection(url,"root","root");
			String sql = "insert into doctor(name,pwd,education,telephone,age)values(?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1,doctor.getName());
			ps.setString(2,doctor.getPwd());
			ps.setString(3,doctor.getEducation());
			ps.setString(4,doctor.getTelephone());
			ps.setInt(5,doctor.getAge());
			int row = ps.executeUpdate();
			if(row > 0) {
				response.sendRedirect("index.jsp");   			
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	%>
</body>
</html>