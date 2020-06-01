package edu.zhengshang.liujy.service;

import edu.zhengshang.liujy.bean.Order;

import java.util.List;



public interface Orderservice {

	//添加订单
	boolean addorder(Order order);
	//查询订单
	List<Order> getorder(Order order);
	//查询个人订单
	List<Order> getByuserorder(Order order);
	//查询个人单个订单
	Order getByuserorder1(Integer Id);
	//查询异常订单
	List<Order> getbyycorder();
	//修改订单
	boolean update(Order order);
	//删除订单
	boolean remove(Order order);
	
	//根据商品id查找订单
	Order getbygoodsid(Integer goodsid);
	
	//查询未分配订单
	List<Order> dingdanwfp();
	List<Order> all();
	
}
