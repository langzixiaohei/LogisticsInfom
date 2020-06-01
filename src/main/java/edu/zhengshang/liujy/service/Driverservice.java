package edu.zhengshang.liujy.service;

import edu.zhengshang.liujy.bean.Driver;

import java.util.List;



public interface Driverservice {


	List<Driver> getlist();

	List<Driver> getztlist(Integer stauts);

	Driver getby(Integer Id);

	Driver getbyphone(String phone);
	//删除
	boolean delete(Driver driver);
	//修改
	boolean update(Driver driver);
	//添加
	boolean insert(Driver driver);
}
