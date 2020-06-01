package edu.zhengshang.liujy.service.impl;

import java.util.List;

import edu.zhengshang.liujy.bean.Driver;
import edu.zhengshang.liujy.dao.DriverMapper;
import edu.zhengshang.liujy.service.Driverservice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@Service("driverservice")
public class DriverserviceImpl implements Driverservice {
@Autowired
DriverMapper driverMapper;

@Override
public List<Driver> getlist() {
	
	return driverMapper.selectByPrimary();
}

@Override
public boolean delete(Driver driver) {
	boolean falg=false;
	if(driverMapper.updateByPrimaryKey(driver)>0){
		falg=true;
	}
	return falg;
}

@Override
public boolean update(Driver driver) {
	
	boolean falg=false;
	if(driverMapper.updateByPrimaryKeySelective(driver)>0){
		falg=true;
	}
	return falg;
}

@Override
public boolean insert(Driver driver) {
	
	boolean falg=false;
	if(driverMapper.insertSelective(driver)>0){
		falg=true;
	}
	return falg;
}

@Override
public Driver getby(Integer Id) {
	
	return driverMapper.selectByPrimaryKey(Id);
}

@Override
public List<Driver> getztlist(Integer stauts) {
	
	return driverMapper.selectByPrimarywei(stauts);
}

@Override
public Driver getbyphone(String phone) {
	
	return driverMapper.getbyphone(phone);
}



}
