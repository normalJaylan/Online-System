<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" %>
<%@ page import="java.util.*" import="java.sql.*" %>

	<%
		request.setCharacterEncoding("utf-8");
	%>
	
	<jsp:useBean id="doctor" class="com.project.DoctorInfo"></jsp:useBean>
	<jsp:setProperty property="*" name="doctor"/>
	
	<%
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/test?useUnicode=true&characterEncoding=utf-8";
		Connection conn = DriverManager.getConnection(url,"root","root");
		Statement stmt = conn.createStatement();
		String sql = "select * from doctor";
		ResultSet rs = stmt.executeQuery(sql);
		while(rs.next() == true) {
			
			if(rs.getString("name").equals(doctor.getName())){
				
				if(rs.getString("pwd").equals(doctor.getPwd())){
					
					session.setAttribute("name",doctor.getName());
					response.sendRedirect("inter_index.jsp");
						
				} else {	
					response.sendRedirect("index.jsp?para=1");
				}
				
			} 
		}
		
	%>
	
	<script>
		window.location.href = "index.jsp?para=2";
	</script>
	
