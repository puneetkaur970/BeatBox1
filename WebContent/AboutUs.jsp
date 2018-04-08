<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css\bootstrap.min.css" >

    <title>About Us</title>
  </head>
  <body>
  
     <%@ include file="header.jsp" %>  
    
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
    <script src="js/popper.js" ></script>
    <script src="js/jquery-3.3.1.js"></script>
    <script src="js/bootstrap.js"></script>
  </body>
</html>