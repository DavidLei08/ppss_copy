package com.ppss.model;

public class OrderModel {

	private String orderId;//订单编号
	private String userId;//下单用户id
	private String createTime;//订单创建时间
	private String sendTime;//订单发货时间
	private String getTime;//订单取货时间
	private String shopName;//发货商店名
	private double orderAmount;//订单总金额
	private String userAddress;//用户收获地址
	private String sendAddress;//商家发货地址
	private Integer orderStatus;//订单状态
	private Integer orderRemark;//订单评价星级
	private String orderRemarkWords;//订单评价内容
	
	public OrderModel() {

	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	public String getSendTime() {
		return sendTime;
	}

	public void setSendTime(String sendTime) {
		this.sendTime = sendTime;
	}

	public String getGetTime() {
		return getTime;
	}

	public void setGetTime(String getTime) {
		this.getTime = getTime;
	}

	public String getShopName() {
		return shopName;
	}

	public void setShopName(String shopName) {
		this.shopName = shopName;
	}

	public double getOrderAmount() {
		return orderAmount;
	}

	public void setOrderAmount(double orderAmount) {
		this.orderAmount = orderAmount;
	}

	public String getUserAddress() {
		return userAddress;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}

	public String getSendAddress() {
		return sendAddress;
	}

	public void setSendAddress(String sendAddress) {
		this.sendAddress = sendAddress;
	}

	public Integer getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(Integer orderStatus) {
		this.orderStatus = orderStatus;
	}

	public Integer getOrderRemark() {
		return orderRemark;
	}

	public void setOrderRemark(Integer orderRemark) {
		this.orderRemark = orderRemark;
	}

	public String getOrderRemarkWords() {
		return orderRemarkWords;
	}

	public void setOrderRemarkWords(String orderRemarkWords) {
		this.orderRemarkWords = orderRemarkWords;
	}

	
	
}
