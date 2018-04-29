<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>

<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.test.beans.Tracks"%>
<%@ page import="com.test.beans.Artists" %>
<%@ page import="com.test.beans.Albums" %>
<%@ page import="java.util.List"%>
<%@ page import="com.test.beans.SubscriptionPlan" %>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <title>Subscription Plans</title>
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
      <table class="table table-dark m-3">
        <thead>
          <tr>
            <th scope="col"> Subscription Id:</th>
            <th scope="col"> Plan </th>
            <th scope="col"> Cost </th>
            <th scope="col"> Validity</th>
            <th scope="col">Song's you may download</th>
            <th scope="col"> Click to subscribe</th>
          </tr>
        </thead>
        <tbody>

          <!-- THis template to fetch data from database -->

	<%
		List<SubscriptionPlan> planList= (ArrayList)request.getAttribute("SubscriptionPlanList");
		Iterator<SubscriptionPlan> iterator= planList.iterator();
		
		while(iterator.hasNext()){
			SubscriptionPlan p= iterator.next();
		
	%>

          <tr>
            <td><%= p.getSubscriptionId() %> </td>
            <td> <%= p.getPlanName() %></td>
            <td><%= p.getCost() %></td>
            <td> <%= p.getValidity() %></td>
            <td> <%= p.getSongsOffered() %></td>
            <td><a class= "btn btn-primary" href="subscribe?subscriptionId=<%=p.getSubscriptionId() %>">Subscribe</a></td>
          </tr>

       
      <%
		}
      %>    
          
        </tbody>
      </table>



<%@ include file="footer.jsp" %>
   

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
   <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  </body>
</html>