package com.test.servlets;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.test.dao.*;
import com.test.beans.*;


@WebServlet("/playTrack")
public class playTrack extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public playTrack() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int TrackId= Integer.parseInt(req.getParameter("TrackId"));
		
		//int TrackId=7;
	//	System.out.println("The Track id = "+TrackId);
		
		Connection connection = (Connection)getServletContext().getAttribute("dbconnection");
		ApplicationDao dao =new ApplicationDao();
		TrackDetails trackdetails= dao.getTrackDetails(TrackId, connection);
		
	//	System.out.println("Got tracklist object in playtrack servlet");
		req.setAttribute("TrackDetails", trackdetails);
		if(req.getSession().getAttribute("email")!=null) {
			
			req.getRequestDispatcher("/ViewPlaylists").forward(req,resp);
		}
		
		else {
			req.getRequestDispatcher("playtrack.jsp").forward(req, resp);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
