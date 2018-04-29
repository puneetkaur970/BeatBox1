<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.test.beans.Tracks"%>
<%@ page import="com.test.beans.Artists" %>
<%@ page import="com.test.beans.Albums" %>
<%@ page import="java.util.List"%>

	
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <title>Search Results</title>
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
              <th scope="col"> Track id:</th>
              <th scope="col">Track Name </th>
              <th scope="col"> Hits</th>
              <th scope="col"> Click to play</th>
            </tr>
          </thead>

        
          <tbody>
          
            <% 
		 List<Tracks> TrackList= (ArrayList)request.getAttribute("TrackList");
		Iterator<Tracks> iterator= TrackList.iterator();
		while(iterator.hasNext()){
			Tracks track=iterator.next();
			
		%>
           
	             <tr id="TrackContainer">
	              <td><%=  track.getTrackId() %></td>
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
      <br>
      <div class="container" id="artistlist">
        <h3>List of Artists related to search : </h3>
      <div  class="container" style="border:thin">        
        <table class="table table-bordered table-striped table-hover">
          <thead class="thead-dark">
            <tr>
              <th scope="col"> Artist Image</th>
              <th scope="col">Artist Name </th>
              <th scope="col"> For Artist Tracks</th>
            </tr>
          </thead>
		
         <tbody>
         <% 
		 List<Artists> ArtistList= (ArrayList)request.getAttribute("ArtistList");
		Iterator<Artists> iterator1= ArtistList.iterator();
		while(iterator1.hasNext()){
			Artists artist=iterator1.next();
			
		%>
       
          <form>
            <tr id="ArtistContainer">
              <td><img src="<%= artist.getArtistImg() %>"  height="150" width="150" class="img-thumbnail rounded-circle"></td>
              <td><%= artist.getArtistName() %></td>
              <td><a class="btn btn-primary" href= "ArtistTracks?artistId=<%= artist.getArtistId() %>">Click </a></td>
            </tr>
          </form>

          <%  
			}	
		%>
		</tbody>
          
        </table>
      </div>
      </div>

        <div class="container" id="albumlist">
        <h3>List of Albums related to search : </h3>
      <div  class="container" style="border:thin">        
        <table class="table table-bordered table-striped table-hover">
          <thead class="thead-dark">
            <tr>
              <th scope="col"> Album Image</th>
              <th scope="col">Album Name </th>
              <th scope="col">Release - Date</th>
              <th scope="col"> For Album Tracks</th>
            </tr>
          </thead>

          <!-- Get playlist names here -->
          <tbody>
           <%
		 List<Albums> AlbumList= (ArrayList)request.getAttribute("AlbumList");
		Iterator<Albums> iterator2= AlbumList.iterator();
		while(iterator2.hasNext()){
			Albums album =iterator2.next();
			
		%>
          <form>
            <tr>
              <td><img src="<%= album.getAlbumImg() %>"  height="150" width="150" class="img-thumbnail rounded-circle"></td>
              <td><%= album.getAlbumName() %></td>
              <td><%= album.getReleaseDate() %></td>
              <td><a class="btn btn-primary" href= "AlbumTracks?albumId=<%=album.getAlbumId() %>">Click </a></td>
              
            </tr>
          </form>  
        <%  
			}	
		%>   
            
          </tbody>
		
       
          
        </table>
      </div>

      </div>
<%@ include file="footer.jsp" %>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
   <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  </body>
</html>