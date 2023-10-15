
<%@page import="com.mypackage.dao.UserDao"%>
<%@page import="com.mypackage.entity.User"%>
<%@page import="com.db.DbConnection"%>
<%@page import="java.util.List"%>
<%@page import="javax.servlet.ServletException" %>
<%@page import="javax.servlet.http.HttpServlet" %>
<%@page import="javax.servlet.http.HttpServletRequest" %>
<%@page import="javax.servlet.http.HttpServletResponse" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>   
        
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checkout</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>	
		<link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">	
		<%@include file="component/common-js-css.jsp" %>
		<style type="text/css">
		.product-row {
    border-bottom: 1px solid #ddd;
}

.product-image-cell {
    width: 20%;
    padding: 10px;
    vertical-align: middle;
}

.product-details-cell {
    width: 80%;
    padding: 10px;
    vertical-align: middle;
}

.product-image {
    max-width: 100%;
    border-radius: 6px;
}

.product-title {
    font-size: 1.5rem;
    margin-top: 0;
    margin-bottom: 10px;
}

.product-description {
    font-size: 1rem;
    color: #555;
    margin-bottom: 15px;
}

.product-price-value {
    font-size: 1.2rem;
    font-weight: bold;
    color: #e74c3c; /* Red color for price */
    margin-right: 20px;
}

.product-quantity-value {
    font-size: 1.2rem;
    font-weight: bold;
    color: #3498db; /* Blue color for quantity */
}


		</style>
		
    </head>
    <body>  
        <%@include  file="navbar.jsp" %>
        
        <% 
        User currentUser = (User) session.getAttribute("userObj");
        
        
        UserDao userdao = new UserDao(DbConnection.getConn());
        int currentUserId = userdao.getUserId(user.getUserEmail());
        
        CartDao cartDao = new CartDao(DbConnection.getConn());
        List<Cart> cartItems = cartDao.getCartItems(currentUserId); // Retrieve all cart items for the user
        
        
        String productTitle = request.getParameter("productTitle");
        String productFile = request.getParameter("productFile");
        String productDesc = request.getParameter("productDescription");
        String price = request.getParameter("productPrice");
        int productPrice = Integer.parseInt(price);
        String quantity = request.getParameter("productQuantity");
        int productQuantity = Integer.parseInt(quantity);
        String product_id = request.getParameter("productId");
        int productId = Integer.parseInt(product_id);
        
    %>
        <div class="container">
            <div class="row mt-5">                
					<%@include file="component/message.jsp" %>
                <div class="col-md-4">
                    <!--card-->
                    <div class="card">
                        <div class="card-body">

                            <h3 class="text-center font-weight-bold mb-5">Your Selected Item</h3>
<table class="table">
    <tr class="product-row">
        <td class="product-image-cell"><img src="Images/<%= productFile %>" class="product-image" alt="Product Image"></td>
        <td class="product-details-cell">
            <h3 class="product-title font-weight-bold"><%= productTitle %></h3>
            <p class="product-description"><%= productDesc %></p>
            <div class="product-price">
                <span class="font-weight-bold">Price: </span>
                <span class="product-price-value"><%= productPrice %></span>
            </div>
            <div class="product-quantity">
                <span class="font-weight-bold">Qty: </span>
                <span class="product-quantity-value"><%= productQuantity %></span>
            </div>
        </td>
    </tr>
    <tr>
    	<td><h4 class="font-weight-bold">Total</h4></td>
    	<td class="font-weight-bold">
    	<span class="product-quantity-value"><h4 class="font-weight-bold text-success"><%= productPrice * productQuantity %></h4></span></td>
    </tr>
</table>


                            	
                            		
                            <div class="card-body">
								
                            </div>
                        </div>
                    </div>

                </div>
                <div class="col-md-8">
                    <!--form details-->
                    <!--card-->
                    <div class="card">
                        <div class="card-body">

                            <h3 class="text-center font-weight-bold mb-5">Your Shipping Order Details</h3>
                            <form action="OrderServlet" method="post">
                            <input type="hidden" name="userId" value="<%= currentUserId%>">
                            <input type="hidden" name="productFile" value="<%= productFile%>">
                            <input type="hidden" name="productTitle" value="<%= productTitle %>">
                            <input type="hidden" name="productDescription" value="<%= productDesc %>">
                            <input type="hidden" name="productPrice" value="<%= productPrice%>">
                            <input type="hidden" name="productId" value="<%= productId%>">
                            <input type="hidden" name="productQuantity" value="<%= productQuantity%>">
                            <input type="hidden" name="totalPrice" value="<%= productPrice * productQuantity%>">
                            <input type="hidden" name="currentDate" value="<%= java.time.LocalDate.now() %>"> 
    <div class="form-group">
        <label class="font-weight-bold" for="exampleInputEmail1">Email</label>                                    
        <input value="<%= user.getUserEmail() %>" name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
    </div>                               
    <div class="form-group">
        <label class="font-weight-bold" for="name">Contact</label>
        <input value="<%= user.getUserPhone() %>" name="contact" type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter contact number">
    </div>
    <div class="form-group">
        <label class="font-weight-bold" for="exampleFormControlTextarea1">Shipping Address</label>
        <input name="address" class="form-control" id="exampleFormControlTextarea1" placeholder="Enter your address" required>
    </div>
    <div class="row">
    	<div class="col-md-6">
    		<div class="form-group">
        		<label class="font-weight-bold" for="exampleFormControlTextarea1">City</label>
        		<input name="city" class="form-control" id="exampleFormControlTextarea1" placeholder="Enter your city" required>
    		</div>
    	</div>
    	<div class="col-md-6">
    		<div class="form-group">
        		<label class="font-weight-bold" for="exampleFormControlTextarea1">Pincode</label>
        		<input name="pincode" class="form-control" id="exampleFormControlTextarea1" placeholder="Enter your pincode" required>
    		</div>
    	</div>
    </div>
    
    
    <div class="form-group">
        <label class="font-weight-bold" for="paymentOption">Payment Option</label>
        <select class="form-control form-control-sm" name="paymentOption" id="paymentOption">
            <option value="Cash On Delivery">Cash On Delivery</option>
        </select>
    </div>
    
    <button type="submit" class="btn btn-success">Place Order</button>
</form>

                            
                        </div>
                    </div>
                </div>
            </div>

        </div>

    </body>
</html>
