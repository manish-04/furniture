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
    /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
    .row.content {height: 550px}
    
    /* Set gray background color and 100% height */
    .sidenav {
      background-color: black;
      height: 100%;
      border-radius:0px;
    }
        
    /* On small screens, set height to 'auto' for the grid */
    @media screen and (max-width: 767px) {
      .row.content {height: auto;} 
    }
  </style>

</head>
<body style="background: #87CEEB">



<div class="container-fluid" style="color: 	#4169E1">
  <div class="row content">
    <div class="col-sm-3 sidenav hidden-xs">
      <h2>Dashboard</h2>
      <ul class="nav nav-pills nav-stacked">

         <li class="active"><a href="${pageContext.request.contextPath}/AddProduct">Add Product</a></li>
         <li class="active"><a href="${pageContext.request.contextPath}/ViewProduct">View Product</a></li>
        <li class="active"><a href="${pageContext.request.contextPath}/AddProfile">Add Profile</a></li>
        <li class="active"><a href="${pageContext.request.contextPath}/ViewProfile">View Profile</a></li>
       <li class="active"><a href="${pageContext.request.contextPath}/AddCategories">Add Categories</a></li>
       <li class="active"><a href="${pageContext.request.contextPath}/ViewCategories">View Categories</a></li>

      </ul><br>
    </div>
    <br>
    
    <div class="col-sm-9" >
      <div class="well"style="background: black;border-radius:20px">
        <a href="${pageContext.request.contextPath}/index" style="font-size:20px">Home</a>
       <a href="#" style="font-size:20px;margin-left: 300px">Logout</a>
      </div>
 
    </div>
  </div>
</div>


</body>
</html>