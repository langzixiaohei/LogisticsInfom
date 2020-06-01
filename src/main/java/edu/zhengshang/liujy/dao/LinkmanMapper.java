package edu.zhengshang.liujy.dao;

import edu.zhengshang.liujy.bean.Linkman;

import java.util.List;

public interface LinkmanMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Linkman record);

    int insertSelective(Linkman record);

    Linkman selectByPrimaryKey(Integer id);

    Linkman selectByPrimaryKey1(String realname);

    List<Linkman> selectByPrimary();

    int updateByPrimaryKeySelective(Linkman record);

    int updateByPrimaryKey(Linkman record);

    Linkman selectByPrimaryKey2(Linkman linkman);
}