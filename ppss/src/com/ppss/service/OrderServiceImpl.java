package com.ppss.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ppss.dao.ItemDao;
import com.ppss.dao.MedicineDao;
import com.ppss.dao.OrderDao;
import com.ppss.model.ItemModel;
import com.ppss.model.MedicineModel;
import com.ppss.model.OrderModel;
import com.ppss.utils.DateTimeUtils;

/**
 * 订单管理serviceImpl
 * @author ZXM
 *
 */
@Transactional
@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderDao orderDao;
	
	@Autowired
	private MedicineDao medicineDao;
	
	@Autowired
	private ItemDao itemDao;

	@Override
	public List<OrderModel> managerOrderInit() {
		return orderDao.findByCondition(null);
	}

	@Override
	public List<OrderModel> simpleOrderInit(OrderModel orderModel) {
		return orderDao.findByCondition(orderModel);
	}

	@Override
	public List<OrderModel> orderSearch(OrderModel orderModel) {
		return orderDao.findByCondition(orderModel);
	}

	@Transactional
	@Override
	public void createOrder(OrderModel orderModel,List<ItemModel> itemList) {
		//设定订单的创建时间
		orderModel.setCreateTime(DateTimeUtils.getDateTimeStr());
		//设定订单的状态为1--代发货
		orderModel.setOrderStatus(1);
		//创建订单
		orderDao.add(orderModel);
		//迭代项集合
		for(ItemModel itemModel:itemList){
			//将订单项信息加入数据库
			itemDao.add(itemModel);
		}
	}

	@Override
	public void orderSend(String orderId) throws Exception {
		//根据订单编号取出所有的订单项信息
		List<ItemModel> itemList=itemDao.findByOrderId(orderId);
		//迭代订单项信息
		for(ItemModel itemModel:itemList){
		//根据订单项中的药品编号查询该药品的库存记录
		MedicineModel medicineModel=medicineDao.findOne(itemModel.getMedicineId());
		//计算发货后的库存量
		medicineModel.setMedicineInventory(medicineModel.getMedicineInventory()-itemModel.getMedicineCount());
		//如果库存量不足，抛出一个异常
		if(medicineModel.getMedicineInventory()<0){
			throw new Exception();
			
		}
		//更新该药品编号的库存记录
		medicineDao.update(medicineModel);
		}
		
		//订单信息取得
		OrderModel orderModel = orderDao.findOne(orderId);
		//订单状态设定为2--已发货
		orderModel.setOrderStatus(2);
		//设定订单的发货时间
		orderModel.setSendTime(DateTimeUtils.getDateTimeStr());
		//更新该条订单记录
		orderDao.update(orderModel);
	}

	@Override
	public void orderGet(String orderId) {
		//根据订单编号取得订单信息
		OrderModel orderModel = orderDao.findOne(orderId);
		//订单呢状态设定为3--已取货
		orderModel.setOrderStatus(3);
		//设定订单的取货时间
		orderModel.setGetTime(DateTimeUtils.getDateTimeStr());
		//更新该条订单记录
		orderDao.update(orderModel);
	}

	@Override
	public void orderRemark(OrderModel orderModel) {
		orderDao.update(orderModel);
	}

	@Override
	public OrderModel findOneOrder(String orderId) {
		return orderDao.findOne(orderId);
	}

	@Override
	public void orderDel(String orderId) {
		orderDao.del(orderId);
	}

	@Override
	public List<ItemModel> getOrderInfo(String orderId) {
		
		return itemDao.findByOrderId(orderId);
	}

	@Override
	public void orderCancel(String orderId) {
		//根据订单编号取得订单信息
		OrderModel orderModel = orderDao.findOne(orderId);
		//订单状态设定为4-交易失败
		orderModel.setOrderStatus(4);
		//订单更新
		orderDao.update(orderModel);
	}

}
