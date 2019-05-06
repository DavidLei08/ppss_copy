package com.ppss.dao;

import java.util.List;

import com.ppss.model.ItemModel;

/**
 * 订单项单元操作
 * @author ZXM
 *
 */
public interface ItemDao {

	/**
	 * 订单项增加
	 * @param itemModel
	 */
	public void add(ItemModel itemModel);
	/**
	 * 订单项更新
	 * @param itemModel
	 */
	public void update(ItemModel itemModel);
	/**
	 * 订单项删除
	 * @param orderId
	 */
	public void del(String orderId);
	//根据条件查询订单项
	public List<ItemModel> findByCondition(ItemModel itemModel);
	//根据订单编号查询订单项
	public List<ItemModel> findByOrderId(String orderId);
	//查询一个订单项
	public ItemModel findOne(Integer itemId);
 }
