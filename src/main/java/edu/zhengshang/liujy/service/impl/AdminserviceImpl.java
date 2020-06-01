package edu.zhengshang.liujy.service.impl;

import edu.zhengshang.liujy.bean.Admin;
import edu.zhengshang.liujy.dao.AdminMapper;
import edu.zhengshang.liujy.service.Adminservice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@Service("adminservice")
public class AdminserviceImpl implements Adminservice {

@Autowired
AdminMapper adminMapper;

@Override
public Admin login(Admin admin) {
	Admin admin1=adminMapper.login(admin);
	return  adminMapper.login(admin);
}




}
