package com.test.servlets;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.dao.ApplicationDao;

@WebServlet("/CreatePlaylist")
public class CreatePlaylistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public CreatePlaylistServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String createPlaylistStatus;
		String playlistName=request.getParameter("playlistname");
		
		Connection connection= (Connection)getServletContext().getAttribute("dbconnection");
		String email= (String)request.getSession().getAttribute("email");
		
		System.out.println("Inside create playlist "+ email + playlistName);
		
		ApplicationDao dao = new ApplicationDao();
		int status= dao.createPlaylist(playlistName, email, connection);
		if(status==1) {
			createPlaylistStatus="Playlist "+ playlistName +" created successfully";
			System.out.println("createPlaylistStatus ="+ createPlaylistStatus);
			request.setAttribute("createPlaylistStatus", createPlaylistStatus);
			request.getRequestDispatcher("/profileDetails").forward(request,response);
		}
		else {
			createPlaylistStatus="Couldnot create playlist. Please try again.";
			System.out.println("createPlaylistStatus ="+ createPlaylistStatus);
			request.setAttribute("createPlaylistStatus", createPlaylistStatus);
			request.getRequestDispatcher("/profileDetails").forward(request,response);
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
