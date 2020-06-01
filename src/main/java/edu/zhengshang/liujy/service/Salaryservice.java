package edu.zhengshang.liujy.service;

import edu.zhengshang.liujy.bean.Salary;

import java.util.List;



public interface Salaryservice {

	//查询员工工资
	List<Salary> getallgz();

	List<Salary> all();

	boolean add(Salary salary);

	boolean update(Salary salary);

	Salary getby(Integer deeid);
}
