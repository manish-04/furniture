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
	.div {
    
    height: 170px;
    padding: 15px;
	border-radius:30px;
    background-color:black;
    box-shadow: 10px 10px 5px blue;
}
.text{
	    height:180px;font-size:20px;
		color:black;
		background-color;
		text-align:justify;
		
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
      <a class="navbar-brand" href="#" style="font-size:45px;font-weight:bold;font-family:Algerian;color:red">furnituer</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="index">Home</a></li>
        <li><a href="#">Products</a></li>
        <li><a href="#">Deals</a></li>
        <li><a href="#">Stores</a></li>
        
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#"><span class="glyphicon glyphicon-user"></span> Your Account</a></li>
        <li><a href="cart"><span class="glyphicon glyphicon-shopping-cart"></span> Cart</a></li>
      </ul>
    </div>
  </div>
</nav>
                  <div class="row">
                    <div class="col-sm-3"></div>
                    <div class="col-sm-6">					
					<h1 style="text-align:center; font-size:30px;color:red;font-family:Bernard MT Condensed"  class="div">OUR MISSION
					<p style="font-size:28px;color:white;margin-top:16px;">To provide the most actionable furniture store</p></h1></div>						 					
                    <div class="col-sm-3"></div>
					</div>
					
					<div class="row" >
                    <div class="col-sm-3"></div>
                    <div class="col-sm-6">
					<h1 style="text-align:center; font-size:50px;color:black">about Us </h1>
                             <p class="text" >We believe in the best way to deliver a great user 
					                experience is by deeply understanding what people want
									and love. Then deliver the best product, and content that are
                    most helpful, relevant and timely. That is what makes users happy and loyal. 
					We want our customers to be happy, so then our customers are happy and that makes us happy</P>
					</div>
					<div class="col-sm-3"> </div>
					</div>
					
					<br>

					
					<div style="margin:auto;margin-top:200px">
                          <h1 style="text-align:center; font-size:50px;color:black">Our Team </h1>
             <div class="selection"> 
            
                
                    <div class="col-sm-4">
                        <div class="img_holder banner"><img src="resources/images/images2.jpg" class="img-responsive" alt=""/>
						<h1 style="text-align:center; font-size:20px;color:black">Name:designation</h1>
						</div>
                        
                    </div>
                    <div class="col-sm-4 center-block">
                        <div class="img_holder banner"><img src="resources/images/images2.jpg" class="img-responsive" alt=""/>
						<h1 style="text-align:center; font-size:20px;color:black">Name:designation </h1>
						</div>
                        
                         </div>
                    <div class="col-sm-4">
					<div class="img_holder banner"><img src="resources/images/images2.jpg" class="img-responsive" alt=""/>
					<h1 style="text-align:center; font-size:20px;color:black"><p>Name:designation</p> </h1>
					</div>
                    </div>
                
            
        </div>
  </div>
</body>
</html>