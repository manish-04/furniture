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

	<h1 style="margin: auto; width: 80%; text-align: center;">View Categories</h1>

	<br>
		
	<table class="table table-striped" style="margin: auto; width: 80%;">
	
		<thead>
			<tr>
			<th>Name</th>
			<th>Description</th>
			<th>View</th>
			<th>Update</th>
			<th>Delete</th>
			</tr>
		</thead>
		
		<tbody>
			<c:forEach items="${categoriesdata}" var="x">
			<tr>
			<td>${x.getName()}</td>
			<td>${x.getDescription()}</td>
			<th><a href="ViewOneCategory/${x.getId()}" class="btn btn-primary">View</a></th>
			<th><a href="UpdateOneCategories/${x.getId()}" class="btn btn-success">Update</a></th>
			<th><a href="DeleteOneCategories/${x.getId()}" class="btn btn-danger">Delete</a></th>
			</tr>
			</c:forEach>
		</tbody>
	
	</table>

</body>
</html>