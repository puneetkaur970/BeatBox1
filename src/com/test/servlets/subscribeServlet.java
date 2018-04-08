package com.test.servlets;

import java.io.IOException;
import java.sql.Connection;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.dao.ApplicationDao;

/**
 * Servlet implementation class subscribeServlet
 */
@WebServlet("/subscribe")
public class subscribeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public subscribeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int subscriptionId = Integer.parseInt(req.getParameter("subscriptionId"));
		String email = (String)req.getSession(false).getAttribute("email");
		String subscriptionStatus;
		
		
		
		Connection connection = (Connection)getServletContext().getAttribute("dbconnection");
		ApplicationDao dao = new ApplicationDao();
		int status= dao.subscribe(subscriptionId,email,connection);
		
		if(status==1) {
			subscriptionStatus="Subscription successful";
			
			req.setAttribute("subscriptionStatus", subscriptionStatus);
			req.getRequestDispatcher("/profileDetails").forward(req,resp);
		}
		else {
			subscriptionStatus="Subscription failed. Please try again.";
			//System.out.println("subscriptionStatus ="+ subscriptionStatus);
			req.setAttribute("subscriptionStatus", subscriptionStatus);
			req.getRequestDispatcher("/profileDetails").forward(req,resp);
		}
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
