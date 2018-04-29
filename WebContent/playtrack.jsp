<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.test.beans.*"%>
<%@ page import="java.util.*" %>


<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
   

    <title>PLay track</title>
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
    
    
    <%
    TrackDetails trackdetails=(TrackDetails) request.getAttribute("TrackDetails");
   
    %>
    <div class="card container my-3">
	    <div class="container card-body row m-3">
	      <a href= "AlbumTracks?albumId=<%= trackdetails.album.getAlbumId() %>"><img src="<%= trackdetails.album.getAlbumImg() %>" height="150"; width="150" class="rounded-circle  col-1-5"></a>
	
		      <div class=" col">
		        <h5 class="card-title"> Album Details:</h5>
		
		      	<p><strong> Album name: </strong> <%= trackdetails.album.getAlbumName() %> </p>
		      	<p> <strong> Release Date:</strong> <%= trackdetails.album.getReleaseDate() %> </p>
		        
		      </div>
	      </div>
    </div>
  
      <%
    	
    	for( Artists a: trackdetails.artists){
    		if(a!=null){
    		
    	
    %>
	<div class="card container my-3">
      <div class="container card-body row m-3">
    
      <a href="ArtistTracks?artistId=<%= a.getArtistId() %>"><img src=" <%= a.getArtistImg() %> "  height="150"; width="150"  class="rounded-circle  col-1-5"></a>

      <div class=" col">
        <h5 class="card-title"> Artist Name: </h5>

      	<p><%= a.getArtistName() %> </p>
        
      </div>
      </div>
    </div>
    
    <%
    		}
    	}
    %>

    <div class="container card my-3 text-center">
    
		<h4> Track details: </h4>
		<p> <strong>Track Name: </strong> <%= trackdetails.track.getTrackName() %> </p>
		<p> <strong>Track hits:</strong> <%= trackdetails.track.gethits() %> </p>    
      <audio controls class="text-center" style="float:center;" preload="auto">
      	<source src=" <%= trackdetails.track.getTrackLink() %>" type="audio/mp3">
        <source src="Tracks\Kainaat Chale.mp3" type="audio/mp3">
      </audio> 

    </div>



    <div class="container my-3 text-center">
    
    <form method="get" action="downloadTrack">
    <input type="hidden" name="tracklink" value="<%= trackdetails.track.getTrackLink() %>">
    <button class=" btn btn-primary" type="submit" >Download</button>
    
    </form><br>
  

       <a class="btn btn-primary" href= "LikeTrack?TrackId=<%= trackdetails.track.getTrackId() %>">Like</a>
       <a class="btn btn-primary" href="#playlistform" data-toggle="modal" >Add to playlist</a>

<%
	if(request.getAttribute("addTrackToPlaylistStatus")!=null){
		%>
		<br><span><%= (String)request.getAttribute("addTrackToPlaylistStatus") %></span><br>
		<%
	}
%>


  <div class="modal fade" id="playlistform" tabindex="-1" role="dialog" aria-labelledby="createPlaylistModal" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Select playlist: </h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" id=#playlists>
       <form class="form" action="AddTracksToPlaylist" method="post"> 
       <input type="hidden" name="trackId" value="<%= trackdetails.track.getTrackId() %>">
  <div>
 <%
 int hideSubmit=0;
 if(session.getAttribute("email")==null){
		%>
		<strong>Please log in first!! </strong>
		<% 
	
	}else
		{
				
		 	List<Playlist> playlists= (List<Playlist>)request.getAttribute("playlists");
		 	Iterator<Playlist> iterator = playlists.iterator();
		 	if(!iterator.hasNext()){
		 			hideSubmit=1;
		 		%>
		 		
		 		<strong> You have no playlist!! </strong>
		 	<% } else{
		 	while(iterator.hasNext()){
		 		Playlist p= iterator.next();
 		
 		%>
	
    <input type="radio"
           name="playlistId" value="<%= p.getPlaylistId() %>">
    <label for="contactChoice1"><%= p.getPlaylistName() %></label><br>
   
       <%
     	}
 	}
	}
 %>
  </div>
  <div>
   <%
 	if(hideSubmit!=1){
 		
 	%>
    <button class="btn btn-primary" type="submit" >Submit</button> 
	<%
 	}
	%>
  </div>
</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

    </div>
    
    <%@ include file="footer.jsp"%>


    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
   <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  </body>
</html>