package edu.zhengshang.liujy.dao;

import edu.zhengshang.liujy.bean.Unusual;

public interface UnusualMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Unusual record);

    int insertSelective(Unusual record);

    Unusual selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Unusual record);

    int updateByPrimaryKey(Unusual record);
}