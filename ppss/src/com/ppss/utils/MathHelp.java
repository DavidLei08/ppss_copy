package com.ppss.utils;

import java.util.List;
import java.util.UUID;

import com.ppss.model.ItemModel;

/**
 * 计算帮助类
 * 
 * @author David Lei
 *
 */
public class MathHelp {

	private MathHelp() {

	}

	/**
	 * 计算处方项集合中的总金额
	 * @param pilsit
	 * @return
	 */
	public static double getAmount(List<ItemModel> itemList) {
		double amount = 0;
		for (ItemModel itemModel :itemList) {
			amount += (itemModel.getMedicinePrice()*itemModel.getMedicineCount());
		}
		return amount;
	}

	/**
	 * 获取不重复的字符串ID
	 * @return
	 */
	public static String getNumId() {
		String str = UUID.randomUUID().toString();
		str = str.replaceAll("-", "");
		str = str.substring(5, 20);
		return str;
	}
}