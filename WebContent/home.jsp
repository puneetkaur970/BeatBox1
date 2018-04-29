<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    
    <title>BeatBox</title>
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
    <div class="container">

      <h2 class="display-1 d-none d-sm-block text-center"> Welcome to Beatbox!</h2>
      <br>

      <div class="card "> 
        <div class="card-body row text-center">
          <figure class="col  figure" >
            <a href="#"><img class="zoom" src="images/weeklyhits.jpg" style="width: 200px; height: 200px" class=" figure-img "></a>
            <figcaption class="m-1"><h4 class="card-title">Weekly hits</h4></figcaption>
          </figure>

          <figure class="col figure">
            <a href="LanguageTracks?lang=English"><img class="zoom" src="images/angrejibeats.jpg" style="width: 200px; height: 200px" class="figure-img "></a>
            <figcaption class="m-1" ><h4>Angreji Beats</h4></figcaption>
          </figure>

          <figure class="col figure">
            <a href="CategoryTracks?category=classic"><img class="zoom" src="images/Classical Music.jpg" style="width: 200px; height: 200px;" class="figure-img"></a>
            <figcaption class="m-1"><h4>Classical Music</h4></figcaption>
          </figure>

          <figure class="col figure">
            <a href="LanguageTracks?lang=punjabi"><img class="zoom" src="images/editorspicks.jpg" style="width: 200px; height: 200px"  class="figure-img"></a>
            <figcaption class="m-1"><h4>Editors Picks</h4></figcaption>
          </figure>
        </div>
      </div>
      <br>

      <div class="card "> 
        <div class="card-body row text-center">
          <figure class="col figure" >
            <a href="CategoryTracks?category=party"><img class="zoom" src="images/weddingsongs.jpg" style="width: 200px; height: 200px" class=" figure-img "></a>
            <figcaption class="m-1"><h4 class="card-title">Wedding Songs</h4></figcaption>
          </figure>

          <figure class="col figure">
            <a href="ArtistTracks?artistId=4"><img class="zoom" src="images/latajitracks.jpg" style="width: 200px;height: 200px" class="figure-img "></a>
            <figcaption class="m-1"><h4>Lata Ji hits</h4></figcaption>
          </figure>

          <figure class="col figure">
            <a href="CategoryTracks?category=jazz"><img class="zoom" src="images/jazzmusic.jpg" style="width: 200px;height: 200px" class= "figure-img"></a>
            <figcaption class="m-1"><h4>Hip Hop</h4></figcaption>
          </figure>

          <figure class="col figure">
            <a href="CategoryTracks?category=romantic"><img class="zoom" src="images/romantic.jpg" style="width: 200px; height: 200px"  class="figure-img"></a>
            <figcaption class="m-1"><h4>Love Season</h4></figcaption>
          </figure>
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