package com.test.servlets;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.dao.ApplicationDao;


@WebServlet("/LikeTrack")

public class LikeTrackServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public LikeTrackServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int TrackId= Integer.parseInt(request.getParameter("TrackId"));
		
		Connection connection=(Connection) getServletContext().getAttribute("dbconnection");
		ApplicationDao dao=new ApplicationDao();
		int status=dao.likeTrack(TrackId, connection);
		
		request.getRequestDispatcher("playTrack?TrackId="+TrackId).forward(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
