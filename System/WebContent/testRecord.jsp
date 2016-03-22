<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.io.*" import="java.sql.*" import="java.util.Date" import="java.text.*" import="java.util.*"%>

	<%
		
		String patientName = new String(request.getParameter("patientName").getBytes("iso-8859-1"),"utf-8");
		String doctorName = new String(request.getParameter("doctorName").getBytes("iso-8859-1"),"utf-8");
	
		String contextString = new String(request.getParameter("context").getBytes("iso-8859-1"),"utf-8");
		
		Calendar calendar = Calendar.getInstance();
		int year = calendar.get(Calendar.YEAR);
		int month = calendar.get(Calendar.MONTH) + 1;
		int day = calendar.get(Calendar.DATE);
		
		Date date = new Date();
		int hour = date.getHours();
		int minute = date.getMinutes();
		
		byte[] context = contextString.getBytes();
		
		String path = "E:\\GitHub\\Online-System\\System\\WebContent\\record\\";
		
		path = path + patientName + ".txt";
		
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
		
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/test?useUnicode=true&characterEncoding=utf-8";
		Connection conn = DriverManager.getConnection(url,"root","root");
		String sql = "insert into report(doctor,patient,path,year,month,day,hour,minute)values(?,?,?,?,?,?,?,?)";
		PreparedStatement ps = conn.prepareStatement(sql);
		
		ps.setString(1,doctorName);
		ps.setString(2,patientName);
		ps.setString(3,path);
		ps.setInt(4,year);
		ps.setInt(5,month);
		ps.setInt(6,day);
		ps.setInt(7,hour);
		ps.setInt(8,minute);
		
		int row = ps.executeUpdate();
		if (row > 0) {
			String insert_sql = "update patient set yet = ? where name = ?";
			PreparedStatement insert_ps = conn.prepareStatement(insert_sql);
			insert_ps.setInt(1,1);
			insert_ps.setString(2,patientName);
			int insert_row = insert_ps.executeUpdate();
			insert_ps.close();
			ps.close();
			if(insert_row > 0) {
				System.out.println(path);
				System.out.println("咨询记录生成成功，病人yet属性重置成功");
			}
		}
		
		String sql_delete = "delete from chat where 1=1";					//清楚聊天记录
		PreparedStatement p = conn.prepareStatement(sql_delete);
		p.executeUpdate();
		p.close();
		conn.close();
		
		session.setAttribute("name",doctorName);
		response.sendRedirect("inter_index_evaluation.jsp");
	%>