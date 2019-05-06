package com.ppss.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ppss.utils.DateTimeUtils;

/**
 * 框架集前端控制
 * 
 * @author ZXM
 *
 */
@RequestMapping(value = "frame")
@Controller
public class FrameController {

	/**
	 * 管理员菜单页
	 * 
	 * @return
	 */
	@RequestMapping(value = "managermenu")
	public String ManagerMenu() {
		return "managermenu";
	}

	/**
	 * 普通用户菜单页
	 * 
	 * @return
	 */
	@RequestMapping(value = "simplemenu")
	public String SimpleMenu() {
		return "simplemenu";

	}

	/**
	 * 初始化欢迎页
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping("init")
	public String PageInit(Model model) {
		model.addAttribute("dayScope", DateTimeUtils.getDayScope());
		model.addAttribute("dateTime", DateTimeUtils.getDateTimeStr());
		return "init";

	}
}
