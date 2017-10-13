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
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
</head>
<script>

var app = angular.module("myApp", []).controller("myCtrl", function($scope,$http) {
   
    
   $scope.data=[];
    
    $http(	{
    			method: 'POST',
	      		url: '/furniture/DeleteCartItems',
	      		 headers : {'Content-Type':'application/x-www-form-urlencoded'}
    			}).then(function(response){
			    	console.log(response.data);
			    
			    	
			    	
    			});
    
    $scope.Delete=function(arg){
    	
    	alert(arg);
    	
    	var json={"id":arg};
    	
    	console.log( JSON.stringify(json) );
    	
    	$http(	{
			method: 'POST',
      		url: '/furniture/deletefromcart',
      		data:JSON.stringify(json),
      		 headers : {'Content-Type':'application/json'}
			}).then(function(response){
		    	console.log(response.data);
		    
		    	//Fetch Again
		    	$http(	{
	    			method: 'POST',
		      		url: '/furniture/getAllCartItems',
		      		 headers : {'Content-Type':'application/x-www-form-urlencoded'}
	    			}).then(function(response){
				    	console.log(response.data);
				    
				    	$scope.data = response.data;
				    	
	    			});
		    	
			});
    	
    }
    
});


</script>
<body ng-app="myApp" ng-controller="myCtrl">
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#">WebSiteName</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#">Home</a></li>
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">Page 1 <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">Page 1-1</a></li>
            <li><a href="#">Page 1-2</a></li>
            <li><a href="#">Page 1-3</a></li>
          </ul>
        </li>
        <li><a href="#">Page 2</a></li>
        <li><a href="#">Page 3</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
        <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
      </ul>
    </div>
  </div>
</nav>
<h1 style="margin:auto; text-align:center;"> Thank You </h1>
<br>
<br>
<br>
<br>







<a href="ViewProduct/" class="btn btn-success" style=" float:left; margin-left:50px; margin-top:45px">Buy More</a>


<h1 style="margin: auto; width: 80%; text-align: center;">Your Order is confirmed</h1>
      
         <a href="${pageContext.request.contextPath}/" class="btn btn-primary" style="margin-left:50px;">Previous</a>
		 
</body>
</html>