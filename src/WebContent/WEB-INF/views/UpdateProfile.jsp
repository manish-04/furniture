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

</head>
<body>


	<br>

	<h1 style="margin: auto; width: 80%; text-align: center;">Update Profile</h1>

	<br>
	
	<form action="${pageContext.request.contextPath}/UpdateProfileToDB" method="post" style="margin: auto; width: 80%; text-align: center;">
	
		<input type="hidden" value="${profiledata.getId()}" name="profile" >
		
		<br>
		
		<input type="text" placeholder="UserName" value="${profiledata.getUsername()}" class="form-control" name="profile">
		
		<br>
		
		<input type="email" placeholder="Email" value="${profiledata.getEmail()}" class="form-control" name="profile">
		
		<br>
		
		<input type="password" placeholder="Password" value="${profiledata.getPassword()}" class="form-control" name="profile">
		
		<br>
		
		<input type="number" placeholder="Phone" value="${profiledata.getPhone()}" class="form-control" name="profile">
		
		<br>
		
		<textarea placeholder="Address" class="form-control" name="profile">${profiledata.getAddress()}</textarea>
		
		<br>
		
		<input type="submit" value="Update" class="btn btn-primary">
	
	</form>

</body>
</html>