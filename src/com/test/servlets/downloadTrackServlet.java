package com.test.servlets;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.dao.ApplicationDao;


@WebServlet("/downloadTrack")
public class downloadTrackServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public downloadTrackServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String link= request.getParameter("tracklink");
		String email=(String)request.getSession().getAttribute("email");
		Connection connection= (Connection) getServletContext().getAttribute("dbconnection");
		ApplicationDao dao= new ApplicationDao();
		
		System.out.println("I am in download tracks.");
		
		if(email==null) {
			request.getRequestDispatcher("form.jsp").forward(request, response);
		}
		
		int status= dao.validateDownloadPermission(connection, email);
		System.out.println("I am in download tracks calling validate download.");
		
		if(status>0) {
			System.out.println("I am in download tracks and fetching you link.");
			request.getRequestDispatcher(link).forward(request, response);
		}
		
		else {
			
			request.setAttribute("subscriptionStatus", "Please update your subscription plan.");
			request.getRequestDispatcher("profileDetails").forward(request, response);
		}
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
