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

    <title>About Us</title>
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
      <article>
        <h1>About Us</h1>
        <p><em>BeatBox</em> is a project created by
        students of MCA Sem-4 solely for the purpose of education. We aim to create a small application that renders music as well as allows user to create their own personalised account and have their favourite music into playlists. We aim to resemble the working music websites currently available in the market.</p>

        <p>We attribute the successful completion of our project to the Department faculty members, Dr.Sujoy Das (Faculty-co-ordinator for DBMS) Dr.Sanjay Sharma Sir , (Project mentor) and Dr. Jay K Jain (Project Co-mentor).</p>
      </article>

      <br>
<!--Team details:... 2-->
      <article>
        <style type="text/css">
          .figure-img{
            max-width: 200px;
            
          }

        </style>

        <h1>Our Team</h1>
        <!--THe profile of author 2-->
        <div class="row">
          <div class= col>
        <figure class="figure text-center">
          <img class="rounded-circle figure-img" src="images\author1.jpg" alt="Picture of Puneet">
          <figcaption class="figure-caption"><address >Puneet Kaur (Team Member)<br>Bhopal,India</address></figcaption>
          <p>Puneet Kaur is a full-stack developer in the team of the two in this project. She is the post-graduate student, currently majoring in Computer Science at the prestigous National Institute of Technology,Bhopal. Among her interests are Programming, Databases, and Networks. Her hobbies are reading, photography, sports.</p>
          </div>
        <!-- Add code here to follow on social media-->
          
        <!--THe profile of author 2-->
        <div class="col">
        <figure class="figure text-center">
          <img  class="rounded-circle figure-img"  src="images\author2.jpg" alt="Picture of Puneet">
          <figcaption class="figure-caption"><address>Ankita Buch (Team Member)<br> Bhopal,India</address></figcaption>
          <p>Ankita is a full-stack developer in the team of the two in this project. She is the post-graduate student, currently majoring in Computer Science at the prestigous National Institute of Technology,Bhopal. Among her interests are Programming, Operating Systems and Web Development. Her hobbies are social networking, photography, sports.</p>
          <!-- Add code here to follow on social media-->
          
        </figure>
      </div>
      </div>
      </article>
    </div>
    <%@ include file="footer.jsp" %>



    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  </body>
</html>