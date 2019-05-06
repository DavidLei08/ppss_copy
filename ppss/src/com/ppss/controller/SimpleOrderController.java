package com.ppss.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ppss.model.OrderModel;
import com.ppss.model.UserModel;
import com.ppss.service.OrderService;

/**
 * 用户订单中心前端控制
 * @author ZXM
 *
 */
@RequestMapping("/simpleorder")
@Controller
public class SimpleOrderController {
	
	/**
	 * 订单管理用service
	 */
	@Autowired
	private OrderService orderService;
	
	/**
	 * 普通用户订单页初始化
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/init",method=RequestMethod.GET)
	public String simpleOrderInit(Model model,HttpSession session){
		//session取得用户信息
		UserModel userModel=(UserModel) session.getAttribute("user");
		//初始订单信息
		OrderModel orderModel=new OrderModel();
		//设定用户id
		orderModel.setUserId(userModel.getUserId());
		//将该用户的订单信息存入
		model.addAttribute("orderlist", orderService.simpleOrderInit(orderModel));
		return "simpleorderlist";
	}
	
	/**
	 * 用户按条件查询订单
	 * @param orderModel
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/search",method=RequestMethod.POST)
	public String simpleOrderSearch(OrderModel orderModel,Model model,HttpSession session){
		//session取得用户信息
		UserModel userModel=(UserModel) session.getAttribute("user");
		
		//设定用户id
		orderModel.setUserId(userModel.getUserId());
		//将该用户的订单信息存入
		model.addAttribute("orderlist", orderService.simpleOrderInit(orderModel));
		//设定用户id
				orderModel.setUserId(userModel.getUserId());
		model.addAttribute("order", orderModel);
		return "simpleorderlist";
	}
	
	/**
	 * 订单详细信息页
	 * @param orderId
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/orderinfo/{orderId}",method=RequestMethod.GET)
	public String orderInfo(@PathVariable("orderId") String orderId,Model model){
		//将订单信息存入
		model.addAttribute("order", orderService.findOneOrder(orderId));
		//订单项信息存入
		model.addAttribute("itemlist", orderService.getOrderInfo(orderId));
		
		return "simpleorderinfo";
	}
	
	/**
	 * 用户确认取货
	 * @param orderId
	 * @param redirectAttributes
	 * @return
	 */
	@RequestMapping(value="/orderget/{orderId}",method=RequestMethod.GET)
	public String orderGetConfirm(@PathVariable("orderId") String orderId,RedirectAttributes redirectAttributes){
		try {
			//指定订单取货
			orderService.orderGet(orderId);
			//定义成功信息
			String sucessMessage="取货成功";
			//存入信息
			redirectAttributes.addFlashAttribute("sucessMessage", sucessMessage);
		} catch (Exception e) {
			//定义错误信息
			String errorMessage="订单状态异常，取货失败";
			//错误信息存入
			redirectAttributes.addFlashAttribute("errorMessage",errorMessage);
		}
		return "redirect:/simpleorder/init";
	}
}
