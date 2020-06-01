package edu.zhengshang.liujy.service;

import edu.zhengshang.liujy.bean.Goods;

import java.util.List;




public interface Goodsservice {

	//添加商品信息
	boolean insert(Goods goods);
	//修改出入库状态
	boolean update(Goods goods);
	//查货物
	Goods getby(String name);
	//查询待出库商品，已入库
	List<Goods> getbyzhuangtai(String goodstype); 
	//查询所有商品
	List<Goods> getbylist(Goods goods);
	//查询单个商品
	Goods getbyidlist(Integer Id);
}
