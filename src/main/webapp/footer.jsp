<%@page import="com.mypackage.dao.UserDao"%>
<%@page import="com.mypackage.entity.User"%>
<%@page import="java.util.List"%> 
        <%               	
    		User user2 = (User) session.getAttribute("userObject");	    		    	
		%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Footer</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
	<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
	
	<style>
		.social_media li{
				color:black;
				display: inline-block;
				list-style-type: none;
				margin: 5px;
			}
			
			.social_media li:hover{
				color:black;
				text-decoration: underline;
			}
			
			.social_media li:hover{
				transform: scale(1.3);
				
			}
			
			.social_media i:hover{
				transform: scale(1.4);
				color:orange;
			}
			i{
				margin-right: 10px;
			}
	</style>
</head>
<body>
	<footer class="bg-dark">
    <div class="mt-3 container">
        <div class="row mt-5">
            <div class="col-md-4 mt-4">
                <h4 class=" text-warning font-weight-bold">Quick Links</h4>
                <ul class="list-unstyled">
                    <li class="mt-3"><a href="index.jsp" style="color:white">
                    Home</a></li>
                    <li><a href="index.jsp#sectionId" style="color:white">
                    Products</a></li>
                    <li><a data-toggle="modal" data-target="#exampleModalCenter" href="" style="color:white">About us</a></li>
                    <li><a href="" style="color:white">Contact us</a></li>
                </ul>
            </div>

            <% if (user2 == null) { %>
            <div class="col-md-4 mt-4">
                <h4 class=" text-warning font-weight-bold">My Account</h4>
                <ul class="list-unstyled">
                    <li class="mt-3"><a href="login.jsp" style="color:white">Login</a></li>
                    <li><a href="register.jsp" style="color:white">Create Account</a></li>
                </ul>
            </div>
            <% } %>

            <div class="col-md-4 mt-4">
                <h4 class=" text-warning font-weight-bold">Follow Us On :</h4>
                <div class="social_media text-white">
                    <i class="fab fa-facebook" title="Facebook"></i>
                    <i class="fab fa-twitter" title="Twitter"></i>
                    <i class="fab fa-linkedin" title="LinkedIn"></i>
                    <i class="fab fa-instagram" title="Instagram"></i>
                </div>
            </div>
        </div>

        <div class="row mt-4">
            <div class="col-md-12">
                <h4 class="text-center text-warning font-weight-bold">Who We Are</h4>
                <p class="text-center text-white">
                	The High-Tech Laptop store operates an extensive support function for customers who have chosen to purchase and sell their high-tech equipment. We stock a wide range of laptops and related accessories from top brands, including Dell, Acer, Asus, Lenovo, Xiomi and many more. At High-Tech Laptop, 
                	we take pride in our friendly approach and service orientation, ensuring a seamless shopping experience for all our customers.
                </p>
            </div>
        </div>
        
        <hr>
		
        <div class="row mt-4">
            <div class="col-md-12">            	           	
                <p class="text-center" style="font-size:12px; color:white;">Copyright © 2022 High-Tech Laptop. All rights reserved.<a href="admin/admin-login.jsp">Administration</a></p>
            </div>
            
        </div>
    </div>
</footer>
	
</body>
</html>