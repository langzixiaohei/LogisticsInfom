package edu.zhengshang.liujy.service.impl;

import java.util.List;

import edu.zhengshang.liujy.bean.Linkman;
import edu.zhengshang.liujy.dao.LinkmanMapper;
import edu.zhengshang.liujy.service.Linkmanservice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@Service("linkmanservice")
public class LinkmanserviceImpl implements Linkmanservice {
@Autowired
LinkmanMapper linkmanMapper;

@Override
public boolean insert(Linkman linkman) {
	boolean flag=false;
	if(linkmanMapper.insert(linkman)>0){
		flag=true;
		System.out.println("收件人添加成功");
	}
	return false;
}

@Override
public Linkman getby(Integer Id) {
	
	return linkmanMapper.selectByPrimaryKey(Id);
}

@Override
public Linkman getby1(String realname) {
	
	return linkmanMapper.selectByPrimaryKey1(realname);
}

@Override
public List<Linkman> getbylist() {
	
	return linkmanMapper.selectByPrimary();
}

	@Override
	public Linkman getbyNamePhone(Linkman linkman) {
		return linkmanMapper.selectByPrimaryKey2(linkman);
	}


}
