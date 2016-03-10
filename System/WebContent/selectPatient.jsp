<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" import="com.project.PatientInfo" import="java.util.*"%>
<%@page import="atg.taglib.json.util.*"%>

    <%
    	request.setCharacterEncoding("utf-8");
    	String doctorName = new String(request.getParameter("name").getBytes("iso-8859-1"),"utf-8");
    	
    	Class.forName("com.mysql.jdbc.Driver");
    	String url = "jdbc:mysql://localhost:3306/test?useUnicode=true&characterEncoding=utf-8";
    	Connection conn = DriverManager.getConnection(url,"root","root");
    	Statement stmt = conn.createStatement();
    	
    	String sql = "select * from patient where doctor='" + doctorName + "' and yet=0";
    	
    	ResultSet rs = stmt.executeQuery(sql);
    	
    	List<PatientInfo> list = new ArrayList<>();
    	 
    	while(rs.next() == true) {
    		PatientInfo patient = new PatientInfo();
    		patient.setName(rs.getString("name"));
    		patient.setAge(rs.getInt("age"));
    		patient.setSex(rs.getString("sex"));
    		patient.setPhone(rs.getString("phone"));
    		patient.setProfession(rs.getString("profession"));
    		list.add(patient);
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