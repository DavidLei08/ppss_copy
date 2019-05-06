package com.ppss.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ppss.model.ItemModel;
import com.ppss.model.MedicineModel;
import com.ppss.model.OrderModel;
import com.ppss.model.UserModel;
import com.ppss.service.MedicineService;
import com.ppss.service.OrderService;
import com.ppss.utils.DateTimeUtils;
import com.ppss.utils.MathHelp;

/**
 * 药品商城的前端控制
 * 
 * @author ZXM
 *
 */
@RequestMapping("/medicineshop")
@Controller
public class MedicineShopController {

	/**
	 * 药品信息管理用Service
	 */
	@Autowired
	private MedicineService medicineService;

	/**
	 * 订单管理用service
	 */
	@Autowired
	private OrderService orderService;

	/**
	 * 初始化药品商城
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/init", method = RequestMethod.GET)
	public String medicineShopInit(Model model) {
		//初始化药品商城信息
		model.addAttribute("medicineList", medicineService.inventoryInit());
		return "medicineshop";

	}

	/**
	 * 药品查询
	 * 
	 * @param medicineModel
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public String medicineSearch(MedicineModel medicineModel, Model model) {
		//按条件查询药品信息
		model.addAttribute("medicineList", medicineService.selectMedicine(medicineModel));
		return "medicineshop";
	}

	/**
	 * 向购物车添加药品，刷新session，返回json
	 * 
	 * @param medicineId
	 * @param session
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/toshopcar/{medicineId}", method = RequestMethod.GET)
	public @ResponseBody List<ItemModel> medicineToShopCar(@PathVariable("medicineId") String medicineId,
			HttpSession session) {
		// 订单项初始化
		ItemModel itemModel = new ItemModel();
		// 根据药品id取得药品
		MedicineModel medicineModel = medicineService.medicinefindOne(medicineId);
		// 订单项集合初始化
		List<ItemModel> itemList = new ArrayList<ItemModel>();
		// 订单项药品id设置
		itemModel.setMedicineId(medicineModel.getMedicineId());
		// 订单项药品名设置
		itemModel.setMedicineName(medicineModel.getMedicineName());
		// 订单项价格设置
		itemModel.setMedicinePrice(medicineModel.getMedicinePrice());
		// 判断session订单信息是否为空
		if (session.getAttribute("itemlist") == null) {
			// 订单项药品剂量设置为1
			itemModel.setMedicineCount(1);
			// 将订单项加入集合
			itemList.add(itemModel);
			// 将订单项集合存入session
			session.setAttribute("itemlist", itemList);
			// 返回json集合
			return itemList;
		} else {
			// 若session中存在订单项信息，则取出订单项集合
			itemList = (List<ItemModel>) session.getAttribute("itemlist");
			// 迭代订单项集合
			for (ItemModel item : itemList) {
				// 判断订单项集合中是否存在相同额药品id
				if (item.getMedicineId().equals(medicineModel.getMedicineId())) {
					// 存在则先移除该条订单项
					itemList.remove(item);
					// 将订单项的剂量+1
					item.setMedicineCount(item.getMedicineCount() + 1);
					// 将订单项在放入集合
					itemList.add(item);
					// 刷新session的订单项信息
					session.setAttribute("itemlist", itemList);
					session.setAttribute("amount", MathHelp.getAmount(itemList));
					// 返回json集合
					return itemList;
				}
			}
			itemModel.setMedicineCount(1);
			// 若集合不存在相同的药品id，则直接将订单项存入集合
			itemList.add(itemModel);
			// 返回json集合
			return itemList;
		}
	}

	/**
	 * 购物车药品剂量+1，同时刷新session，返回json
	 * 
	 * @param medicineId
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/shopcarincrease/{medicineId}", method = RequestMethod.GET)
	public @ResponseBody List<ItemModel> shopCarIncrease(@PathVariable("medicineId") String medicineId,
			HttpSession session) {
		// 从session中取得订单项集合
		@SuppressWarnings("unchecked")
		List<ItemModel> itemList = (List<ItemModel>) session.getAttribute("itemlist");
		// 迭代订单项集合
		outer: for (ItemModel item : itemList) {
			// 找到药品id匹配的订单项
			if (item.getMedicineId().equals(medicineId)) {
				// 先行移除订单项
				itemList.remove(item);
				// 订单项的剂量+1
				item.setMedicineCount(item.getMedicineCount() + 1);
				// 订单项在存入集合
				itemList.add(item);
				break outer;
			}
		}
		// 刷新session中订单项集合
		session.setAttribute("itemlist", itemList);
		//刷新订单总金额
		session.setAttribute("amount", MathHelp.getAmount(itemList));
		// 返回json
		return itemList;
	}

	/**
	 * 药品剂量-1，同时刷新session，返回json
	 * 
	 * @param medicineId
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/shopcarreduce/{medicineId}", method = RequestMethod.GET)
	public @ResponseBody List<ItemModel> shopCarReduce(@PathVariable("medicineId") String medicineId,
			HttpSession session) {
		// 从session中取得订单项集合
		@SuppressWarnings("unchecked")
		List<ItemModel> itemList = (List<ItemModel>) session.getAttribute("itemlist");
		// 迭代订单项集合，定义outer编号
		outer: for (ItemModel item : itemList) {
			// 找到药品id匹配的订单项
			if (item.getMedicineId().equals(medicineId)) {
				if ((item.getMedicineCount() - 1) == 0) {
					// 直接移除订单项
					itemList.remove(item);
					//跳出outer层循环
					break outer;
				} else {
					// 先行移除订单项
					itemList.remove(item);
					item.setMedicineCount(item.getMedicineCount() - 1);
					// 订单项在存入集合
					itemList.add(item);
					//跳出outer循环
					break outer;
				}
			}
		}
		// 刷新session中订单项集合
		session.setAttribute("itemlist", itemList);
		//刷新sessio中订单金额
		session.setAttribute("amount", MathHelp.getAmount(itemList));
		// 返回json
		return itemList;
	}

	/**
	 * 从购物车下单,跳转订单确认页
	 * 
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/toorder", method = RequestMethod.GET)
	public String shopCarToOrder(HttpSession session) {
		// 从session中取得订单项集合
		@SuppressWarnings("unchecked")
		List<ItemModel> itemList = (List<ItemModel>) session.getAttribute("itemlist");
		// 初始化跳转订单确认也所需的订单项集合
		List<ItemModel> itemModels = new ArrayList<ItemModel>();
		// 从session取得用户信息
		UserModel user = (UserModel) session.getAttribute("user");
		// 初始化订单
		OrderModel orderModel = new OrderModel();
		// 订单编号的设定
		orderModel.setOrderId(MathHelp.getNumId());
		// 订单总金额的设定
		orderModel.setOrderAmount(MathHelp.getAmount(itemList));
		// 订单创建时间的设定
		orderModel.setCreateTime(DateTimeUtils.getDateTimeStr());
		// 订单的状态的设定为0-待支付
		orderModel.setOrderStatus(0);
		// 订单的发货地址设定
		orderModel.setSendAddress("安徽合肥瑶海区学士路132号磨店千家惠大药房");
		// 订单的药店设定
		orderModel.setShopName("磨店千家惠大药房");
		// 订单的收获地址的设定
		orderModel.setUserAddress(user.getUserAddress());
		// 订单的用户id的设定
		orderModel.setUserId(user.getUserId());
		// 迭代订单项集合
		for (ItemModel itemModel : itemList) {
			// 订单项暂存
			ItemModel itemTemp = itemModel;
			// 暂存订单项设置订单编号
			itemTemp.setOrderId(orderModel.getOrderId());
			// 暂存订单项放入集合
			itemModels.add(itemTemp);
		}
		// 订单项集合存入sesion
		session.setAttribute("itemlist", itemModels);
		// 订单信息存入session
		session.setAttribute("order", orderModel);
		// 订单确认页跳转
		return "orderconfirm";
	}

	/**
	 * 取消订单，移除session中订单信息，订单项信息
	 * 
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/shopcarcancel", method = RequestMethod.GET)
	public String shopCarCancel(HttpSession session) {
		// 订单项移除
		session.removeAttribute("itemlist");
		// 订单信息移除
		session.removeAttribute("order");
		//金额信息移除
		session.removeAttribute("amount");
		//重定向到药品初始化
		return "redirect:/medicineshop/init";

	}

	/**
	 * 订单确认下单
	 * 
	 * @param session
	 * @param redirectAttributes
	 * @return
	 */
	@Transactional
	@RequestMapping(value = "/orderconfirm", method = RequestMethod.GET)
	public String orderConfirm(HttpSession session, RedirectAttributes redirectAttributes, Model model) {
		// session中取得订单
		OrderModel orderModel = (OrderModel) session.getAttribute("order");
		// session中取得订单项信息
		@SuppressWarnings("unchecked")
		List<ItemModel> itemList = (List<ItemModel>) session.getAttribute("itemlist");
		try {
			// 执行创建订单，将信息存入数据库
			orderService.createOrder(orderModel, itemList);
			// 订单信息存入，传递到订单支付页
			model.addAttribute("order", orderModel);
			// 订单项信息移除
			session.removeAttribute("itemlist");
			// 订单信息移除
			session.removeAttribute("order");
			return "orderpay";
		} catch (Exception e) {
			// 定义失败信息
			String errorMessage = "账号异常，下单失败";
			// 存入信息
			redirectAttributes.addFlashAttribute("errorMessage", errorMessage);
			// 订单项移除
			session.removeAttribute("itemlist");
			// 订单信息移除
			session.removeAttribute("order");
			//重定向到订单页
			return "redirect:/simpleorder/init";
		}

	}
 
	/**
	 * 订单支付
	 * @param orderId
	 * @param redirectAttributes
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/orderpay/{orderId}", method = RequestMethod.GET)
	public String orderPay(@PathVariable("orderId") String orderId, RedirectAttributes redirectAttributes,Model model) {
		OrderModel orderModel = orderService.findOneOrder(orderId);
		if (orderModel.getOrderStatus() == 1) {
			// 定义成功信息
			String sucessMessage = "下单成功，药店已接单";
			// 存入信息
			model.addAttribute("sucessMessage", sucessMessage);
			//订单信息传递订单评价页
			model.addAttribute("order", orderModel);
			//订单评论页跳转
			return "orderremark";
		} else {
			// 定义错误信息
			String errorMessage = "订单状态异常，下单失败";
			// 存入信息
			redirectAttributes.addFlashAttribute("errorMessage", errorMessage);
			//重定向到订单页
			return "redirect:/simpleorder/init";
		}

	}

	/**
	 * 订单取消
	 * @param orderId
	 * @param redirectAttributes
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/orderpaycancel/{orderId}", method = RequestMethod.GET)
	public String orderPaycancel(@PathVariable("orderId") String orderId, RedirectAttributes redirectAttributes,
			HttpSession session) {
		try {
			orderService.orderCancel(orderId);
			// 定义成功信息
			String sucessMessage = "订单已取消";
			// 存入信息
			redirectAttributes.addFlashAttribute("sucessMessage", sucessMessage);
		} catch (Exception e) {
			// 定义失败信息
			String errorMessage = "订单状态异常，订单取消失败";
			// 存入信息
			redirectAttributes.addFlashAttribute("errorMessage", errorMessage);
		}
		return "redirect:/simpleorder/init";
	}

	/**
	 * 订单评价
	 * @param orderModel
	 * @return
	 */
	@RequestMapping(value = "/remark", method = RequestMethod.POST)
	public String doOrderRemark(OrderModel orderModel) {
		//根据订单编号取得数据库的订单信息
		OrderModel orderTemp = orderService.findOneOrder(orderModel.getOrderId());
		//设定订单的评价星级
		orderTemp.setOrderRemark(orderModel.getOrderRemark());
		//设定订单的评价内容
		orderTemp.setOrderRemarkWords(orderModel.getOrderRemarkWords());
		//执行订单评价
		orderService.orderRemark(orderTemp);
		return "redirect:/simpleorder/init";
	}

	/**
	 * 根据药品id取得图片
	 * 
	 * @param medicineId
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping(value = "/medicineimg")
	public void getMedicineImg(String medicineId, HttpServletResponse response) throws IOException {
		OutputStream outputStream = response.getOutputStream();
		// 设置响应体格式为图片
		response.setContentType("image/*");
		// 将图片二进制流写入响应体
		outputStream.write(medicineService.medicineImage(medicineId));
		// 刷新缓存
		outputStream.flush();
		// 关闭输出流
		outputStream.close();
	}
}
