<%@page import="atg.taglib.json.util.JSONArray"%>
<%@ taglib prefix="json" uri="http://www.atg.com/taglibs/json" %>
<%@page import="atg.taglib.json.util.JSONObject"%>
<%@page import="java.sql.*" import="java.util.*" import="com.project.PatientInfo"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page trimDirectiveWhitespaces="true" %>  

 	<%
 		request.setCharacterEncoding("utf-8");
 		
 		Class.forName("com.mysql.jdbc.Driver");
 		String url = "jdbc:mysql://localhost:3306/test?useUnicode=true&characterEncoding=utf-8";
 		Connection conn = DriverManager.getConnection(url,"root","root");
 		Statement stmt = conn.createStatement();
 		String sql = "select * from patient where doctor='";

 		String doctorName = new String(request.getParameter("name").getBytes("iso-8859-1"),"utf-8");
 		
 		sql = sql + doctorName + "'";
 		
 		
 		ResultSet rs = stmt.executeQuery(sql);
 		
 		List<PatientInfo> list = new ArrayList<PatientInfo>();
 		
 		while(rs.next() == true) {
 			if(rs.getString("doctor").equals(doctorName)) {
				PatientInfo patient = new PatientInfo();
				patient.setName(rs.getString("name"));
				patient.setAge(rs.getInt("age"));
				patient.setSex(rs.getString("sex"));
				patient.setProfession(rs.getString("profession"));
				patient.setPhone(rs.getString("phone"));
				list.add(patient);
 			}
 		}
 		 
		JSONArray json = new JSONArray();
		
 		for(PatientInfo pi : list) {
 			JSONObject js = new JSONObject();
 			js.put("name",pi.getName());
 			js.put("age",pi.getAge());
 			js.put("sex",pi.getSex());
 			js.put("phone",pi.getPhone());
 			js.put("profession",pi.getProfession());
 			json.put(js);
 		}
 		
 		out.print(json);
 	%>
 	

