<%@page import="atg.taglib.json.util.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.util.*" import="java.sql.*" import="com.project.DoctorInfo"%>
<%@ page trimDirectiveWhitespaces="true" %>  

<%
	request.setCharacterEncoding("utf-8");
	
	String doctorName = new String(request.getParameter("name").getBytes("iso-8859-1"),"utf-8");
	
	Class.forName("com.mysql.jdbc.Driver");
	
	String url = "jdbc:mysql://localhost:3306/test?useUnicode=true&characterEncoding=utf-8";
	
	Connection conn = DriverManager.getConnection(url,"root","root");
	
	Statement stmt = conn.createStatement();
	
	String sql = "select * from doctor where name='" + doctorName + "'";

	ResultSet rs = stmt.executeQuery(sql);
	
	DoctorInfo doctor = new DoctorInfo();
	
	while(rs.next() == true) {
		doctor.setName(rs.getString("name"));
		doctor.setEducation(rs.getString("education"));
		doctor.setTelephone(rs.getString("telephone"));
		doctor.setAge(rs.getInt("age"));
		doctor.setMail(rs.getString("mail"));
	}

	JSONObject json = new JSONObject();
	
	json.put("name",doctor.getName());
	json.put("age",doctor.getAge());
	json.put("education",doctor.getEducation());
	json.put("telephone",doctor.getTelephone());
	json.put("mail",doctor.getMail());
	
	out.print(json);
%>