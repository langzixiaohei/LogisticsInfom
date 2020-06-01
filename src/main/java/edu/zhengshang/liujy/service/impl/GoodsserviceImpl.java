package edu.zhengshang.liujy.service.impl;

import java.util.List;

import edu.zhengshang.liujy.bean.Goods;
import edu.zhengshang.liujy.dao.GoodsMapper;
import edu.zhengshang.liujy.service.Goodsservice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@Service("goodsservice")
public class GoodsserviceImpl implements Goodsservice {
@Autowired
GoodsMapper goodsMapper;

@Override
public boolean insert(Goods goods) {
	boolean flag=false;
	if(goodsMapper.insertSelective(goods)>0){
		System.out.println("添加成功");
		flag=true;
	}	
	return flag;
}

@Override
public boolean update(Goods goods) {
	
	boolean flag=false;
	if(goodsMapper.updateByPrimaryKeySelective(goods)>0){
		System.out.println("修改成功");
		flag=true;
	}	
	return flag;
}

@Override
public Goods getby(String name) {
	
	return goodsMapper.selectByPrimaryKey1(name);
}

@Override
public List<Goods> getbyzhuangtai(String goodstype) {
	
	return goodsMapper.selectgoodzhuangtai(goodstype);
}

@Override
public List<Goods> getbylist(Goods goods) {
	
	return goodsMapper.getbylist(goods);
}

@Override
public Goods getbyidlist(Integer Id) {
	
	return goodsMapper.selectByPrimaryKey(Id);
}



}
