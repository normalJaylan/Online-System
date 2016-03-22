package com.project;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import atg.taglib.json.util.JSONArray;
import atg.taglib.json.util.JSONObject;

import java.util.*;
import java.sql.*;

@WebServlet(name="Message",urlPatterns="/Message")
public class Message extends HttpServlet {
	private static final long serialVersionUID = 1L;
    static int ID = 1;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		String action = new String(request.getParameter("action").getBytes("iso-8859-1"),"utf-8");
		if(action.equals("write")) {
			writeMessage(request,response);
		} else if(action.equals("read")) {
			readMessage(request, response);
		} else if(action.equals("delete")) {
			deleteMessage(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		String action = new String(request.getParameter("action").getBytes("iso-8859-1"),"utf-8");
		if(action.equals("write")) {
			writeMessage(request,response);
		} else if(action.equals("read")) {
			readMessage(request, response);
		} else if(action.equals("delete")) {
			deleteMessage(request, response);
		}
	}
	
	protected void writeMessage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		String name = new String(request.getParameter("name").getBytes("iso-8859-1"),"utf-8");
		String context = new String(request.getParameter("context").getBytes("iso-8859-1"),"utf-8");
		String profession = new String(request.getParameter("profession").getBytes("iso-8859-1"),"utf-8");
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/test?useUnicode=true&characterEncoding=utf-8";
			Connection conn = DriverManager.getConnection(url,"root","root");
			String sql = "insert into chat(name,context,profession,id)values(?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1,name);
			ps.setString(2,context);
			ps.setString(3,profession);
			ps.setInt(4,ID);
			int rows = ps.executeUpdate();
			if(rows > 0) {
				System.out.println("消息写入数据库成功");
			} else {
				System.out.println("消息写入数据库失败");
			}
			response.sendRedirect("127.0.0.1:8080/chat_page.jsp");
			ps.close();
			conn.close();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		ID++;
	}
	
	protected void readMessage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		List<ChatInfo> list = new ArrayList<ChatInfo>();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/test?useUnicode=true&characterEncoding=utf-8";
			Connection conn = DriverManager.getConnection(url,"root","root");
			Statement stmt = conn.createStatement();
			String sql = "select * from chat";
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next() == true) {
				ChatInfo chat = new ChatInfo();
				chat.setName(rs.getString("name"));
				chat.setContext(rs.getString("context"));
				chat.setProfession(rs.getString("profession"));
				list.add(chat);
			}
			conn.close();
			stmt.close();
			rs.close();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.addSuppressed(e);
		}
		JSONArray json = new JSONArray();
		try{
			for(ChatInfo c : list) {
				JSONObject js = new JSONObject();
				js.put("name",c.getName());
				js.put("context",c.getContext());
				js.put("profession",c.getProfession());
				json.put(js);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		PrintWriter out = response.getWriter();
		out.print(json);
	}
	
	protected void deleteMessage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		List<ChatInfo> list = new ArrayList<ChatInfo>();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/test?useUnicode=true&characterEncoding=utf-8";
			Connection conn = DriverManager.getConnection(url,"root","root");
			String sql = "delete from chat where id between 1 and 3";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.executeUpdate();
			Statement stmt = conn.createStatement();
			String sql_select = "select * from chat";
			ResultSet rs = stmt.executeQuery(sql_select);
			while(rs.next() == true) {
				ChatInfo chat = new ChatInfo();
				chat.setName(rs.getString("name"));
				chat.setContext(rs.getString("context"));
				chat.setProfession(rs.getString("profession"));
				chat.setId(rs.getInt("id"));
				list.add(chat);
			}
			ID = 1;
			for(ChatInfo c : list) {
				String sql_insert = "update chat set id = ? where id = ?";
				PreparedStatement p = conn.prepareStatement(sql_insert);
				p.setInt(1,ID);
				p.setInt(2,c.getId());
				p.executeUpdate();
				ID++;
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
