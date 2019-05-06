package com.ppss.model;

public class MedicineModel {

	private String  medicineId;//药品编号
	private String  medicineName;//药品名
	private double  medicinePrice;//药品价格
	private String  medicineOriginPlace;//药品产地
	private String  medicineEffect;//药用效果
	private String medicineSp;//药品规格
	private String  medicineImg;//药品图片
	private Integer  medicineInventory;//药品库存量
	
	public MedicineModel() {

	}
	
	public String getMedicineId() {
		return medicineId;
	}
	public void setMedicineId(String medicineId) {
		this.medicineId = medicineId;
	}
	public String getMedicineName() {
		return medicineName;
	}
	public void setMedicineName(String medicineName) {
		this.medicineName = medicineName;
	}
	public double getMedicinePrice() {
		return medicinePrice;
	}
	public void setMedicinePrice(double medicinePrice) {
		this.medicinePrice = medicinePrice;
	}
	public String getMedicineOriginPlace() {
		return medicineOriginPlace;
	}
	public void setMedicineOriginPlace(String medicineOriginPlace) {
		this.medicineOriginPlace = medicineOriginPlace;
	}
	public String getMedicineEffect() {
		return medicineEffect;
	}
	public void setMedicineEffect(String medicineEffect) {
		this.medicineEffect = medicineEffect;
	}
	public String getMedicineSp() {
		return medicineSp;
	}
	public void setMedicineSp(String medicineSp) {
		this.medicineSp = medicineSp;
	}
	public String getMedicineImg() {
		return medicineImg;
	}
	public void setMedicineImg(String medicineImg) {
		this.medicineImg = medicineImg;
	}
	public Integer getMedicineInventory() {
		return medicineInventory;
	}
	public void setMedicineInventory(Integer medicineInventory) {
		this.medicineInventory = medicineInventory;
	}
	
	
	
}
