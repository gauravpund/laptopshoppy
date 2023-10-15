
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>User Login</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	
	<style>		
		a {
		  text-decoration: none;
		}
		body {
		  background-repeat: no-repeat;
		}
		label {
		  font-family: "Raleway", sans-serif;
		  font-size: 13pt;
		}
		#forgot-pass {
		  font-family: "Raleway", sans-serif;
		  font-size: 10pt;
		  margin-top: 3px;
		  text-align: right;
		}
		.show-pass {
		  font-family: "Raleway", sans-serif;
		  font-size: 10pt;
		  margin-top: 3px;
		  text-align: left;
		}
		
	</style>
	
	
</head>
	<body>
	
		<%@include file="navbar.jsp" %>
	
	  <div class="container">
	  	<div class="row justify-content-center mt-5">
	    	<div class="col-md-6">
	        	<div class="card">
	            	<div class="p-2  bg-white text-dark text-center">
	                	<h3 class="font-weight-bold">Login</h3>
	                </div>
	                    
	                <%@include file="component/message.jsp" %>
		      		
		      		<form action="LoginServlet" method="get" class="form">	  
		      			<div class="container"><hr></div>   		
			      		<div class="p-3">	      	 			
				     		<div class="form-group mt-3">
									
									<input type="text" name="username" class="form-control" id="name" placeholder="user@gmail.com">
							</div>
							<div class="form-group">
									
									<input type="password" name="userpassword" class="form-control" id="myInput" placeholder="Password">
							</div>
							<a href="forgot-password.jsp">
          						<legend id="forgot-pass">Forgot password?</legend>
        					</a>
						</div>					
						 <div class="card card-footer bg-white">
					        <button class="btn btn-primary">Login</button>
					        <button class="btn  mt-3" type="reset">Clear</button>
					        <p class="mt-3 text-center">Don't have an account?<a href="register.jsp"> Register here</a></p>
					     </div>		      	
		      		</form>
		      </div>
		    </div>  
	    </div>
  	</div>
  		<%@include file="footer.jsp" %>
	</body>
</html>