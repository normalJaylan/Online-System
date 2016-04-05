<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.io.*"%>

    <%
    
	    String patientName = new String(request.getParameter("patientName").getBytes("iso-8859-1"),"utf-8");
	
		String contextString = new String(request.getParameter("context").getBytes("iso-8859-1"),"utf-8");
		
		String base = "E:\\GitHub\\Online-System\\System\\WebContent\\record\\";
		
		byte[] context = contextString.getBytes();
		String path = base + patientName + ".txt";
		File file = new File(path);
		
		FileOutputStream  fout = null;
		
		try{
			
			fout = new FileOutputStream(file);
			fout.write(context);
			fout.flush();
			fout.close();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
    %>