package com.test.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.beans.Playlist;
import com.test.dao.*;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email = req.getParameter("email");
		String password= req.getParameter("password");
		Connection connection = (Connection)getServletContext().getAttribute("dbconnection");
		
		ApplicationDao dao= new ApplicationDao();
		int status= dao.validateUser(email, password, connection);
	//	System.out.println("i am in applivation dao for login");
		
		if(status==1) {
			
			HttpSession session= req.getSession(true);
			session.setAttribute("email", email);
			session.setAttribute("password", password);
			String sessionId= session.getId();
			session.setAttribute("sessionId", sessionId);
		//	System.out.println("i am in home page after login");
			req.getRequestDispatcher("/home.jsp").forward(req, resp);
			
		}
		
		else {
			req.setAttribute("Message", "Login was unsuccessful.");
			req.getRequestDispatcher("form.jsp").forward(req, resp);
		//	System.out.println("login req. fail");
		}
	}

}
