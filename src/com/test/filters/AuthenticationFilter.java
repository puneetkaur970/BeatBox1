package com.test.filters;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class AuthenticationFilter
 */
@WebFilter(urlPatterns= {"/profileDetails","/subscribe","/ViewPlaylists" ,"/ViewPlaylistTracks" ,"/CreatePlaylist","/AddTracksToPlaylist","/downloadTrack"})
public class AuthenticationFilter implements Filter {

    /**
     * Default constructor. 
     */
    public AuthenticationFilter() {
        // TODO Auto-generated constructor stub
    }

	
	public void destroy() {
		// TODO Auto-generated method stub
	}

	
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request= (HttpServletRequest)req;
		HttpSession session= request.getSession(false);
		
			
			if(session==null) {
				request.setAttribute("Message", "Please login again: ");
				request.getRequestDispatcher("form.jsp").forward(request, resp);
			}
			if(session.getAttribute("email")==null|| session.getAttribute("password")==null) {
				System.out.println("Session not found, so cant display profile"+ (String)session.getAttribute("email"));
				request.setAttribute("Message", "Please login again: ");
				request.getRequestDispatcher("form.jsp").forward(request, resp);
				
			}
			else {
		
		//System.out.println("Session valid, so filter allows access to profile "+ (String)session.getAttribute("email"));
		
		 chain.doFilter(request, resp);
			}
		 
	}

	
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
