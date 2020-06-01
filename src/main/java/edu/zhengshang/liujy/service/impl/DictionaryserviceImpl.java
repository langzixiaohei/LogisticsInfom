package edu.zhengshang.liujy.service.impl;

import java.util.List;

import edu.zhengshang.liujy.bean.Dictionary;
import edu.zhengshang.liujy.dao.DictionaryMapper;
import edu.zhengshang.liujy.service.Dictionaryservice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@Service("dictionaryservice")
public class DictionaryserviceImpl implements Dictionaryservice {
@Autowired
DictionaryMapper dictionaryMapper;

@Override
public List<Dictionary> list(String unit) {
	
	return dictionaryMapper.selectByPrimary(unit);
}


}
