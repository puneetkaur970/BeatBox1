package com.test.servlets;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.test.beans.SubscriptionPlan;
import java.util.List;
import com.test.dao.*;

@WebServlet("/SubscriptionPlan")
public class SubscriptionPlanServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public SubscriptionPlanServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		Connection connection = (Connection)getServletContext().getAttribute("dbconnection");
		ApplicationDao dao= new ApplicationDao();
		List<SubscriptionPlan> SubscriptionPlanList = dao.getSubscriptionPlans(connection);
		
		req.setAttribute("SubscriptionPlanList", SubscriptionPlanList);
		req.getRequestDispatcher("subscriptionplans.jsp").forward(req, resp);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
