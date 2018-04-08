<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.test.beans.Tracks"%>
<%@ page import="java.util.List"%>

	
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css" >
   

    <title>Search Results</title>
  </head>
  <body>
      
     
      
      <div class="container" id="trackslist">
           <h3>List of tracks related to search : </h3>
      		<div  class="container" style="border:thin"> 
     
  
          
        <table class="table table-bordered table-striped table-hover">
          <thead class="thead-dark">
            <tr>
              <th scope="col"> Track id:</th>
              <th scope="col">Track Name </th>
              <th scope="col"> Hits</th>
            </tr>
          </thead>

        
          <tbody>
          
            <% 
		 List<Tracks> TrackList= (ArrayList)request.getAttribute("TrackList");
		Iterator<Tracks> iterator= TrackList.iterator();
		while(iterator.hasNext()){
			Tracks track=iterator.next();
			
		%>
            <form>
	             <tr id="TrackContainer">
	              <td><%=  track.getTrackId() %></td>
	              <td><%= track.getTrackName() %></td>
	              <td><%= track.gethits() %></td>
	            </tr>
            </form>
         
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
            </tr>
          </thead>

          <!-- Get playlist names here
          <tbody>
            <tr>
              <td><img src="" class="img-thumbnail rounded-circle"></td>
              <td></td>
              <td></td>
            </tr>
          </tbody>

        -->
          
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
            </tr>
          </thead>

          <!-- Get playlist names here
          <tbody>
            <tr>
              <td><img src="" class="img-thumbnail rounded-circle"></td>
              <td></td>
              <td></td>
              <td></td>
            </tr>
          </tbody>

        -->
          
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