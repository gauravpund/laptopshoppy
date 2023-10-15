package com.mypackage.entity;

import java.time.LocalDateTime;
import java.util.Date;

public class Order extends Cart{
	private int orderId;
	private String contact;
	private String email;
	private String address;
	private String paymentOption;
	private Date date;

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPaymentOption() {
		return paymentOption;
	}

	public void setPaymentOption(String paymentOption) {
		this.paymentOption = paymentOption;
	}

	public void setDate(Date date) {
        this.date = date;
    }

    public Date getDate() {
        return date;
    }
	
	
	
}
