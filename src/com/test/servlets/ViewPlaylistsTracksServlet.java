package com.test.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.beans.Tracks;
import com.test.dao.ApplicationDao;


@WebServlet("/ViewPlaylistsTracks")
public class ViewPlaylistsTracksServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public ViewPlaylistsTracksServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int PlayListId= Integer.parseInt(req.getParameter("playlistId"));
		//int PlayListId=18;
		Connection connection = (Connection)getServletContext().getAttribute("dbconnection");
		ApplicationDao dao = new ApplicationDao();
		List<Tracks> tracklist= dao.viewPlaylistTracks(PlayListId,connection);
		System.out.println("get palylist id="+ PlayListId);
		
		req.setAttribute("tracklist", tracklist);
		req.getRequestDispatcher("tracklist.jsp").forward(req,resp);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
