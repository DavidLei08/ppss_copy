package com.ppss.service;

import java.io.IOException;
import java.util.List;

import com.ppss.model.MedicineModel;

public interface MedicineService {
	
	/**
	 * 管理员药品库存管理初始化
	 * @return
	 */
	public List<MedicineModel> inventoryInit();
	
	/**
	 * 查询药品库存记录
	 * @param medicineModel
	 * @return
	 */
	public List<MedicineModel> selectMedicine(MedicineModel medicineModel);
	
	/**
	 * 药品库存记录添加
	 * @param medicineModel
	 */
	public void medicineAdd(MedicineModel medicineModel);
	
	/**
	 * 药品库存记录更新
	 * @param medicineModel
	 */
	public void medicineUpdate(MedicineModel medicineModel);
	
	/**
	 * 药品库存记录删除
	 * @param medicineId
	 */
	public void medicineDel(String medicineId);
	
	/**
	 * 查询一条药品库存记录
	 * @param medicineId
	 * @return
	 */
	public MedicineModel  medicinefindOne(String medicineId);
	
	/**
	 * 获取药品图片的二进制流
	 * @param medicineId
	 * @return
	 */
	public byte[] medicineImage(String medicineId) throws IOException;
}
