package com.project;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import atg.taglib.json.util.JSONArray;
import atg.taglib.json.util.JSONObject;

@WebServlet(name="LeaveMsg",urlPatterns="/LeaveMsg")
public class LeaveMsg extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = new String(request.getParameter("action").getBytes("iso-8859-1"),"utf-8");
		if(action.equals("write")) {
			WriteData(request, response);
		} else if(action.equals("read")) {
			ReadData(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = new String(request.getParameter("action").getBytes("iso-8859-1"),"utf-8");
		if(action.equals("write")) {
			WriteData(request, response);
		} else if(action.equals("read")) {
			ReadData(request, response);
		}
	}
	
	protected void WriteData(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		String context = new String(request.getParameter("context").getBytes("iso-8859-1"),"utf-8");
		String patient = new String(request.getParameter("patient").getBytes("iso-8859-1"),"utf-8");
		String doctor = new String(request.getParameter("doctor").getBytes("iso-8859-1"),"utf-8");
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/test?useUnicode=true&characterEncoding=utf-8";
			Connection conn = DriverManager.getConnection(url,"root","root");
			String sql = "insert into word(patient,doctor,context)values(?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1,patient);
			ps.setString(2,doctor);
			ps.setString(3,context);
			int rows = ps.executeUpdate();
			if(rows > 0) {
				System.out.println("留言内容写入数据库成功");
			}
			conn.close();
			ps.close();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	protected void ReadData(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		String doctor = new String(request.getParameter("doctor").getBytes("iso-8859-1"),"utf-8");
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/test?useUnicode=true&characterEncoding=utf-8";
			Connection conn = DriverManager.getConnection(url);
			String sql = "select * from word where doctor = '" + doctor + "'";
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			List<WordInfo> list = new ArrayList<WordInfo>();
			while(rs.next() == true) {
				WordInfo word = new WordInfo();
				word.setPatient(rs.getString("patient"));
				word.setDoctor(rs.getString("doctor"));
				word.setPatient(rs.getString("context"));
				list.add(word);
			}
			conn.close();
			stmt.close();
			JSONArray json = new JSONArray();
			for(WordInfo w : list) {
				JSONObject js = new JSONObject();
				js.put("name",w.getPatient());
				js.put("context",w.getContext());
				json.put(js);
			}
			PrintWriter out = response.getWriter();
			out.print(json);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
