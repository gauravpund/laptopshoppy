
<%               	
    		User user1 = (User) session.getAttribute("userObject");	    		    	
		%>

<%@page import="com.mypackage.dao.CategoryDao"%>
<%@page import="com.mypackage.entity.Category"%>
<%@page import="com.mypackage.dao.ProductDao"%>
<%@page import="com.mypackage.entity.Product"%>
<%@page import="com.mypackage.dao.UserDao"%>
<%@page import="com.mypackage.entity.User"%>
<%@page import="com.mypackage.dao.CartDao"%>
<%@page import="com.mypackage.entity.Cart"%>
<%@page import="com.db.DbConnection"%>

<%@page import="java.util.List"%>
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
		
		<style>
			
		</style>
	</head>
	<body class="bg-white">
			 		
  		<!-- Add Category and Product from here -->  				
           <div class="row container-fluid p-4 bg-white mt-1">
			    <%                
				    String cat1 = request.getParameter("category");                   
				    //out.println(cat);
				        						
				    ProductDao dao1 = new ProductDao(DbConnection.getConn());
				    List<Product> list1 = null;
				    
				    
				    
				
				    if (cat1 == null || cat1.trim().equals("all"))
				    {
				        list1 = dao1.getProducts();
				    }
				    else
				    {
				        int cid =Integer.parseInt(cat1.trim());
				    	list1 = dao1.getAllProductsById(cid);
				    }  										        						
				        						
				    CategoryDao cdao1 = new CategoryDao(DbConnection.getConn());
				    List<Category> categorylist1 = cdao1.getCategories();
				    
				    
			    %>
			       
			    <!--show categories-->
			    <div class="col-md-2 bg-white">
			        <h2 class="text-left font-weight-bold mt-5">Categories</h2>
			        <h4 class="mt-2 font-weight-bold ml-2">Brands</h4>
			        <div class="list-group font-weight-bold  mt-3 ml-2">
			            <a href="index.jsp?category=all" class="list-group-item list-group-item-action bg-light mt-4">
			                ALL PRODUCTS
			            </a>
			            <% for (Category c : categorylist1) { %>
			            <a href="index.jsp?category=<%= c.getCategoryId()%>" class="list-group-item bg-white list-group-item-action bg-light">
			                <% String catTitle = c.getCategoryTitle();%>
			                <%= catTitle.toUpperCase() %>
			            </a>
			            <% } %>
			        </div>
			    </div> 
			    
			    
			                  
				<div class="col-md-10 container-fluid bg-white">
				    <!-- Featured Products section -->
					<h1 class="text-center font-weight-bold mt-5">Featured Products</h1>
					<h5 class="text-center mt-3">Laptops are gaining popularity over the conventional desktop computers due to the convenience and affordability.</h5>
					<div class="row ">
					    <div class="col-md-12">
							<div id="successMessage">
							    <%@include file="component/message.jsp" %>
							</div>
					        <div class="card-deck mt-3">					        	
					            <% for (Product p : list1) { %>					               
					                <div class="col-md-3">
					                    <!-- Product Card -->
					                    
					                    <div class="card  bg-white mt-2" style="color:black;height:500px;width:300px;border:10px;cursor:pointer;">
					                        <div class="card-body bg-white text-center">
					                        	
					                            <img src="Images/<%= p.getProductFile()%>" class="card-img-top"
					                                 style="height:150px;width:180px" alt="...">
					                        </div>
					                        <div class="card-body">
					                            <h4 class="card-title font-weight-bold"><%= p.getProductTitle() %></h4>
					                            <p class="card-text"><%= p.getProductDescription() %></p>
					                        </div>
					                        
					                        <%
    ProductDao pdao = new ProductDao(DbConnection.getConn());
    boolean isProductInStock = pdao.isProductInStockQty(p.getProductId());
%>

<div class="card-body">
    <% if (isProductInStock) {
        int inStockQty = p.getInStockQty();
        if (inStockQty > 0 && inStockQty < 3) { %>
            <p class="card-text text-warning mt-3">Only <%= inStockQty %> items are left.</p>
        <% } else { %>
            <p class="card-text text-success mt-3">In stock.</p>
        <% }
    } else { %>
        <p class="card-text text-danger">Not in stock.</p>
    <% } %>
</div>

						                    <%if(pdao.isProductInStockQty(p.getProductId())) {%>
					                        <div class="card-body bg-white text-center">
					                            <div class="row">                            
                            						<!-- Display product price -->
					                            	<div class="col-md-5 text-left">
					                                	<h4 class="text-dark font-weight-bold" style="color:black;">&#8377; <%= p.getProductPrice() %></h4>
					                            	</div> 
					                            	<div class="col-md-2"></div>                          
                                					<div class="col-md-5">
	                                    				<!-- Form to add the product to the cart -->
	                                    				<% if(user1 != null)                                   			
	                                    					{ 
	                                    				%>
						                                    <form action="CartServlet" method="post"> 
						                                    	<input type="hidden" name="userEmail" value="<%= user1.getUserEmail() %>">
						                                        <input type="hidden" name="productId" value="<%= p.getProductId() %>">
						                                        <input type="hidden" name="productDesc" value="<%= p.getProductDescription() %>">
						                                        <input type="hidden" name="productTitle" value="<%= p.getProductTitle() %>">
						                                        <input type="hidden" name="productPrice" value="<%= p.getProductPrice() %>">
						                                        <input type="hidden" name="productQuantity" value="1">
						                                        <input type="hidden" name="productFile" value="<%= p.getProductFile() %>">
						                                        <button type="submit" class="btn btn-dark " style="background-color:black;border-radius:20px;">
						                                        	<i class="fa fa-shopping-cart ml-2" aria-hidden="true"></i>                                       	
						                                        </button>
						                                    </form>  
	                                    				<% } else  %>                                 
                                					 
                                						<%  { %>                               
                                					
                                    					<!-- Placeholder for a link to login page, customize as needed -->
				                                    		<% if(user1 == null ){ %><a href="login.jsp">
				                                        		<button class="btn btn-dark " style="background-color:black;border-radius:20px;">
				                                        			<i class="fa fa-shopping-cart ml-2" aria-hidden="true"></i>
				                                        		</button></a>
				                                        	<% } %>		                                    				                                    
                                					</div>
                                				<% } %>
                            				</div>                           
                        				</div>
                        				<% } %>
                    				</div>
               	 				</div>
                <!-- Product Card Ended -->                
                
            <% } %>

            <% if (list1.size() == 0) { %>
                <!-- Display a message if there are no items in the list -->
                <h3 class="container mt-5 text-center font-weight-bold">Sorry! Product Not Available. </h3>
            <% } %>
        </div>
    </div>
</div>
</div>
</div>




	     <!--show products End-->
		 
		<script>
    // This function shows the success message and hides it after a delay
    function showSuccessMessage() {
        var successMessage = document.getElementById("successMessage");
        successMessage.style.display = "block";

        // Hide the message after 3 seconds (adjust the timeout value as needed)
        setTimeout(function() {
            successMessage.style.display = "none";
        }, 5000); // 5000 milliseconds = 3 seconds
    }

    // Call this function when the product is successfully added to the cart
    // For example, after a form submission or an AJAX request
    showSuccessMessage();
</script>
		
	</body>
</html>