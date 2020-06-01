package edu.zhengshang.liujy.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

//日期类型转换器，将收到的的字符串转换成Date类型
@Component
public class DateConverter implements Converter<String, Date>{

	public Date convert(String args) {
		System.out.println("进入日期转换......");
		Date date=null;
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		sdf.setLenient(false);
		try {
			date=sdf.parse(args);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return date;
	}

	
}
