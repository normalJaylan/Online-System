<%@page import="atg.taglib.json.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.sql.*" import="java.util.*" import="com.project.ReportInfo"%>
	
	<% 
		
		request.setCharacterEncoding("utf-8");
		String doctorName = new String(request.getParameter("doctorName").getBytes("iso-8859-1"),"utf-8");
	
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/test?useUnicode=true&characterEncoding=utf-8";
		Connection conn = DriverManager.getConnection(url,"root","root");
		Statement stmt = conn.createStatement();
		
		String sql = "select * from report where doctor='" + doctorName + "'";
				
		ResultSet rs = stmt.executeQuery(sql);
		
		List<ReportInfo> list = new ArrayList<>();
		
		while(rs.next() == true) {
			
			if (doctorName.equals(rs.getString("doctor"))) {
				ReportInfo report = new ReportInfo();
				report.setDoctorName(doctorName);
				report.setPatientName(rs.getString("patient"));
				report.setPath(rs.getString("path"));
				
				list.add(report);
			}
		}
		
		JSONArray json = new JSONArray();
		
		for (ReportInfo ri : list) {
			JSONObject js = new JSONObject();
			js.put("doctorName",doctorName);
			js.put("patientName",ri.getPatientName());
			js.put("path",ri.getPath());
			
			json.put(js);
		}
		
		out.print(json);
		
	%>