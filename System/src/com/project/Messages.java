package com.project;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import java.util.*;

@WebServlet(name="Messages",urlPatterns="/Messages")
public class Messages extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	
	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		String action = request.getParameter("action");
		if(action.equals("send")) {
			sendMessage(request, response);
		} else if(action.equals("get")) {
			getMessage(request, response);
		}
	}
	
	public void sendMessage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
//		String patientName = request.getParameter("patientName");
//		String doctorName = request.getParameter("doctorName");
		String content = request.getParameter("content");
//		String sendTime = new Date().toLocaleString();
		ServletContext application = getServletContext();
		String sourceMessage = application.getAttribute("message").toString();
		sourceMessage += content;   //这里设置对话内容
		application.setAttribute("message",sourceMessage);
		request.getRequestDispatcher("Messages?action=get").forward(request, response);
		
	}

	public void getMessage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");

	}
	
}
