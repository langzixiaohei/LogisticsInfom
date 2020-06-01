package edu.zhengshang.liujy.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {
	static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	public static String getCurrentDate(){
		return sdf.format(new Date());
	}
	
	static SimpleDateFormat sdf1 = new SimpleDateFormat("yyyyMMdd");
	public static String getCurrentDate1(){
		return sdf1.format(new Date());
	}
	
	
}
