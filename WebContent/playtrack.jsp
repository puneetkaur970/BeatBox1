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
    <link rel="stylesheet" href="css/bootstrap.min.css" >
   

    <title>PLay track</title>
  </head>
  <body>
  
    <%@ include file="header.jsp"%>
    
    
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
      
      <a  class="btn btn-primary" href=" <%= trackdetails.track.getTrackLink() %>"  role="button" download >Download audio </a>

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
 	if(request.getAttribute("playlists")!= null){
 		
 	List<Playlist> playlists= (List<Playlist>)request.getAttribute("playlists");
 	Iterator<Playlist> iterator = playlists.iterator();
 	
 	while(iterator.hasNext()){
 		Playlist p= iterator.next();
 		
 		%>
	
    <input type="radio"
           name="playlistId" value="<%= p.getPlaylistId() %>">
    <label for="contactChoice1"><%= p.getPlaylistName() %></label><br>
    
       <%
     	}
 	}
 	else{
 		%>
 		<strong> Please login first!! </strong>
 		<% 
 	
 	}
 %>
  </div>
  <div>
   <%
 	if(request.getAttribute("playlists")!= null){
 		
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
    <script src="js/popper.js" ></script>
    <script src="js/jquery-3.3.1.js"></script>
    <script src="js/bootstrap.js"></script>
  </body>
</html>