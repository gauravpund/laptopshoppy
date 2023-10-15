<%@page import="com.mypackage.entity.Product"%>
<%@page import="com.mypackage.dao.ProductDao"%>
<%@page import="com.mypackage.entity.User"%>
<%@page import="com.mypackage.dao.UserDao"%>
<%@page import="java.util.List"%>
<%@page import="com.mypackage.dao.CartDao"%>
<%@page import="com.db.DbConnection"%>
<%@ page import="com.mypackage.entity.Cart" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cart Page</title>
</head>
<body class="bg-light">
    <%@include file="navbar.jsp" %>
    
    <div class="container"><h1 class=" p-3 font-weight-bold">Shopping Cart</h1></div>
    
    <% 
        User currentUser = (User) session.getAttribute("userObj");
        
        
        UserDao userdao = new UserDao(DbConnection.getConn());
        int currentUserId = userdao.getUserId(user.getUserEmail());
        
        CartDao cartDao = new CartDao(DbConnection.getConn());
        List<Cart> cartItems = cartDao.getCartItems(currentUserId); // Retrieve all cart items for the user
        
        ProductDao pdao = new ProductDao(DbConnection.getConn());
    %>
    
    
    
    <div class="container bg-white">
    <table class="table ">
    <thead>
        <tr>
            <th style="width: 40%"><h4 class="font-weight-bold">Item</h4></th>
            <th style="width: 20%"><h4 class="font-weight-bold">Price</h4></th>
            <th style="width: 20%"><h4 class="font-weight-bold">Quantity</h4></th>
            <th style="width: 20%"><h4 class="font-weight-bold">Total Price</h4></th>
            <th style="width: 15%"><h4 class="font-weight-bold">Actions</h4></th>
        </tr>
    </thead>
    <tbody>
        <% 
        int n = 0;
        for (Cart cartItem : cartItems) { 
            n += 1;
        %>
        <tr class="mt-3">
            <td style="width: 25%">
                <div class="d-flex align-items-center">
                    <img src="Images/<%= cartItem.getProductFile() %>" class="card-img-top" style="height:120px;width:120px" alt="...">
                    <span class="ml-4"><%= cartItem.getProductTitle() %></span>
                </div>
            </td>
            <td>
                <div class="mt-5"><%= cartItem.getProductPrice() %></div>
            </td>
            <td>
                <form action="CartJspServlet" method="post">
                    <input type="hidden" name="userEmail" value="<%= user.getUserEmail() %>">
                    <input type="hidden" name="productId" value="<%= cartItem.getProductId() %>">
                    <input type="hidden" name="productDesc" value="<%= cartItem.getProductDescription() %>">
                    <input type="hidden" name="productTitle" value="<%= cartItem.getProductTitle() %>">
                    <input type="hidden" name="productPrice" value="<%= cartItem.getProductPrice() %>">
                    <input type="hidden" name="productFile" value="<%= cartItem.getProductFile() %>">
                    <div class="d-flex mt-5">
                        <button type="button" class="btn btn-sm btn-decre" onclick="removeQuantity('quantity<%= cartItem.getProductId() %>');">
                            <i class="fas fa-minus-square"></i>
                        </button>
                        <input type="text" style="width: 30%;" name="productQuantity" value="<%= cartItem.getQuantity() %>" class="form-inline text-center" id="quantity<%= cartItem.getProductId() %>" readonly>
                        <button type="button" name="inc" class="btn btn-sm btn-decre" onclick="addQuantity('quantity<%= cartItem.getProductId() %>');">
                            <i class="fas fa-plus-square"></i>
                        </button>
                    </div>
                    <%  
                    	if(pdao.isProductInStockQty(cartItem.getProductId())){ 
                    %>
                    <button type="submit" class="btn btn-dark mt-3 ml-2" style="width: 60%;border-radius:30px;" name="submit">Update</button>
                    <% } %>
                    
                </form>
            </td>
            <!-- We print total price here by this, because we not set setProductTotalPrice() to cart -->
            <!-- So, quantity 1 for product, it does not dipslay total price, for that we use following formula-->
            <td><div class="mt-5"><%= cartItem.getProductPrice() * cartItem.getQuantity() %></div></td>
            <td>
                <div class="d-flex flex-column mt-5">
    <% if (pdao.isProductInStockQty(cartItem.getProductId())) { %>
        <a href="checkout.jsp?productId=<%= cartItem.getProductId() %>&productDescription=<%= cartItem.getProductDescription() %>&productTitle=<%= cartItem.getProductTitle() %>&productPrice=<%= cartItem.getProductPrice() %>&productQuantity=<%= cartItem.getQuantity() %>&productFile=<%= cartItem.getProductFile() %>" class="btn btn-outline-primary mb-2">Buy</a>
    <% } else { %>
        <p class="text-center text-danger">Product Not Available.</p>
    <% } %>
    
    <form action="DeleteCartServletProduct" method="post">
        <input type="hidden" value="<%= cartItem.getProductId() %>" name="productId">
        <input type="hidden" value="<%= currentUserId %>" name="userId">
        <div class="text-center mt-2">
            <button type="submit" class="btn bg-white text-danger fa fa-trash" aria-hidden="true"></button>
        </div>
    </form>
</div>

            </td>
        </tr>
        <% } %>
    </tbody>
</table>

</div>

    
    <%@ include file="footer.jsp" %>
    
    <script>
    function addQuantity(inputId) {
    	
        var quantityInput = document.getElementById(inputId);
        var currentQuantity = parseInt(quantityInput.value);
        quantityInput.value = currentQuantity + 1;
    	
    }
    function removeQuantity(inputId) {
    	
	        var quantityInput = document.getElementById(inputId);
	        var currentQuantity = parseInt(quantityInput.value);
	        if(currentQuantity > 1){
	        quantityInput.value = currentQuantity - 1;
	        }
	        else
	        	{
	        	alert('Quantity Must Be Minimum 1');
	        	}
	        
    	
    }
</script>

</body>
</html>
