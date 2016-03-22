<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" import="com.project.*" import="java.util.*"%>
<%@ page trimDirectiveWhitespaces="true" %>

	<%
		String doctor = new String(request.getParameter("doctor"));
		String which = new String(request.getParameter("number"));
		String changeData = new String(request.getParameter("changeData"));
		
		System.out.println(doctor);
	
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/test?useUnicode=true&characterEncoding=utf-8";
		Connection conn = DriverManager.getConnection(url,"root","root");
		
		int rows = 0;
			
		if(which.equals("age")){
			String sql = "update doctor set age = ? where name = '" + doctor + "'";
			int change = Integer.parseInt(changeData);
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1,change);
			rows = ps.executeUpdate();
			
		} else if(which.equals("name")){
			String sql = "update doctor set name = ? where name = '" + doctor + "'";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1,changeData);
			rows = ps.executeUpdate();
			
		} else if(which.equals("telephone")){
			String sql = "update doctor set telephone = ? where name = '" + doctor + "'";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1,changeData);
			rows = ps.executeUpdate();
			
		} else if(which.equals("education")){
			String sql = "update doctor set education = ? where name = '" + doctor + "'";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1,changeData);
			rows = ps.executeUpdate();
			
		} else if(which.equals("mail")){
			String sql = "update doctor set mail = ? where name = '" + doctor + "'";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1,changeData);
			rows = ps.executeUpdate();
		}
		
		if(rows > 0) {
			System.out.println("医生信息修改成功");
		}
		
		conn.close();
	%>