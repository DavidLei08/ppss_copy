package com.ppss.service;

import java.util.List;

import com.ppss.model.ItemModel;
import com.ppss.model.OrderModel;

/**
 * 订单管理service
 * @author ZXM
 *
 */
public interface OrderService {

	/**
	 * 管理员订单管理初始化
	 * @return
	 */
	public List<OrderModel> managerOrderInit();
	
	/**
	 * 普通用户订单页初始化
	 * @param orderModel
	 * @return
	 */
	public List<OrderModel> simpleOrderInit(OrderModel orderModel);
	
	/**
	 * 订单按条件检索
	 * @param orderModel
	 * @return
	 */
	public List<OrderModel> orderSearch(OrderModel orderModel);
	
	/**
	 * 订单创建
	 * @param orderModel
	 */
	public void createOrder(OrderModel orderModel,List<ItemModel> itemList);
	
	/**
	 * 管理员订单发货，订单变更为已发货
	 * @param orderId
	 */
	public void orderSend(String orderId);
	
	/**
	 * 普通用户订单取货,订单变更为已取货
	 * @param orderId
	 */
	public void orderGet(String orderId);
	
	/**
	 * 取消订单
	 * @param orderId
	 */
	public void orderCancel(String orderId);
	
	/**
	 * 订单评论信息添加
	 * @param orderModel
	 */
	public void orderRemark(OrderModel orderModel);
	
	/**
	 * 查询一条订单记录的信息
	 * @param orderId
	 * @return
	 */
	public OrderModel findOneOrder(String orderId);
	
	/**
	 * 订单记录删除
	 * @param orderId
	 */
	public void  orderDel(String orderId);
	
	/**
	 * 取得订单的明细信息
	 * @return
	 */
	public List<ItemModel> getOrderInfo(String orderId);
}
