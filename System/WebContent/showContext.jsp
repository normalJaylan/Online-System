<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.io.*"%>
<%@ page trimDirectiveWhitespaces="true" %>   
    <%
    	String patientName = new String(request.getParameter("name").getBytes("iso-8859-1"),"utf-8");
    
    	String base = "E:\\GitHub\\Online-System\\System\\WebContent\\record\\";
    	String path = base + patientName + ".txt";
    	
    	BufferedReader br = new BufferedReader(new FileReader(path));
    	
    	String context = "";
    	String report = "";
    	
    	context = br.readLine();
    	while(context != null) {
    		report += context;
    		report += "\r";
    		context = br.readLine();
    	}
    	
    	br.close();
    	
    	out.print(report);
    	
    %>
