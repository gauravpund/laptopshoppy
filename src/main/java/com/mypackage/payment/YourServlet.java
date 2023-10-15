package com.mypackage.payment;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.lang.reflect.Type;
import java.sql.SQLException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.db.DbConnection;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.mypackage.dao.PaymentDao;
import com.mypackage.entity.MyOrder;
import com.razorpay.*;

@SuppressWarnings("serial")
public class YourServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Read the JSON data from the request
    	System.out.print("Entered YourServlet class....");
    	
    	
    	 String json = request.getReader().lines().reduce("", (accumulator, actual) -> accumulator + actual);

         // Convert the JSON data to a Map
         // You may need to use a JSON library like Jackson or Gson for this conversion
         // Here, we assume you have a utility method to do this called "jsonToMap"
    	 
    	// Create a JSON object for the response
    	 JSONObject jsonResponse = new JSONObject(json);
    	 
         Map<String, Object> data = jsonToMap(json);

         // Handle the data as needed
         System.out.println("Data =" + data);
         
    	int amt=Integer.parseInt(data.get("amount").toString());
    	System.out.print("Amount="+amt);
    	
    	try {
    		RazorpayClient client=new RazorpayClient("rzp_test_Ua38sUYvjJibMu","ZJoZc62J1YJsXGOO3IAe11aP");
			
			JSONObject ob=new JSONObject();
			ob.put("amount", amt*100);
			ob.put("currency", "INR");
			ob.put("receipt", "txn_235425");
			
			//creating new  order
			Order order=client.orders.create(ob);
			
			MyOrder myOrder=new MyOrder(order.get("id"),order.get("amount")+"",order.get("receipt"),"created","null");  // null is User class type
			
			myOrder.setAmount(order.get("amount")+"");
			myOrder.setOrderId(order.get("id"));
			myOrder.setPaymentId(null);
			myOrder.setStatus("created");
//			myOrder.setUser(null);     // user_id foreign key  
			myOrder.setReceipt(order.get("receipt"));
			
			
			// Here i am storing data in database
			
			

					PaymentDao dao = new PaymentDao(DbConnection.getConn());

					dao.addPayment(myOrder);
			
			System.out.print("order"+order);
			
			response.setContentType("application/json");
	    	response.getWriter().write(order.toString());  // send data back to ajax method
			
//			 jsonResponse.put("order", order.toString());
			
			
			// if you want you can save this to your database...
			
		} catch (RazorpayException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    	

    }
    
    
  private Map<String, Object> jsonToMap(String json) {
         Gson gson = new Gson();
         Type type = new TypeToken<Map<String, Object>>() {}.getType();
         return gson.fromJson(json, type);
     }
}
