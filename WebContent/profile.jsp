<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="com.test.beans.*" %>
<%@ page import="java.util.*" %>    
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
   

    <title>User Profile</title>
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
	
	<!-- importing the header.jsp using jstl and other tags -->
	
	
	<% 
		if(request.getAttribute("subscriptionStatus")!=null){ 
	%>
	<h3 class="text-center m-3"><%=request.getAttribute("subscriptionStatus") %></h3>
	
	<%
	}
	%>	
	
	<jsp:useBean id="user" scope="request" type="com.test.beans.User"></jsp:useBean>

    <div class=" container text-center m-5">
         <img src="<%=user.getImgPath() %>" class="img-fluid rounded-circle m-1" alt="User Image" width="200" height="200" > 
      
      
        <br>
        <div class="container m-5">
        <table class="table"  >
       
        <tbody>

          <tr>
            <td> First Name : </td>
            <td> <%=user.getFirstName() %> </td>
          </tr>
			
			<tr>
            <td> LastName : </td>
            <td> <%=user.getLastName() %> </td>
          </tr>
			
           <tr>
            <td> Email: </td>
            <td><jsp:getProperty property="email" name="user" /> </td>
          </tr>

           <tr>
            <td> Gender: </td>
            <td><% if(user.getGender().equals("F")) { %> Female <%} else if(user.getGender().equals("M")){ %> Male <%} else %> Other </td>
          </tr>

           <tr>
            <td> Downloads:  </td>
            <td><jsp:getProperty property="downloadCount" name="user" /> </td>
          </tr>

           <tr>
            <td> About You: </td>
            <td><%=user.getAboutYou() %> </td>
          </tr>

        
        </tbody>
      </table>
      </div>


      <br>
  

      <strong> <br>If you haven't subscribed to a plan yet, Click on subscribe button.</strong><br>
      <a class="btn btn-primary m-2" href="SubscriptionPlan" role="button">Subscribe</a><br>
        
       <strong> Do you want to create your own playlist ?</strong><br> 
       <%
       if(request.getAttribute("createPlaylistStatus")!=null){
       %>
       <span><%= (String)request.getAttribute("createPlaylistStatus") %>!!</span><br>
       <%
       }
       %>
       <a class="btn btn-primary m-2" href="#playlistform" data-toggle="modal" role="button">Create Playlist</a><br>

        <strong> Do you want view your playlists ?</strong> <br>
       <a class="btn btn-primary m-2" href="#viewPlaylists"  data-toggle="modal" role="button">View Playlists</a><br>
       
       <strong> Do you want to log out ?</strong> <br>
       <a class="btn btn-primary m-2" href="logout"  role="button">Log Out</a><br>


  <div class="modal fade" id="playlistform" tabindex="-1" role="dialog" aria-labelledby="createPlaylistModal" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Create your playlist</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form action= "CreatePlaylist" method ="get">
          <label for="Playlistname">Enter playlist name: </label>
          <input type="text" id="Playlistname" name="playlistname">
          
        </form>
      </div>
      <div class="modal-footer">
        
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="viewPlaylists" tabindex="-1" role="dialog" aria-labelledby="createPlaylistModal" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Select playlist: </h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" id="">
       <form class="form text-align-left" action="ViewPlaylistsTracks" method="get"> 
       
  <div>

 <%
 	int hideSubmit=0;
 		
 	List<Playlist> playlists= (List<Playlist>)request.getAttribute("playlists");
 	Iterator<Playlist> iterator = playlists.iterator();
 	
 	if(!iterator.hasNext()){
 		hideSubmit=1;
 	}
 	while(iterator.hasNext()){
 		Playlist p= iterator.next();
 		
 		%>
	
    <input type="radio"
           name="playlistId" value="<%= p.getPlaylistId() %>">
    <label for="contactChoice1"><%= p.getPlaylistName() %></label><br>
    
       <%
     	}
 	
 	if(hideSubmit==1){
 		%>
 		<strong>You have no playlist!! Create a playlist first! </strong>
 		<% 
 	}
 	
 	
 	%>
 	
  </div>
  <div>
   <%
 	if(hideSubmit!=1){
 	 		
 	%>
    <button class="btn btn-primary" type="submit">View Playlist Tracks</button>
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
    
   

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
   <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  </body>
</html>