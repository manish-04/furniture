<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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

	<h1 style="margin: auto; width: 80%; text-align: center;">Add Profile</h1>

	<br>
	
	<form:form action="AddProfileToDB" method="post" style="margin: auto; width: 80%; text-align: center;" modelAttribute="profile">
	
		<form:input path="username" type="text" placeholder="UserName" class="form-control" name="profile"/>
		<%-- <form:errors path="username"/> --%>
		<br>
		
		<form:input path="email" type="email" placeholder="Email" class="form-control" name="profile"/>
	
		<br>
		
		<form:input path="password" type="password" placeholder="password" class="form-control" name="profile"/>
	
		<br>
		
		<form:input path="phone" type="number" placeholder="Phone" class="form-control" name="profile"/>
	
		<br>
		
		<form:textarea path="address" placeholder="Address" class="form-control" name="profile"></form:textarea>


     
      <h3>Select ROLE</h3>
        <form:select path="role">
			<option value="ROLE_USER">ROLE_USER</option>
			<option value="ROLE_SUPPLIER">ROLE_SUPPLIER</option>
		</form:select>
	    <form:errors path="role"/>
		
		<br>
		<input type="submit" value="Add" class="btn btn-danger">
	
	</form:form>
</body>
</html>