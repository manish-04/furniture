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
table, th, td, tr 
{
    border-style: double;
}
</style>
</head>
<body>

<br>

	<h1 style="margin: auto; width: 80%; text-align: center;">View One Category</h1>
	
	
	

	
	<a href="${pageContext.request.contextPath}/UpdateOneCategories/${categorydata.getId()}" class="btn btn-success" style="margin-left: 127px;">Update</a>
	<a href="${pageContext.request.contextPath}/DeleteOneCategories/${categorydata.getId()}" class="btn btn-danger" style="margin-left: 10px;">Delete</a> 
	<table class="table table-striped" style="margin: auto; width: 80%;">
	<a href="${pageContext.request.contextPath}/ViewCategories"  class="btn btn-info" style= "margin-left: 678px;">Back To Home Page</a>

	<br>
		<thead>
			<tr>
	
			<th>Name</th>
			<th>Description</th>
						
			</tr>
		</thead>
		
		<tbody>
			<tr>

			<td>${categorydata.getName()}</td>
			<td>${categorydata.getDescription()}</td>
			
			</tr>
			
		</tbody>
	
	</table>
	
	<br>
	
	

</body>
</html>