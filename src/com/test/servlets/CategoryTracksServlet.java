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


@WebServlet("/CategoryTracks")
public class CategoryTracksServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public CategoryTracksServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String category= req.getParameter("category");
		
		
		System.out.println("The category  = "+category);
		
		Connection connection = (Connection)getServletContext().getAttribute("dbconnection");
		ApplicationDao dao =new ApplicationDao();
		List<Tracks> tracklist= dao.getTracksByCategory(category,connection);
		
	//	System.out.println("Got tracklist object in Category Tracks servlet");
		req.setAttribute("tracklist", tracklist);
	//	System.out.println("Tracklist item 1:"+ tracklist.toString());
		req.getRequestDispatcher("tracklist.jsp").forward(req,resp);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
