package com.ppss.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ppss.dao.MedicineDao;
import com.ppss.model.MedicineModel;

/**
 * 药品库存管理ServiceImpl
 * @author ZXM
 *
 */
@Transactional
@Service
public class MedicineServiceImpl implements MedicineService {

	@Autowired
	private MedicineDao medicineDao;

	@Override
	public List<MedicineModel> inventoryInit() {
		return medicineDao.findByCondition(null);
	}

	@Override
	public List<MedicineModel> selectMedicine(MedicineModel medicineModel) {
		return medicineDao.findByCondition(medicineModel);
	}

	@Override
	public void medicineAdd(MedicineModel medicineModel) {
		medicineDao.add(medicineModel);
	}

	@Override
	public void medicineUpdate(MedicineModel medicineModel) {
		medicineDao.update(medicineModel);
	}

	@Override
	public void medicineDel(String medicineId) {
		medicineDao.del(medicineId);
	}

	@Override
	public MedicineModel medicinefindOne(String medicineId) {
		
		return  medicineDao.findOne(medicineId);
	}

	@Override
	public byte[] medicineImage(String medicineId) throws IOException {
		MedicineModel medicineModel=medicineDao.findOne(medicineId);
		//根据药品编号取的图片存储路径
		String path=medicineModel.getMedicineImg();
		//file初始化
		File file =new File(path);
		//输入流初始化
		FileInputStream inputStream=new FileInputStream(file);
		//file长度取得
		long size=file.length();
		//定义image的二进制数组
		byte[] imageBuffer=new byte[(int)size];
		//将输入读入二进制数组
		inputStream.read(imageBuffer, 0, (int) size);
		//输出流关闭
		inputStream.close();
		return imageBuffer;
	}

	@Override
	public List<MedicineModel> findNotEnoughMedicine() {
		return medicineDao.findNotEoughMedicine();
	}


}
