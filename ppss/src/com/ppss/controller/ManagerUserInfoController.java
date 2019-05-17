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

import com.ppss.model.UserModel;
import com.ppss.service.UserService;

/**
 * 管理员用户信息管理前端控制
 * 
 * @author ZXM
 *
 */
@RequestMapping("/manageruser")
@Controller
public class ManagerUserInfoController {

	private static Logger logger = LoggerFactory.getLogger(ManagerUserInfoController.class);
	/**
	 * 用户管理用service
	 */
	@Autowired
	private UserService userService;

	/**
	 * 用户管理初始化
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/init", method = RequestMethod.GET)
	public String userInfoInit(Model model) {
		// 初始化用户管理信息
		model.addAttribute("userlist", userService.userInit());
		return "userlist";
	}

	/**
	 * 用户信息搜索
	 * 
	 * @param userModel
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public String userSearch(UserModel userModel, Model model) {
		// 按条件检索用户信息
		model.addAttribute("userlist", userService.userSearch(userModel));
		// 将检索的信息的传回
		model.addAttribute("userInfo", userModel);
		return "userlist";
	}

	/**
	 * 用户信息添加页
	 * 
	 * @return
	 */
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String userAdd() {
		return "useradd";
	}

	/**
	 * 用户信息添加提交
	 * 
	 * @param userModel
	 * @param redirectAttributes
	 * @return
	 */
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String doUserAdd(UserModel userModel, RedirectAttributes redirectAttributes) {
		try {
			// 执行用户信息添加
			userService.userAdd(userModel);
			// 定义成功信息
			String sucessMessage = "用户信息添加成功";
			// 存入信息
			redirectAttributes.addFlashAttribute("sucessMessage", sucessMessage);
		} catch (Exception e) {
			// 定义失败信息
			String errorMessage = "用户信息添加失败";
			logger.error(e.getMessage(),errorMessage);
			// 信息存入
			redirectAttributes.addFlashAttribute("errorMessage", errorMessage);
		}
		return "redirect:/manageruser/init";

	}

	/**
	 * 用户信息更新页
	 * 
	 * @param userId
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/update/{userId}", method = RequestMethod.GET)
	public String userUpdate(@PathVariable("userId") String userId, Model model) {
		// 用户更新信息初始化
		UserModel userModel = userService.findOneUser(userId);
		// 存入用户信息
		model.addAttribute("userInfo", userModel);
		return "userupdate";

	}

	/**
	 * 用户更新信息提交
	 * 
	 * @param userModel
	 * @param redirectAttributes
	 * @return
	 */
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String doUserUpdate(UserModel userModel, RedirectAttributes redirectAttributes) {
		try {
			// 执行用户信息更新
			userService.userUpdate(userModel);
			// 定义成功信息
			String sucessMessage = "用户信息更新成功";
			// 存入信息
			redirectAttributes.addFlashAttribute("sucessMessage", sucessMessage);
		} catch (Exception e) {
			// 定义失败信息
			String errorMessage = "用户信息更新失败";
			logger.error(e.getMessage(),errorMessage);
			// 存入信息
			redirectAttributes.addFlashAttribute("errorMessage", errorMessage);
		}
		return "redirect:/manageruser/init";
	}

	/**
	 * 用户信息删除
	 * 
	 * @param userId
	 * @param redirectAttributes
	 * 
	 * @return
	 */
	@RequestMapping(value = "/del/{userId}", method = RequestMethod.GET)
	public String userDel(@PathVariable("userId") String userId, RedirectAttributes redirectAttributes) {
		try {
			// 执行用户信息删除
			userService.userDel(userId);
			// 定义成功信息
			String sucessMessage = "用户信息删除成功";
			// 存入信息
			redirectAttributes.addFlashAttribute("sucessMessage", sucessMessage);
		} catch (Exception e) {
			// 定义失败信息
			String errorMessage = "用户信息删除失败";
			logger.error(e.getMessage(),errorMessage);
			// 信息存入
			redirectAttributes.addFlashAttribute("errorMessage", errorMessage);
		}
		return "redirect:/manageruser/init";
	}
}
