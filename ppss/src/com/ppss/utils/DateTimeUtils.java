package com.ppss.utils;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 * 时间获取工具类
 * 
 * @author David Leir
 *
 */
public class DateTimeUtils {
	
	/**
	 *  获取当前时间yyyy-MM-dd HH:mm:ss时间格式的字符串
	 * @return
	 */
	public static String getDateTimeStr() {

		String timeString;
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		timeString = LocalDateTime.now().format(formatter);
		return timeString;
	}

	/**
	 * 获取当前yyyy-MM-dd日期格式的字符串
	 * 
	 * @return
	 */
	public static String getDateStr() {

		String dateString;
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		dateString = LocalDateTime.now().format(formatter);
		return dateString;
	}

	public static String getDayScope(){
		String dayScope="";
		int hours=LocalDateTime.now().getHour();
		if(hours>=0&&hours<=8){
			dayScope="早上";
		}
		else if(hours>8&&hours<=11){
			dayScope="上午";
		}else if(hours>11&&hours<=13){
			dayScope="中午";
		}else if(hours>13&&hours<=17){
			dayScope="下午";
		}else if(hours>17&&hours<=23){
			dayScope="晚上";
		}
		return dayScope;	
	}
}
