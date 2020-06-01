package edu.zhengshang.liujy.service;

import edu.zhengshang.liujy.bean.Truck;

import java.util.List;



public interface Truckservice {

	//查询汽车状态
	List<Truck> getlist(Integer stauts);
	//修改卡车状态
	boolean update(Truck truck);
	
}
