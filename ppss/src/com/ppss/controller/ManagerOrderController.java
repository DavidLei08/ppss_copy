package com.ppss.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ppss.model.OrderModel;
import com.ppss.service.OrderService;

/**
 * 管理员的订单管理前端控制
 * 
 * @author ZXM
 *
 */
@RequestMapping("/manager")
@Controller
public class ManagerOrderController {

	private static Logger logger = LoggerFactory.getLogger(ManagerOrderController.class);
	/**
	 * 订单服service
	 */
	@Autowired
	private OrderService orderService;

	/**
	 * 订单管理初始化
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/orderinit", method = RequestMethod.GET)
	public String orderInit(Model model) {
		// 订单信息存入
		model.addAttribute("orderList", orderService.managerOrderInit());
		return "managerorderlist";
	}

	/**
	 * 订单检索
	 * 
	 * @param orderModel
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/ordersearch", method = RequestMethod.POST)
	public String orderSearch(OrderModel orderModel, Model model) {
		// 订单信息存入
		model.addAttribute("orderList", orderService.orderSearch(orderModel));
		model.addAttribute("order", orderModel);
		return "managerorderlist";
	}

	/**
	 * 订单发货
	 * 
	 * @param orderId
	 * @param redirectAttributes
	 * @return
	 */
	@RequestMapping(value = "/ordersend/{orderId}", method = RequestMethod.GET)
	public String orderSend(@PathVariable("orderId") String orderId, RedirectAttributes redirectAttributes) {
		try {
			// 执行订单发货
			orderService.orderSend(orderId);
			// 定义成功信息
			String sucessMessage = "订单发货成功";
			// 存入信息
			redirectAttributes.addFlashAttribute("sucessMessage", sucessMessage);
		} catch (Exception e) {
			// 定义失败信息
			String errorMessage = "订单发货失败";
			logger.error(e.getMessage(),errorMessage);
			// 存入信息
			redirectAttributes.addFlashAttribute("errorMessage", errorMessage);
		}
		return "redirect:/manager/orderinit";
	}

	/**
	 * 订单退款，取消订单
	 * 
	 * @param orderId
	 * @return
	 */
	@RequestMapping(value = "/ordercancel/{orderId}", method = RequestMethod.GET)
	public String orderCancel(@PathVariable("orderId") String orderId, RedirectAttributes redirectAttributes) {
		try {
			orderService.orderCancel(orderId);
			// 定义成功信息
			String sucessMessage = "订单退款成功";
			// 存入信息
			redirectAttributes.addFlashAttribute("sucessMessage", sucessMessage);
		} catch (Exception e) {
			// 定义失败信息
			String errorMessage = "订单退款失败";
			logger.error(e.getMessage(),errorMessage);
			// 存入信息
			redirectAttributes.addFlashAttribute("errorMessage", errorMessage);
		}
		return "redirect:/manager/orderinit";
	}

	/**
	 * 订单详细信息获取
	 * 
	 * @param orderId
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/orderinfo/{orderId}", method = RequestMethod.GET)
	public String orderInfo(@PathVariable("orderId") String orderId, Model model) {
		// 将订单信息存入
		model.addAttribute("order", orderService.findOneOrder(orderId));
		// 订单项信息存入
		model.addAttribute("itemlist", orderService.getOrderInfo(orderId));
		return "managerorderinfo";
	}
}
