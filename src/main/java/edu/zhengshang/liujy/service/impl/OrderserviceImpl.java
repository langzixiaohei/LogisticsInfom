package edu.zhengshang.liujy.service.impl;

import java.util.List;

import edu.zhengshang.liujy.bean.Order;
import edu.zhengshang.liujy.dao.OrderMapper;
import edu.zhengshang.liujy.service.Orderservice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@Service("orderservice")
public class OrderserviceImpl implements Orderservice {
@Autowired
OrderMapper orderMapper;

@Override
public boolean addorder(Order order) {
	boolean flag=false;
	if(orderMapper.insertSelective(order)>0){
		System.out.println("订单添加成功");
		flag=true;
	}
	return flag;
}

@Override
public List<Order> getorder(Order order) {
	
	return orderMapper.selectByPrimary(order);
}

@Override
public List<Order> getByuserorder(Order order) {
	
	return orderMapper.selectByPrimary1(order);
}

@Override
public boolean update(Order order) {
	boolean flag=false;
	if(orderMapper.updateByPrimaryKeySelective(order)>0){
		System.out.println("订单修改成功");
		flag=true;
	}
	return flag;
}

@Override
public boolean remove(Order order) {
	boolean flag=false;
	if(orderMapper.updateByPrimaryKeySelective(order)>0){
		System.out.println("订单s成功");
		flag=true;
	}
	return flag;
}

@Override
public Order getByuserorder1(Integer Id) {
	
	return orderMapper.selectByPrimaryKey(Id);
}

@Override
public List<Order> getbyycorder() {
	
	return orderMapper.selectByPrimaryyc();
}

@Override
public Order getbygoodsid(Integer goodsid) {

	return orderMapper.getbygoodsid(goodsid);
}

@Override
public List<Order> dingdanwfp() {
	
	return orderMapper.selectByPrimarywfp();
}

@Override
public List<Order> all() {
	
	return orderMapper.all();
}


}
