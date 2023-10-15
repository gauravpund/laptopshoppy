package com.mypackage.servlets;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Date;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.db.DbConnection;
import com.mypackage.dao.CartDao;
import com.mypackage.dao.OrderDao;
import com.mypackage.dao.ProductDao;
import com.mypackage.entity.Cart;
import com.mypackage.entity.Order;
import com.mypackage.entity.Product;

public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public OrderServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
	{
		int userId = Integer.parseInt(req.getParameter("userId"));
		String contact = req.getParameter("contact");
		String email = req.getParameter("email");
		String address = req.getParameter("address");
		String paymentOption = req.getParameter("paymentOption");
		int productId = Integer.parseInt(req.getParameter("productId"));
		String productDescription = req.getParameter("productDescription");
		String productTitle = req.getParameter("productTitle");
		String productFile = req.getParameter("productFile");
		int productPrice = Integer.parseInt(req.getParameter("productPrice"));
		int totalPrice = Integer.parseInt(req.getParameter("totalPrice"));
		int quantity = Integer.parseInt(req.getParameter("productQuantity"));
		
        
		Date currentDate = new Date();
        
		Order order = new Order();

		order.setProductId(productId);
		order.setProductDescription(productDescription);
		order.setProductTitle(productTitle);
		order.setProductFile(productFile);
		order.setProductPrice(productPrice);
		order.setTotalPrice(totalPrice);
		order.setQuantity(quantity);
		order.setUserId(userId);
		order.setContact(contact);
		order.setEmail(email);
		order.setAddress(address);
		order.setPaymentOption(paymentOption);
		order.setDate(currentDate);
		
		
		
		 
		

		OrderDao orderdao = new OrderDao(DbConnection.getConn());
		
		System.out.println("Product ID: " + order.getProductId());
		System.out.println("User ID: " + order.getUserId());
		System.out.println("Contact: " + order.getContact());
		System.out.println("Email: " + order.getEmail());
		System.out.println("Address: " + order.getAddress());
		System.out.println("Payment Option: " + order.getPaymentOption());
		System.out.println("Product Price: " + order.getProductPrice());
		System.out.println("Total Price: " + order.getTotalPrice());
		System.out.println("Quantity: " + order.getQuantity());         
        System.out.println("Description : "+order.getProductDescription());	
        System.out.println("Date : "+currentDate);
    	System.out.println("Going for add to Order");
		try {
			orderdao.addOrder(order);
			ProductDao  product_dao = new ProductDao(DbConnection.getConn());
			
			int totalInStockQty = product_dao.getProductInStockQtyById(productId);
			System.out.println("Product Total Qty : "+totalInStockQty);
			
			int inStock = totalInStockQty - order.getQuantity();
			
			orderdao.updateInStockQty(productId,inStock);
			
		} catch (SQLException e) {
			System.out.println("Error : "+e);
			e.printStackTrace();
		}
		
		HttpSession session=req.getSession();		
		
		System.out.println("Session Started");
		
		session.setAttribute("successMessage", "Order has been placed Successfully!");	
		
		res.sendRedirect("cart.jsp");
		doGet(req, res);
	}

}
