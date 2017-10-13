<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

	<br>

	<h1 style="margin: auto; width: 80%; text-align: center;">View Product</h1>

	<br>
	
	<table class="table table-striped" style="margin: auto; width: 80%;">
	
		<thead>
			<tr>
			<th>Name</th>
			<th>Description</th>
			<th>Category</th>
			<th>Price</th>
			
			</tr>
		</thead>
		
		<tbody>
			<tr>
			<td>${productdata.getName()}</td>
			<td>${productdata.getDescription()}</td>
			<th>${productdata.getCategories()}</th>
			<th>${productdata.getPrice()}</th>
			</tr>
		</tbody>
	
	</table>
	
	
	
	<form action="${pageContext.request.contextPath}/AddCartToDB" method="post">
	
		<input type="hidden" value="${productdata.getId()}" name="id">
		
		<br>
		<br>
		<input type="number" placeholder="Quantity" class="form-control" name="quantity" style="margin: auto;  width: 10%; text-align: center;">
		<br>    
    	<button type="submit" class="btn btn-success" style=" float:left; margin-left:50px; margin-top:23px">AddToCart</button>	
	
	</form>
	
	
	
</body>
</html>