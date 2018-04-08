package com.test.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.beans.TrackDetails;
import com.test.beans.Tracks;
import com.test.dao.ApplicationDao;


@WebServlet("/AlbumTracks")
public class AlbumTracksServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public AlbumTracksServlet() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int albumId= Integer.parseInt(req.getParameter("albumId"));
		
		//int TrackId=7;
		//System.out.println("The album id = "+albumId);
		
		Connection connection = (Connection)getServletContext().getAttribute("dbconnection");
		ApplicationDao dao =new ApplicationDao();
		List<Tracks> tracklist= dao.getTracksByAlbum(albumId,connection);
		
		//System.out.println("Got tracklist object in Album Tracks servlet");
		req.setAttribute("tracklist", tracklist);
		req.getRequestDispatcher("tracklist.jsp").forward(req,resp);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
