 package com.ppss.controller;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ppss.model.MedicineModel;
import com.ppss.service.MedicineService;
import com.ppss.utils.MathHelp;

/**
 * 库存管理前端控制
 * 
 * @author ZXM
 *
 */
@RequestMapping("/inventory")
@Controller
public class MedicineInventoryController {
	
	private static Logger logger = LoggerFactory.getLogger(ManagerUserInfoController.class);
	/**
	 * 要药品及库库存用service
	 */
	@Autowired
	private MedicineService medicineService;

	/**
	 * 库存信息管理页初始化
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/init", method = RequestMethod.GET)
	public String medicineInventoryInit(Model model) {
		// 库存信息集合存入
		model.addAttribute("medicineList", medicineService.inventoryInit());
		return "inventorylist";
	}

	/**
	 * 药品库存信息检索
	 * 
	 * @param medicineModel
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public String medicineSearch(MedicineModel medicineModel, Model model) {
		// 获取查询的库存信息集合
		List<MedicineModel> medicineList = medicineService.selectMedicine(medicineModel);
		// 库存信息集合存入
		model.addAttribute("medicineList", medicineList);
		//检索的药品信息回传
		model.addAttribute("medicine", medicineModel);
		return "inventorylist";
	}

	/**
	 * 库存信息添加页跳转
	 * 
	 * @return
	 */
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String medicineAdd() {

		return "inventoryadd";
	}

	/**
	 * 库存添加信息提交
	 * 
	 * @param medicineModel
	 * @param multipartFile
	 * @param redirectAttributes
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String doMedicineAdd(@RequestParam("imageFile") MultipartFile multipartFile,MedicineModel medicineModel, 
			RedirectAttributes redirectAttributes) throws IOException {
		// 设置唯一Id
		medicineModel.setMedicineId(MathHelp.getNumId());
		// 对上传文件进行判空，非空时将上传文件写入本地
		if (!multipartFile.isEmpty()) {
			// 图片保存路径设置
			String imagePath = "E://upload//image//" + medicineModel.getMedicineId() + ".jpeg";
			// file初始化
			File file = new File(imagePath);
			// file的存在判断，若不存在则创建该file
			if (!file.exists()) {
				file.createNewFile();
			}
			// 上传文件写入本地
			multipartFile.transferTo(file);
			// 图片保存路径设定
			medicineModel.setMedicineImg(imagePath);
		}

		try {
			// 将库存信息添加到数据库
			medicineService.medicineAdd(medicineModel);
			// 定义成功信息
			String sucessMessage = "库存信息添加成功";
			// 信息存入
			redirectAttributes.addFlashAttribute("sucessMessage", sucessMessage);
		} catch (Exception e) {
			// 定义失败信息
			String errorMessage = "库存信息添加失败";
			logger.error(e.getMessage(),errorMessage);
			// 信息存入
			redirectAttributes.addFlashAttribute("errorMessage", errorMessage);
		}
		return "redirect:/inventory/init";
	}

	/**
	 * 库存信息更新页初始化
	 * 
	 * @return
	 */
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String medicineUpdate(String medicineId, Model model) {
		// 库存更新初始化信息存入
		model.addAttribute("medicine", medicineService.medicinefindOne(medicineId));
		return "inventroyupdate";
	}

	/**
	 * 库存更新信息提交
	 * 
	 * @param medicineModel
	 * @param multipartFile
	 * @param redirectAttributes
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String doMedicineUpdate( @RequestParam("imageFile") MultipartFile multipartFile,MedicineModel medicineModel,
			RedirectAttributes redirectAttributes) throws IOException {
		// 上传文件判空，不为空时，写入本地
		if (!multipartFile.isEmpty()) {
			// 初始化写入file
			File file = new File(medicineModel.getMedicineImg());
			// file的存在判断，不存在则创建该file
			if (!file.exists()) {
				file.createNewFile();
			}
			// 上传文件写入本地
			multipartFile.transferTo(file);
		}
		try {
			// 执行库存信息更新
			medicineService.medicineUpdate(medicineModel);
			// 定义更新成功信息
			String sucessMessage = "库存信息更新成功";
			// 存入信息
			redirectAttributes.addFlashAttribute("sucessMessage", sucessMessage);
		} catch (Exception e) {
			// 走入cath分支，定义更新失败信息
			String errorMessage = "库存信息更新失败";
			logger.error(e.getMessage(),errorMessage);
			// 信息存入
			redirectAttributes.addFlashAttribute("errorMessage", errorMessage);
		}
		return "redirect:/inventory/init";
	}

	/**
	 * 库存信息删除
	 * @param medicineId
	 * @param redirectAttributes
	 * @return
	 */
	@RequestMapping(value="/del",method=RequestMethod.GET)
	public String medicineDel(String medicineId, RedirectAttributes redirectAttributes) {

		try {
			// 执行库存信息的删除
			medicineService.medicineDel(medicineId);   
			// 定义成功信息
			String sucessMessage = "库存信息删除成功";
			// 存入信息
			redirectAttributes.addFlashAttribute("sucessMessage", sucessMessage);
		} catch (Exception e) {
			// 定义错误信息
			String errorMessage = "库存信息删除失败";
			logger.error(e.getMessage(),errorMessage);
			// 信息存入
			redirectAttributes.addFlashAttribute("errorMessage", errorMessage);
		}
		return "redirect:/inventory/init";
	}
	
	/**
	 * 根据药品id取得图片
	 * @param medicineId
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping(value="/medicineimg")
	public void getMedicineImg(String medicineId,HttpServletResponse response) throws IOException{
		//取得响应体的输出流
		OutputStream outputStream=response.getOutputStream();
		//设置响应体的格式为图片
		response.setContentType("image/*");
		//将图片二进制流写入输出流
		outputStream.write(medicineService.medicineImage(medicineId));
		//刷新缓存区
		outputStream.flush();
		//输出流关闭
		outputStream.close();
	}
}
