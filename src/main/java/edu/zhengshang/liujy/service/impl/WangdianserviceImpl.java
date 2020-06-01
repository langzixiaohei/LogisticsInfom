package edu.zhengshang.liujy.service.impl;

import java.util.List;

import edu.zhengshang.liujy.bean.Wangdian;
import edu.zhengshang.liujy.dao.WangdianMapper;
import edu.zhengshang.liujy.service.Wangdianservice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service("wangdianservice")
public class WangdianserviceImpl implements Wangdianservice {

@Autowired
WangdianMapper wangdianMapper;

@Override
public List<Wangdian> selectall() {
	
	return wangdianMapper.selectByPrimary();
}

}
