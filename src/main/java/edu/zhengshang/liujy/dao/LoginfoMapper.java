package edu.zhengshang.liujy.dao;

import edu.zhengshang.liujy.bean.Loginfo;

public interface LoginfoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Loginfo record);

    int insertSelective(Loginfo record);

    Loginfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Loginfo record);

    int updateByPrimaryKey(Loginfo record);
}