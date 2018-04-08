<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="com.test.beans.Playlist" %>    
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css" >
   

    <title>Playlist Tracks</title>
  </head>
  <body>
    
    <div class="container">

      <h3> Here is list of the tracks in your playlists: </h3>
      <br>

      <div  class="container" style="border:thin">        
        <table class="table table-bordered table-striped table-hover">
          <thead class="thead-dark">
            <tr>
              <th scope="col"> No.</th>
              <th scope="col">Playlist Name </th>
              
            </tr>
          </thead>
<%
	List<Playlist> playlists= request.getAttribute("playlists");
	Iterator<Playlist> iterator= playlists.iterator();
	while(iterator.hasNext()){
	Playlist pl =iterator.next();
%>
          
          <tbody>
            <tr>
              <td><% pl.getPlaylistName() %></td>
              <td></td>
              <td></td>
            </tr>
          </tbody>

       
          
        </table>
      </div>
    </div>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="js/popper.js" ></script>
    <script src="js/jquery-3.3.1.js"></script>
    <script src="js/bootstrap.js"></script>
  </body>
</html>