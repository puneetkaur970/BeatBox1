<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css" >
    <link rel="stylesheet" type="text/css" href="open-iconic-master/font/css/open-iconic-bootstrap.css">
    <link href="https://fonts.googleapis.com/css?family=Pacifico" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    
    

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
    <script src="js/popper.js" ></script>
    <script src="js/jquery-3.3.1.js"></script>
    <script src="js/bootstrap.js"></script>
  </body>
</html>