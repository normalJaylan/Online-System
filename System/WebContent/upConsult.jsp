<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.sql.*"%>
	
	<%
		
		String patient = new String(request.getParameter("patientName"));
		String doctor = new String(request.getParameter("doctorName"));
		String context = new String(request.getParameter("context"));
		
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/test?useUnicode=true&characterEncoding=utf-8";
		Connection conn = DriverManager.getConnection(url,"root","root");
		String sql = "insert into word_topatient(patient,doctor,context)values(?,?,?)";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1,patient);
		ps.setString(2,doctor);
		ps.setString(3,context);
		int row1 = ps.executeUpdate();
		if(row1 > 0) {
			System.out.println("回复内容写入数据库成功");
			String sql_update = "update word_todoctor set yet = 1 where patient=? and doctor=? and yet = 0";
			PreparedStatement p = conn.prepareStatement(sql_update);
			p.setString(1,patient);
			p.setString(2,doctor);
			int row2 = p.executeUpdate();
			if(row2 > 0) {
				System.out.println("病人留言标记成功");
				p.close();
			}
		}
		conn.close();
		ps.close();
	%>