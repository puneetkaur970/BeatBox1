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
   
     <title>SignUp/Login form</title>
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

    <!-- Buttons on the top of screen-->

    <div class="well container" style="position: absolute;
              top: 15%;
              left: 25%;
              width: 50em;
              margin-left: -10px;
              margin-top: 10px;"  >
      <ul class="nav nav-tabs">
        <li class="active"><a class="btn btn-primary m-1 mb-3" href="#login" data-toggle="tab">Log In </a></li>
        <li><a class="btn btn-primary m-1 mb-3" href="#signup" data-toggle="tab">Sign Up</a></li>
       
     </ul>

      <!-- Buttons on the top of screen ends here-->


      
        <div id="myTabContent" class="tab-content" style="max-width:400px;">

          <div class="tab-pane active in" id="signup">
        <!--For the signup form-->
        
       			 <div>
	                <form  class="form-group" action="UploadServlet" method="post" enctype= "multipart/form-data" >
	                	<label class="form-control-label" for="profileimage"> Upload your profile picture:</label>
	                	<input class="form-control" type="file" name="profileimage" id="profileimage" autofocus required>
	                	<input class="btn btn-secondary m-2" type="submit" value="Upload">
	               </form>
               </div>
        
        <% if(request.getAttribute("fileUploadStatus")!=null){ %>
        
        	<span><%=request.getAttribute("fileUploadStatus") %></span>
        	
        	<% } %>
        
          <form action="RegisterUser" id="tab" autocomplete method="post">
            
            <fieldset class="form-group ">
              <%
              String msgr= (String)request.getAttribute("infoMessage");
              
              %>
              
              <h3><% if(msgr!=null) { %> <%=msgr %> <% } %></h3>
				
			<input type="hidden" name= "imgpath" value="<%= request.getAttribute("fileName") %>" >	
				
              <div >
                <label for="emailId"> Email:</label>
                <input class="form-control" type="email" name="email"  id="emailId" placeholder="Enter your email" required >
              </div>

              <div>
                <label for="password" > Password: </label>
                <input class="form-control"type="password" name="password"  id="password" pattern="^\S{6,}$" onchange="this.setCustomValidity(this.validity.patternMismatch ? 'Must have at least 6 characters' : ''); if(this.checkValidity()) form.confirmPassword.pattern = this.value;" placeholder="Enter Password" required>
              </div>

              <div>
                <label for="confirmPassword" > Confirm Password: </label>
                <input class="form-control" type="password" name="confirmPassword" id="confirmPassword" pattern="^\S{6,}$" onchange="this.setCustomValidity(this.validity.patternMismatch ? 'Please enter the same Password as above' : '');"placeholder="Re-enter Password" required>
					
              </div>

            </fieldset>
        
              <fieldset  class=" form-group">
                

      
                <div>
                  <label class="form-control-label" for="firstname" > First Name: </label>
                  <input class="form-control" type="text" name="fname" id="firstname" placeholder="Enter first name" required>
                </div>
                <div>
                  <label class="form-control-label" for="lastname" > Last Name: </label>
                  <input class="form-control" type="text" name="lname" id="lastname" placeholder="Enter last name" required>
                </div>

                <div>
                  <label class="form-control-label" for="dob" > Birth Date: </label>
                  <input class="form-control" type="date" name="dob" id="dob" placeholder="Enter date of Birth">
                </div>
                <div>
                  <label class="form-control-label" for="gender" > Gender: </label>
                  <select class="form-control" type="text" name="gender" id="gender" list="genders" placeholder="Female">
                    <option id="genders">Choose</option>
                      <option value="M">Male</option>
                      <option value="F">Female</option>
                      <option value="O">Other</option>
                    
                  </select>
                </div>
                <div>
                  <label class="form-control-label"for="aboutyou" > About you: (limit: 200 characters)</label>
                  <textarea class="form-control" rows="3" maxlength=200 name="aboutyou" id="aboutyou" placeholder="About you..."></textarea>
                </div>
                
              </fieldset> 
            <button class="btn btn-primary mb-3" type="submit" >Submit</button>
          </form><!-- personal details section ends here-->
        </div>
             
          
          <!--For the login form-->
        <div class="tab-pane fade" id="login">
          <form  id="tab2" autocomplete action="login" method="post">
            
            <fieldset class=" form-group">
            
            <%
            String msg= (String)request.getAttribute("Message");
            
            %>
            
            <h3> <% if(msg!=null) { %> <%=msg %> <% } %></h3>
              
              <div >
                <label for="emailId"> Email:</label>
                <input class="form-control" type="email" name="email" id="emailId" placeholder="Enter your email" required>
              </div>

              <div>
                <label for="password" > Password: </label>
                <input class="form-control"type="password" name="password" id="password" placeholder="Enter Password" required>
              </div>

            </fieldset>
            <button class="btn btn-primary mb-3" type="submit">Log In</button>
            
          </form>
        </div>
        

  </div>
 </div>
    
          
          
    <!-- Optional JavaScript -->
 <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  </body>
</html>