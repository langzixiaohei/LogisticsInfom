package edu.zhengshang.liujy.service;

import edu.zhengshang.liujy.bean.Outeven;

import java.util.List;



public interface Outevenservice {

	List<Outeven> selectall();

	boolean insert(Outeven outeven);
}
