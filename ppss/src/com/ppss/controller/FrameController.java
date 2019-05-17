package com.ppss.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ppss.model.MedicineModel;
import com.ppss.service.MedicineService;
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

	@Autowired
	private MedicineService medicineService;
	/**
	 * 管理员菜单页
	 * 
	 * @return
	 */
	@RequestMapping(value = "managermenu")
	public String ManagerMenu(Model model) {
		// 取出库存不足的药品记录
		List<MedicineModel> medicineList = medicineService.findNotEnoughMedicine();
		// 记录条数取得
		int size = medicineList.size();
		// 初始化警告信息
		String warnMessage = "";
		// 判空处理
		if (size > 0) {
			// 设定警告信息
			warnMessage = "" + size;
		}
		// 信息存入
		model.addAttribute("warnMessage", warnMessage);
		return "managermenu";
	}

	@RequestMapping(value = "/warninfo", method = RequestMethod.GET)
	public String warnInfo(Model model) {
		// 取出库存不足的药品记录
		List<MedicineModel> medicineList = medicineService.findNotEnoughMedicine();
		model.addAttribute("medicineList", medicineList);
		return "medicinewarninfo";
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
