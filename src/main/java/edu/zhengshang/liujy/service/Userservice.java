package edu.zhengshang.liujy.service;


import edu.zhengshang.liujy.bean.User;

public interface Userservice {

	//登陆
	User login(User user);
	//注册
	boolean insert(User user);
	//修改
	boolean update(User user);
	//查单个
	User getby(Integer Id);

	User getby1(User user);
}
