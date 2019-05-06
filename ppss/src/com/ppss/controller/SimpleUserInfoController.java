package com.ppss.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ppss.model.UserModel;
import com.ppss.service.UserService;

/**
 * 普通用户个人中心前端控制
 * @author ZXM
 *
 */
@RequestMapping("/simpleuser")
@Controller
public class SimpleUserInfoController {
	
	/**
	 * 用户信息管理用service
	 */
	@Autowired
	private UserService userService;
	
	/**
	 * 个人中心页初始化
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/init")
	public String userInfoInit(Model model,HttpSession session){
		//个人中心初始化
		UserModel userModel =(UserModel) session.getAttribute("user");
		//信息存入
		model.addAttribute("userInfo", userService.findOneUser(userModel.getUserId()));
		return "simpleuserinfo";
	}
	
	/**
	 * 个人信息修改
	 * @param userModel
	 * @param redirectAttributes
	 * @return
	 */
	@RequestMapping(value="/update",method=RequestMethod.POST)
	public String userInfoUpdate(UserModel userModel,RedirectAttributes redirectAttributes){
		try {
			//执行个人信息修改
			userService.userUpdate(userModel);
			//定义成功信息
			String sucessMessage="个人信息修改成功";
			//信息存入
			redirectAttributes.addFlashAttribute("sucessMessage",sucessMessage);
		} catch (Exception e){
			//定义错误信息
			String errorMessage="个人信息修改失败";
			//信息存入
			redirectAttributes.addFlashAttribute("errorMessage", errorMessage);
		}
		return "redirect:/simpleuser/init";
	}
}
