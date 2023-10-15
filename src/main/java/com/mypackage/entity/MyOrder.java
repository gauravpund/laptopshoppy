package com.mypackage.entity;

public class MyOrder {

	private Long myOrderId;
	public Long getMyOrderId() {
		return myOrderId;
	}
	public void setMyOrderId(Long myOrderId) {
		this.myOrderId = myOrderId;
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	public String getReceipt() {
		return receipt;
	}
	public void setReceipt(String receipt) {
		this.receipt = receipt;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
//	public User getUser() {
//		return user;
//	}
//	public void setUser(User user) {
//		this.user = user;
//	}
	public String getPaymentId() {
		return paymentId;
	}
	public void setPaymentId(String paymentId) {
		this.paymentId = paymentId;
	}
	
	public MyOrder(String orderId, String amount, String receipt, String status,
			String paymentId) {
		super();
		
		this.orderId = orderId;
		this.amount = amount;
		this.receipt = receipt;
		this.status = status;
//		this.user = user;
		this.paymentId = paymentId;
	}

	private String orderId;
	private String amount;
	private String receipt;
	private String status;
//	private User user;
	private String paymentId;
}
