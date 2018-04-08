package com.test.servlets;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.text.MessageFormat;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.beans.Artists;
import com.test.beans.Tracks;
import com.test.beans.Albums;
import com.test.dao.ApplicationDao;


@WebServlet("/search")
public class SearchServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		//collect search string from the form
		String searchString = req.getParameter("search");
		Connection connection = (Connection)getServletContext().getAttribute("dbconnection");
		 
		//call DAO layer and get all products for search criteria
		ApplicationDao dao = new ApplicationDao();
		List<Tracks> TrackList= dao.searchTracks(searchString, connection);
		List<Artists> ArtistList=dao.searchArtists(searchString,connection);
		List<Albums> AlbumList=dao.searchAlbum(searchString, connection);
		
		//write the products data back to the client browser
	/*	String page = getHTMLString(req.getServletContext().getRealPath("searchresults.html"),TrackList);
		resp.getWriter().write(page);*/ 
		
		req.setAttribute("TrackList", TrackList);
		req.setAttribute("ArtistList", ArtistList);
		req.setAttribute("AlbumList", AlbumList);
		req.getRequestDispatcher("searchresults.jsp").forward(req, resp);
		//System.out.println("In search Servlet end");
		
		
	}
	

}
