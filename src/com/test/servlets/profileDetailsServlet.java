package com.test.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.beans.Playlist;
import com.test.beans.User;
import com.test.dao.ApplicationDao;

@WebServlet("/profileDetails")
public class profileDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public profileDetailsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Connection connection = (Connection)getServletContext().getAttribute("dbconnection");
		String email= (String)request.getSession().getAttribute("email");
		
		ApplicationDao dao= new ApplicationDao();
		User user= dao.getProfileDetails(connection, email);
		List<Playlist> playlists = dao.viewPlaylists(connection, email);
		request.setAttribute("playlists", playlists);
		request.setAttribute("user", user);
		request.getRequestDispatcher("profile.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
