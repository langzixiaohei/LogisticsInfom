package edu.zhengshang.liujy.service;

import edu.zhengshang.liujy.bean.Payrecord;

import java.util.List;



public interface Payrecordservice {

//查询所有支付记录
	List<Payrecord> selectall(Payrecord payrecord);
//添加支付记录
	boolean insert(Payrecord payrecord);
}
