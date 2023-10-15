package com.mypackage.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.mypackage.entity.MyOrder;
import com.mypackage.entity.Product;

public class PaymentDao {

	private Connection conn;

    public PaymentDao(Connection conn) {
        this.conn = conn;
    }
    
    
    
    
    public void addPayment(MyOrder order) throws SQLException
    {     
        try
        {
            PreparedStatement ps = conn.prepareStatement("INSERT INTO laptopshopdb.order (order_id,amount,payment_id,receipt,status) VALUES (?,?,?,?,?)");
            
            
            ps.setString(1, order.getOrderId());
            ps.setString(2, order.getAmount());
            ps.setString(3, order.getPaymentId());
            ps.setString(4, order.getReceipt());     
            ps.setString(5, order.getStatus());
//            ps.setString(6, order.getOrderId());
            
            int i=ps.executeUpdate();
            
            if(i>0) {
            	System.out.println("Payment Successfully inserted in database");
            } 
            else {
            	System.out.println("got error to storing payment detais on database");
            }
          
        } 
        catch (SQLException e)
        {
        	System.out.println("Error : "+e);
            e.printStackTrace();
        }        
    }
}
