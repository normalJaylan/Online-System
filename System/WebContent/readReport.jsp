<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.io.*"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@page import="atg.taglib.json.util.*" import="java.sql.*" import="java.util.*"%>
    <%
   
    	String doctorName = new String(request.getParameter("name").getBytes("iso-8859-1"),"utf-8");
    	Class.forName("com.mysql.jdbc.Driver");
    	String url = "jdbc:mysql://localhost:3306/test?useUnicode=true&characterEncoding=utf-8";
		Connection conn = DriverManager.getConnection(url,"root","root");
		Statement stmt = conn.createStatement();
		String sql = "select * from report where doctor = '" + doctorName + "'";		
		ResultSet rs = stmt.executeQuery(sql);
		
		List<String> list = new ArrayList<String>();
		
		while(rs.next() == true) {
			list.add(rs.getString("patient"));
		}
		
    	String base = "E:\\GitHub\\Online-System\\System\\WebContent\\record\\";
    	String path = "";
    	
    	FileReader fr;
    	BufferedReader br;
    	String context = "";
    	String report = "";
    	
    	JSONArray json = new JSONArray();
    	JSONObject js;
    	
    	for(String name : list) {
    		path = base + name + ".txt";	
    		fr = new FileReader(path);
    		br = new BufferedReader(fr);
    		context = br.readLine();
    		while(context != null) {
    			report += context;
    			context = br.readLine();
    		}
    		js = new JSONObject();
    		js.put("name", name);
    		js.put("context", report);
    		json.add(js);
    	}
    	
    	out.print(json);
    	
    %>
