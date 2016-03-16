<%@page import="java.sql.*" import="java.util.*" import="com.project.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="atg.taglib.json.util.*"%>
<%@ page trimDirectiveWhitespaces="true" %>
    
    <%
    
    	String doctor = new String(request.getParameter("doctor").getBytes("iso-8859-1"),"utf-8");
    
    	Class.forName("com.mysql.jdbc.Driver");
    	String url = "jdbc:mysql://localhost:3306/test?useUnicode=true&characterEncoding=utf-8";
    	Connection conn = DriverManager.getConnection(url,"root","root");
    	String sql = "select * from word_todoctor where doctor = '"+ doctor + "' and yet = 0";
    	Statement stmt = conn.createStatement();
    	ResultSet rs = stmt.executeQuery(sql);
    	
    	List<WordInfo> list = new ArrayList<WordInfo>();
    		
    	while(rs.next() == true) {
    		WordInfo word = new WordInfo();
    		word.setPatient(rs.getString("patient"));
    		word.setContext(rs.getString("context"));
    		list.add(word);
    	}
       	
    	JSONArray json = new JSONArray();
    	
    	for(WordInfo w : list) {
    		JSONObject js = new JSONObject();
    		js.put("name",w.getPatient());
    		js.put("context",w.getContext());
    		json.put(js);
    	}
    	
    	out.print(json);
    	
    	conn.close();
    	stmt.close();
    	rs.close();
    %>
