<%@page import="atg.taglib.json.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.sql.*" import="java.util.*" import="com.project.*"%>
<%@ page trimDirectiveWhitespaces="true" %>
	<% 
		//  返回医生已完成的咨询	

		String doctorName = new String(request.getParameter("name").getBytes("iso-8859-1"),"utf-8");
	
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/test?useUnicode=true&characterEncoding=utf-8";
		Connection conn = DriverManager.getConnection(url,"root","root");
		Statement stmt = conn.createStatement();
		
		String sql = "select * from report where doctor='" + doctorName + "'";
				
		ResultSet rs = stmt.executeQuery(sql);
		
		List<ReportInfo> list = new ArrayList<ReportInfo>();
		List<PatientInfo> pa = new ArrayList<PatientInfo>();
		
		while(rs.next() == true) {
			
			if (doctorName.equals(rs.getString("doctor"))) {
				ReportInfo report = new ReportInfo();
				report.setDoctorName(doctorName);
				report.setPatientName(rs.getString("patient"));
				report.setPath(rs.getString("path"));
				list.add(report);
				
				String sqlPatient = "select * from patient where name = '" + rs.getString("patient") + "'";
				Statement stmt2 = conn.createStatement();
				ResultSet result = stmt2.executeQuery(sqlPatient);
				while(result.next() == true) {
					PatientInfo patient = new PatientInfo();
					patient.setAge(result.getInt("age"));
					patient.setSex(result.getString("sex"));
					patient.setSex(result.getString("phone"));
					patient.setProfession(result.getString("profession"));
					patient.setPhone(result.getString("phone"));
					patient.setRecord(result.getInt("record"));
					patient.setTable(result.getString("table"));
					pa.add(patient);
				}
			}
		}
		
		
		JSONArray json = new JSONArray();
		int i = 0;
		
		for (ReportInfo ri : list) {
			JSONObject js = new JSONObject();
			js.put("name",ri.getPatientName());
			js.put("path",ri.getPath());
			js.put("age",pa.get(i).getAge());
			js.put("sex",pa.get(i).getSex());
			js.put("profession",pa.get(i).getProfession());
			js.put("phone",pa.get(i).getPhone());
			js.put("record",pa.get(i).getRecord());
			js.put("table",pa.get(i).getTable());
			json.put(js);
			i++;
		}
		
		out.print(json);
		
	%>