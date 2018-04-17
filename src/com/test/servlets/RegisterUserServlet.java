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
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/**
     * Directory where uploaded files will be saved, its relative to
     * the web application directory.
     */
	
	 private static final String UPLOAD_DIR = "uploads";
	 
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{

		//collect all form data
		String imgpath;
		 String fileName= req.getParameter("imgpath");
	     String email = req.getParameter("email");
	     String password = req.getParameter("password");
	     String firstname = req.getParameter("fname");
	     String lastname = req.getParameter("lname");
	     String dateofbirth = req.getParameter("dob");
	     String gender = req.getParameter("gender");
	     String aboutyou = req.getParameter("aboutyou");
	     if(!fileName.equals("null")) {
	    	 imgpath= UPLOAD_DIR +"\\"+req.getParameter("imgpath");
	     }
	     
	     else {
	    	imgpath="uploads\\defaultuser.jpg"; 
	     }
	     
	  //   System.out.println( "Register user servlet: "+imgpath);
	     //fill it up in a User bean
	     User user = new User(email, password, firstname, lastname, dateofbirth, gender, aboutyou,imgpath);
	     
	    // System.out.println(user.getEmail()+"  "+ user.getFirstName());
	     
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
