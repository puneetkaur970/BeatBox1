package com.test.servlets;



import java.io.IOException;
import java.sql.Connection;



import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.test.beans.User;
import com.test.dao.ApplicationDao;

@WebServlet("/RegisterUser")

public class RegisterUserServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		
		//collect all form data
		String imgpath =req.getParameter("imgpath");
	     String email = req.getParameter("email");
	     String password = req.getParameter("password");
	     String firstname = req.getParameter("fname");
	     String lastname = req.getParameter("lname");
	     String dateofbirth = req.getParameter("dob");
	     String gender = req.getParameter("gender");
	     String aboutyou = req.getParameter("aboutyou");
	     
	     //fill it up in a User bean
	     User user = new User(email, password, firstname, lastname, dateofbirth, gender, aboutyou,imgpath);
	     Connection connection = (Connection)getServletContext().getAttribute("dbconnection");
	     // call Dao layer and save the user object to DB
	     ApplicationDao dao=new ApplicationDao();
	     int rows = dao.registerUser(user,connection);
	     
	     //success msg or not
	     String infoMessage = null;
	     if(rows==0) {
	    	 infoMessage = "Sorry, an error occurred!";
	    	 req.setAttribute("infoMessage", infoMessage);
	    	 req.getRequestDispatcher("form.jsp").forward(req, resp);
	     }
	     else {
	    	 infoMessage = "User sign up successful, now please Login";
	    	 req.setAttribute("infoMessage", infoMessage);
	    	 req.getRequestDispatcher("form.jsp").forward(req, resp);
	     }
	     
	  
	}
	
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{

	}
   
}
