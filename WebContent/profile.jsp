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
    <link rel="stylesheet" href="css/bootstrap.min.css" >
   

    <title>User Profile</title>
  </head>
  <body>
	
	<!-- importing the header.jsp using jstl and other tags -->
	<jsp:include page="header.jsp"></jsp:include>
	
	<% 
		if(request.getAttribute("subscriptionStatus")!=null){ 
	%>
	<h3 class="text-center m-3"><%=request.getAttribute("subscriptionStatus") %></h3>
	
	<%
	}
	%>	
	
	<jsp:useBean id="user" scope="request" type="com.test.beans.User"></jsp:useBean>

    <div class=" container text-center m-5">
         <img src="images/userImages/user.jpg" class="img-fluid rounded-circle m-3" alt="User Image" max-width: 100%;  height: auto; style="width:200px" > 
      
      
        <br>
        <div class="container m-5">
        <table class="table" >
       
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
    <script src="js/popper.js" ></script>
    <script src="js/jquery-3.3.1.js"></script>
    <script src="js/bootstrap.js"></script>
  </body>
</html>