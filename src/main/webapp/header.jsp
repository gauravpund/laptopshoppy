<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Home</title>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>		
		<%@include file="component/common-js-css.jsp" %>
		<link rel="stylesheet" type="text/css" href="landingpage.css"></link>
		<style>
		
		</style>
	</head>
	<body class="bg-light">
		<header class="p-1 bg-light ">
        <div class="container-fluid">
            <div class="row text-center" style="height:10%;">
                <div class="col-md-3 d-md-block">
                    <p><i class="fa fa-envelope text-dark ml-3"></i><span class="text-dark d-none d-md-inline-block">intakelaptophome@gmail.com</span></p>
                </div>
                <div class="col-md-3 d-md-block">
                    <p><i class="fa fa-map-marker text-dark"></i><span class="text-dark">28 Old Street, Mumbai, India</span></p>
                </div>
                <div class="col-md-3 d-none d-md-block text-dark">
                    <p><i class="fa fa-phone fa-1x"></i><span class="text-dark d-none d-md-inline-block">Call Us On: 0241 5546 2130</span></p>
                </div>
                <div class="col-md-3 d-none d-md-block">
                    <ul class="social_media text-center pb-2">
                        <li><i class="fab fa-facebook" style="color:black;" title="Facebook"></i></li>
                        <li><i class="fab fa-twitter" style="color:black;" title="Twitter"></i></li>
                        <li><i class="fab fa-linkedin" style="color:black;" title="Linked In"></i></li>
                        <li><i class="fab fa-instagram" style="color:black;" title="Instagram"></i></li>
                    </ul>
                </div>				
            </div>
        </div>
    </header>

</body>
</html>