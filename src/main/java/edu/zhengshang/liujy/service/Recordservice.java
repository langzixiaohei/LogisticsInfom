package edu.zhengshang.liujy.service;

import edu.zhengshang.liujy.bean.Record;

import java.util.List;



public interface Recordservice {

	//查询待出库商品
	List<Record> getweichuku(String stauts);
	//修改商品出入库状态
	boolean updatezhangtai(Record record);
}
