package edu.zhengshang.liujy.service.impl;

import java.util.List;

import edu.zhengshang.liujy.bean.Record;
import edu.zhengshang.liujy.dao.RecordMapper;
import edu.zhengshang.liujy.service.Recordservice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@Service("recordservice")
public class RecordserviceImpl implements Recordservice {
@Autowired
RecordMapper recordMapper;

@Override
public List<Record> getweichuku(String stauts) {
	
	return recordMapper.selectByPrimary(stauts);
}

@Override
public boolean updatezhangtai(Record record) {
	boolean flag=false;
	if(recordMapper.updateByPrimaryKeySelective(record)>0){
		flag=true;
	}
	return flag;
}


}
