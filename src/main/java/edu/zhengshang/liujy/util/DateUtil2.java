package edu.zhengshang.liujy.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil2 {
	
	static SimpleDateFormat sdf1 = new SimpleDateFormat("MMddHHmmss");
	public static String getCurrentDate1(){
		return sdf1.format(new Date());
	}
	
	
	
	
}
