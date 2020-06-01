package edu.zhengshang.liujy.service.impl;

import java.util.List;

import edu.zhengshang.liujy.bean.Outeven;
import edu.zhengshang.liujy.dao.OutevenMapper;
import edu.zhengshang.liujy.service.Outevenservice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;




@Service("outevenservice")
public class OutevenserviceImpl implements Outevenservice {

@Autowired
OutevenMapper outevenMapper;

@Override
public List<Outeven> selectall() {
	
	return outevenMapper.selectByPrimary();
}

@Override
public boolean insert(Outeven outeven) {
	boolean flag=false;
	if(outevenMapper.insertSelective(outeven)>0){
		flag=true;
	}
	return flag;
}



}
