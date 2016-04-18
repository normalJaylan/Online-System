<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" import="com.project.PatientInfo"%>
<%@page import="atg.taglib.json.util.*"%>
<%@ page trimDirectiveWhitespaces="true" %>

    <%
    	String name = new String(request.getParameter("name").getBytes("iso-8859-1"),"utf-8");
    
    	Class.forName("com.mysql.jdbc.Driver");
    	String url = "jdbc:mysql://localhost:3306/test?useUnicode=true&characterEncoding=utf-8";
		Connection conn = DriverManager.getConnection(url,"root","root");
		Statement stmt = conn.createStatement();
    
    	String sql = "select * from patient where doctor = '" + name + "' and record<60 and yet=1";
    //	System.out.println(sql);
    	ResultSet rs = stmt.executeQuery(sql);
    	
    	JSONArray json = new JSONArray();
    	
    	while(rs.next() == true) {
    
    		JSONObject js = new JSONObject();
    		js.put("name", rs.getString("name"));
    		js.put("age", rs.getInt("age"));
    		js.put("sex", rs.getString("sex"));
    		js.put("profession", rs.getString("profession"));
    		js.put("phone", rs.getString("phone"));
    		js.put("record", rs.getInt("record"));
    		js.put("table", rs.getString("table"));
    		
    		json.add(js);
    	}
    	
    	out.print(json);
    	
    	int _t;
    	
    %>