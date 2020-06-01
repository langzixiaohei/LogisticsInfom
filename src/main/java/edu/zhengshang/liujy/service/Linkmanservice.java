package edu.zhengshang.liujy.service;

import edu.zhengshang.liujy.bean.Linkman;

import java.util.List;



public interface Linkmanservice {

//增加收件人
	boolean insert(Linkman linkman);
	//查询单个寄件人
	Linkman getby(Integer Id);
	//查询单个寄件人
	Linkman getby1(String realname);
	//查询客户关系
	List<Linkman> getbylist();

	//根据手机号姓名查询收件人

	Linkman getbyNamePhone(Linkman linkman);
}
