package edu.zhengshang.liujy.service.impl;

import java.util.List;

import edu.zhengshang.liujy.bean.Payrecord;
import edu.zhengshang.liujy.dao.PayrecordMapper;
import edu.zhengshang.liujy.service.Payrecordservice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@Service("payrecordservice")
public class PayrecordserviceImpl implements Payrecordservice {
@Autowired
PayrecordMapper payrecordMapper;

@Override
public List<Payrecord> selectall(Payrecord payrecord) {
	// TODO Auto-generated method stub
	return payrecordMapper.selectByPrimary(payrecord);
}

@Override
public boolean insert(Payrecord payrecord) {
	boolean flaag=false;
	if(payrecordMapper.insertSelective(payrecord)>0){
		flaag=true;
	}
	return flaag;
}



}
