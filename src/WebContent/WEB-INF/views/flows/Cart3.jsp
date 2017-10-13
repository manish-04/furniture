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
    
$scope.data = [];
    
    $scope.total = 0;
    
    $http(	{
    			method: 'POST',
	      		url: '/furniture/getAllCartItems',
	      		 headers : {'Content-Type':'application/x-www-form-urlencoded'}
    			}).then(function(response){
			    	console.log(response.data);
			    
			    	$scope.data = response.data;
			    	
			    	for( var x = 0; x < $scope.data.length ; x++ )
			    	{
			    		$scope.total += $scope.data[x].pprice *  $scope.data[x].qty;
			    	}
			    	
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


<br>
<br>

<h1 style="margin: auto; width: 80%; text-align: center;">Invoice</h1>

<br>
<br>



<div class="row">
		<div class="col-sm-3"><h1>Shipping Address:</h1></div>
		<div class="col-sm-3"><h1>{{data[0].shipaddr}}</h1></div>
		<div class="col-sm-3"><h1>Billing Address:</h1></div>
		<div class="col-sm-3"><h1>{{data[0].billaddr}}</h1></div>
	</div>


<br>
<br>


<br>
<br>

<h1 style="margin: auto; width: 80%; text-align: center;">Total:</h1>
<h1 style="margin: auto; width: 80%; text-align: center;">{{total}}</h1>


<br>
<br>
      
         <a href="${flowExecutionUrl}&_eventId=submitBillingAndShipping" class="btn btn-primary" style="margin-left:50px;">Previous</a>
		 <a href="${flowExecutionUrl}&_eventId=confirmOrder" class="btn btn-primary" style="float:right; margin-right:50px;">Next</a>
		 
		 <br>
<br>
<br>
<br>


<table class="table table-striped">

	<thead>
		<tr>
		<th>Name</th>
		<th>Description</th>
		<th>Category</th>
		<th>Image</th>
		<th>Qty</th>
		<th>Price</th>
		<th>Sub-Total</th>

		</tr>
	</thead>
	
	<tbody>
		<tr ng-repeat="x in data">
		<th>{{x.pname}}</th>
		<th>{{x.pdesc}}</th>
		<th>{{x.pcat}}</th>
		<th><img src='{{x.pimg}}' width="100"></th>
		<th>{{x.qty}}</th>
		<th>{{x.pprice}}</th>
		<th>{{x.pprice * x.qty}}</th>
		</tr>
	</tbody>

</table>



<br>
<br>
<br>
<br>

<h1 style="margin: auto; width: 80%; text-align: center;">Total:</h1>
<h1 style="margin: auto; width: 80%; text-align: center;">{{total}}</h1>

<br>
<br>
<br>
		 
</body>
</html>