package com.ppss.model;

public class ItemModel {

	private Integer itemId;//订单项id
	private String medicineId;//药品编号
	private String medicineName;//药品名
	private Integer medicineCount;//药品剂量
	private double medicinePrice;//药品价格
	private String  orderId;//订单编号
	
	public ItemModel() {

	}

	public Integer getItemId() {
		return itemId;
	}

	public void setItemId(Integer itemId) {
		this.itemId = itemId;
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

	public Integer getMedicineCount() {
		return medicineCount;
	}

	public void setMedicineCount(Integer medicineCount) {
		this.medicineCount = medicineCount;
	}

	public double getMedicinePrice() {
		return medicinePrice;
	}

	public void setMedicinePrice(double medicinePrice) {
		this.medicinePrice = medicinePrice;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	
	
}
