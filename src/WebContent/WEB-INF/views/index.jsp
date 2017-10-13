<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page import="org.springframework.security.core.Authentication"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<style>
    /* Remove the navbar's default rounded borders and increase the bottom margin */ 
    .navbar {
      margin-bottom: 50px;
      border-radius: 0;
    }
    
    /* Remove the jumbotron's default bottom margin */ 
     .jumbotron {
      margin-bottom: 0;
    }
   
    /* Add a gray background color and some padding to the footer */
    footer {
      background-color: #A9A9A9;
      padding: 25px;
    }
  </style>

</head>
<body style="background: -webkit-linear-gradient(top, hsla(206,34%,86%,1) 0%,hsla(199,12%,40%,1) 100%);">



<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#" style="font-size:45px;font-weight:bold;font-family:Algerian;color:red">furniture</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="${pageContext.request.contextPath}/index">Home</a></li>
        <li><a href="${pageContext.request.contextPath}/ViewProduct"style="font-size:25px;font-weight:bold;font-family:Algerian;color:white">Products</a></li>

        
      </ul>
      <ul class="nav navbar-nav navbar-right">
      <%
      Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    if (auth != null && !auth.getName().equals("anonymousUser"))
	    {  
      %>
      	<li><a href="logout"><span></span> Logout</a></li>
      	<li><a href="cart"><span class="glyphicon glyphicon-shopping-cart"></span> Cart</a></li>
        <%
	    }
	    else
	    {
        %>
        <li><a href="AddProfile"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
        <li><a href="cart"><span class="glyphicon glyphicon-shopping-cart"></span> Cart</a></li>
        <li><a href="cart"><span class="glyphicon glyphicon-shopping-cart"></span> Login</a></li>
        <%
	    }
        %>
      </ul>
    </div>
  </div>
</nav>

<!----CAROUSEL---->
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
	  <li data-target="#myCarousel" data-slide-to="3"></li>
	  <li data-target="#myCarousel" data-slide-to="4"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" style="height:500px; margin-top:50px;">
      <div class="item active">
        <img src="resources/images/pic72.jpg" alt="Shirts" style="width:100%;">
      </div>

      <div class="item">
        <img src="resources/images/pic77.jpg" alt="Formals" style="width:100%;">
      </div>      
	
		<div class="item">
        <img src="resources/images/pic73.jpg" alt="Outing" style="width:100%;">
      </div>
	  
	  <div class="item">
        <img src="resources/images/pic79.jpg" alt="Bussiness" style="width:100%;">
      </div>
	  
	  <div class="item">
        <img src="resources/images/pic71.jpg" alt="Bussiness" style="width:100%;">
      </div>


    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
  <br>
  <br>

<div class="" style="background: -webkit-linear-gradient(top, hsla(206,34%,86%,1) 0%,hsla(199,12%,40%,1) 100%);" >
  <div style="text-align: center;background-color: red" class="panel-heading">
  <p class="panel-title" style="font-size:45px;font-weight:bold;font-family:Algerian;">Brands & Categories</p>
  </div>
  
<br>

<div class="row" style=" width:91%; margin-left:5%;">
	<div align="center" class="col-sm-4">
      <a href="#"><img src="resources/images/pc1.jpg" class="img-responsive indexcatimage"></a>
    </div>
    
	<div align="center" class="col-sm-4">
      <a href="#"><img src="resources/images/pc2.jpg" class="img-responsive indexcatimage"></a>
    </div>
	
	<div align="center" class="col-sm-4">
      <a href="#"><img src="resources/images/pc1.jpg" class="img-responsive indexcatimage"></a>
    </div>
	
</div>

<br>
<br>

<div class="row" style=" width:91%; margin-left:5%;">
	<div align="center" class="col-sm-4">
      <a href="#"><img src="resources/images/pc1.jpg" class="img-responsive indexcatimage"></a>
    </div>
    
	<div align="center" class="col-sm-4">
      <a href="#"><img src="resources/images/pc2.jpg" class="img-responsive indexcatimage"></a>
    </div>
	
	<div align="center" class="col-sm-4">
      <a href="#"><img src="resources/images/pc1.jpg" class="img-responsive indexcatimage"></a>
    </div>
	
</div>
</div>

<nav class="navbar navbar-inverse" style="margin-bottom:0; margin-top:20px">
  
 
    
      <ul class="nav navbar-nav">
        
        <li><a href="${pageContext.request.contextPath}/ContactUs">Contact Us</a></li>
        <li><a href="${pageContext.request.contextPath}/AboutUs">About Us</a></li>
        
	</ul>
   
 
</nav>

</body>
</html>