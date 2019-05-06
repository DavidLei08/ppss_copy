package com.ppss.dao;

import java.util.List;

import com.ppss.model.OrderModel;

public interface OrderDao {

	public void add(OrderModel orderModel);
	public void update(OrderModel orderModel);
	public void del(String orderId);
	public List<OrderModel> findByCondition(OrderModel orderModel);
	public OrderModel findOne(String orderId);
}
