<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.test.beans.Tracks"%>
<%@ page import="com.test.beans.Artists" %>
<%@ page import="com.test.beans.Albums" %>
<%@ page import="java.util.List"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/bootstrap.min.css" >
<title>Track List</title>
</head>
<body>

<% 
  if(session.getAttribute("email")!=null)
  {
	  %>  
    <%@ include file="header1.jsp"%>
    
    <%
  } else{
	  
  
    %>
    <%@ include file="header.jsp"%>
   <%
  }
   %> 
      
      <div class="container" id="trackslist">
           <h3>List of tracks related to search : </h3>
      		<div  class="container" style="border:thin"> 
     
  
          
        <table class="table table-bordered table-striped table-hover">
          <thead class="thead-dark">
            <tr>
             
              <th scope="col">Track Name </th>
              <th scope="col"> Hits</th>
              <th scope="col"> Click to play</th>
            </tr>
          </thead>

        
          <tbody>
          
            <% 
		 List<Tracks> TrackList= (ArrayList)request.getAttribute("tracklist");
		Iterator<Tracks> iterator= TrackList.iterator();
		while(iterator.hasNext()){
			Tracks track=iterator.next();
			
		%>
           
	             <tr id="TrackContainer">
	              <td><%= track.getTrackName() %></td>
	              <td><%= track.gethits() %></td>
	              <td><a class="btn btn-primary" href= "playTrack?TrackId=<%=track.getTrackId() %>">Play </a></td>
	            </tr>
            
         
         <%  
			}	
		%>
            
          </tbody>

      
          
        </table>
       
      </div>

      </div>
     <%@ include file="footer.jsp" %>

</body>
</html>