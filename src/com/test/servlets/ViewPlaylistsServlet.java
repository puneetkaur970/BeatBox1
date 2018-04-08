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
import com.test.dao.ApplicationDao;


@WebServlet("/ViewPlaylists")
public class ViewPlaylistsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection connection = (Connection)getServletContext().getAttribute("dbconnection");
		String email= (String)request.getSession().getAttribute("email");
		//System.out.println("In view playlists servlet");
		ApplicationDao dao= new ApplicationDao();
		List<Playlist> playlists = dao.viewPlaylists(connection, email);
		request.setAttribute("playlists", playlists);
		//System.out.println(playlists);
		request.getRequestDispatcher("playtrack.jsp").forward(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
