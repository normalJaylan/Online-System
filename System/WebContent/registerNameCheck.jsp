<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" %>
<%@ page import="java.util.*" import="java.sql.*" %>
<%@ page trimDirectiveWhitespaces="true" %>  
	<%
		request.setCharacterEncoding("utf-8");
	%>
	
	<%
		String registerName = new String(request.getParameter("name").getBytes("iso-8859-1"),"utf-8");
	
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/test?useUnicode=true&characterEncoding=utf-8";
		Connection conn = DriverManager.getConnection(url,"root","root");
		Statement stmt =  conn.createStatement();
		String sql = "select name from doctor";
		ResultSet rs = stmt.executeQuery(sql);
		
		while(rs.next() == true) {
			if(registerName.equals(rs.getString("name"))) {
				out.print("用户名已被注册,请重新输入");
				break;
			}
		}
	%>
