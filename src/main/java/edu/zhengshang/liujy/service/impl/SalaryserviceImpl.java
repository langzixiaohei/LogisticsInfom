package edu.zhengshang.liujy.service.impl;

import java.util.List;

import edu.zhengshang.liujy.bean.Salary;
import edu.zhengshang.liujy.dao.SalaryMapper;
import edu.zhengshang.liujy.service.Salaryservice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@Service("salaryservice")
public class SalaryserviceImpl implements Salaryservice {
@Autowired
SalaryMapper salaryMapper;

@Override
public List<Salary> getallgz() {
	
	return salaryMapper.getallgz();
}

@Override
public boolean add(Salary salary) {
	boolean flag=false;
	
	if(salaryMapper.insertSelective(salary)>0) {
		flag=true;
	}
	return flag;
}

@Override
public boolean update(Salary salary) {
	
	boolean flag=false;
	
	if(salaryMapper.updateByPrimaryKeySelective(salary)>0) {
		flag=true;
	}
	return flag;
}

@Override
public Salary getby(Integer deeid) {
	
	return salaryMapper.selectByPrimaryby(deeid);
}

@Override
public List<Salary> all() {
	
	return salaryMapper.all();
}




}
