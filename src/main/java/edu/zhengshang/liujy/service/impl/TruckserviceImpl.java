package edu.zhengshang.liujy.service.impl;

import java.util.List;

import edu.zhengshang.liujy.bean.Truck;
import edu.zhengshang.liujy.dao.TruckMapper;
import edu.zhengshang.liujy.service.Truckservice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@Service("truckservice")
public class TruckserviceImpl implements Truckservice {
@Autowired
TruckMapper truckMapper;

@Override
public List<Truck> getlist(Integer stauts) {
	
	return truckMapper.selectByPrimary(stauts);
}

@Override
public boolean update(Truck truck) {
	boolean flag=false;
	if(truckMapper.updateByPrimaryKeySelective(truck)>0){
		flag=true;
	}
	return flag;
}


}
