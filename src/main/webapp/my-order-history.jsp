<%@page import="com.mypackage.entity.Product"%>
<%@page import="com.mypackage.dao.ProductDao"%>
<%@page import="com.mypackage.entity.User"%>
<%@page import="com.mypackage.dao.UserDao"%>
<%@page import="java.util.List"%>
<%@page import="com.mypackage.dao.OrderDao"%>
<%@page import="com.db.DbConnection"%>
<%@ page import="com.mypackage.entity.Order" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Orders</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body class="bg-light">
    <%@include file="navbar.jsp" %>
    
    <div class="container-fluid col-md-12" style="width:90%;">
    
    <h1 class=" p-3 font-weight-bold">

    Order History</h1></div>
    
    <% 
        User currentUser = (User) session.getAttribute("userObj");
        
        
        UserDao userdao = new UserDao(DbConnection.getConn());
        int currentUserId = userdao.getUserId(user.getUserEmail());
        
        OrderDao orderDao = new OrderDao(DbConnection.getConn());
        List<Order> orderItems = orderDao.getOrders(currentUserId); // Retrieve all cart items for the user
        
    %>
    
    
    
    <div class="container-fluid bg-white" style="width:90%;">
    	<table class="table table-hover ">
	    	<thead>
	        	<tr>
		            <th style="width: 15%"><h4 class="font-weight-bold">Item</h4></th>
		            <th style="width: 10%"><h4 class="font-weight-bold">Price</h4></th>
		            <th style="width: 10%"><h4 class="font-weight-bold">Quantity</h4></th>
		            <th style="width: 10%"><h4 class="font-weight-bold">Total Price</h4></th>
		            <th style="width: 15%"><h4 class="font-weight-bold">Placed Date</h4></th>
		            <th style="width: 15%"><h4 class="font-weight-bold">Payment Option</h4></th>
	        	</tr>
	    	</thead>
	    	<tbody>
            <!-- Loop through each order and generate a table row -->
            <% for (Order order : orderItems) { %>
                <tr>
                    <td><%= order.getProductTitle() %></td>
                    <td><%= order.getProductPrice() %></td>
                    <td><%= order.getQuantity() %></td>
                    <td><%= order.getTotalPrice() %></td>
                    <td><%= order.getDate() %></td>
                    <td><%= order.getPaymentOption() %></td>
                </tr>
            <% } %>
        </tbody>
	    </table>
	</div>
</body>
</html>