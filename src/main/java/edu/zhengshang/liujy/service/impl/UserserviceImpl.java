package edu.zhengshang.liujy.service.impl;

import edu.zhengshang.liujy.bean.User;
import edu.zhengshang.liujy.dao.UserMapper;
import edu.zhengshang.liujy.service.Userservice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@Service("userservice")
public class UserserviceImpl implements Userservice {
@Autowired
UserMapper userMapper;

@Override
public User login(User user) {
	
	return userMapper.selectByPrimary(user);
}

@Override
public boolean insert(User user) {
	boolean flag=false;
	if(userMapper.insert(user)>0){
		flag=true;
		System.out.println("注册成功");
	}
	return flag;
}

@Override
public boolean update(User user) {
	
	boolean flag=false;
	if(userMapper.updateByPrimaryKeySelective(user)>0){
		flag=true;
		System.out.println("修改成功");
	}
	return flag;
}

@Override
public User getby(Integer Id) {
	
	return userMapper.selectByPrimaryKey(Id);
}

@Override
public User getby1(User user) {
	
	return userMapper.selectByPrimary1(user);
}

}
