package com.ppss.dao;

import java.util.List;

import com.ppss.model.MedicineModel;

public interface MedicineDao {

	
	public void add(MedicineModel medicineModel);
	public void update(MedicineModel medicineModel);
	public void del(String medicineId);
	public List<MedicineModel> findByCondition(MedicineModel medicineModel);
	public MedicineModel findOne(String medicineId);
}
