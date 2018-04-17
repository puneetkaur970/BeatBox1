<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Header</title>
<style>
	.zoom {
	    
	    transition: transform .2s; /* Animation */
	    
	}

	.zoom:hover {
		   transform: scale(1.25); /* (150% zoom - Note: if the zoom is too large, it will go outside of the viewport) */
	}
	</style>
</head>
<body>
<header>

      
      <!--This constitutes our navigation pane -->
      <nav class="nav bg-dark navbar-dark navbar-expand-md">

        <div class="container ">

         <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#myTogglerNav" aria-control="myTogglerNav" aria-expanded="false" aria-label="Toggle navigation"> <span class="navbar-toggler-icon"></span><span>BeatBox</span></button>

         

          <div class="collapse navbar-collapse" id="myTogglerNav">
            <div class="navbar-nav ">  
              <!--We create a link to home page -->
              <a class="navbar-brand "  href="home"><img src="images/logo.svg" alt="logo " style="width: 60px;"></a>

              <a class="nav-item nav-link m-3 mx-4" href="home" target="_self" >Home</a>
              <a class="nav-item nav-link m-3 mx-4" href="AboutUs.jsp" target="_self" >About Us</a>
          
              <!--We create a search box using the form  -->

              <form  id="searchForm" class="form-inline mx-4" role="search" method="get" action="search" >
                <div class="input-group">
                  <label class="sr-only" for="search">Search</label>
                  <input class="form-control " id="search" type="search" name="search" size="30" placeholder="Enter Track/Album/Artist name">
                  <div class="input-group-append"></div>
                  <button class="btn btn-outline-light" type="submit" value="search">Go</button>
                </div>
              </form>
          
              
              <a class="nav-item nav-link m-3 mx-4" href="profileDetails">Profile</a>
          
            </div>
           </div> 
        </div>
      </nav>
    </header>
</body>
</html>