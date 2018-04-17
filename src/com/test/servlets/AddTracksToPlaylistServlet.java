package com.test.servlets;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.test.dao.*;


@WebServlet("/AddTracksToPlaylist")
public class AddTracksToPlaylistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public AddTracksToPlaylistServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int playlistId= Integer.parseInt(request.getParameter("playlistId"));
		int TrackId= Integer.parseInt(request.getParameter("trackId"));
		System.out.println(TrackId);
		Connection connection = (Connection)getServletContext().getAttribute("dbconnection");
		
		ApplicationDao dao=new ApplicationDao();
		int status= dao.addTracktoPlaylist(playlistId, TrackId, connection);
		
		if(status==1) {
			String addTrackToPlaylistStatus=" Track added to playlist successully";
			request.setAttribute("addTrackToPlaylistStatus", addTrackToPlaylistStatus);
		}
		else {	
			String addTrackToPlaylistStatus=" Couldn't add track. Some error occured";
			request.setAttribute("addTrackToPlaylistStatus", addTrackToPlaylistStatus);
		}
	
		request.getRequestDispatcher("playTrack?TrackId="+TrackId).forward(request, response);
	}


	

}
