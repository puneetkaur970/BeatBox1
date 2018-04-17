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
    <link rel="stylesheet" href="css/bootstrap.min.css" >
   

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
    <script src="js/popper.js" ></script>
    <script src="js/jquery-3.3.1.js"></script>
    <script src="js/bootstrap.js"></script>
  </body>
</html>