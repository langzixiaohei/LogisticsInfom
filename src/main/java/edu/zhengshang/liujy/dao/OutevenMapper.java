package edu.zhengshang.liujy.dao;

import edu.zhengshang.liujy.bean.Outeven;

import java.util.List;

public interface OutevenMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Outeven record);

    int insertSelective(Outeven record);

    Outeven selectByPrimaryKey(Integer id);

    /**
     * 查询
     * @return
     */
    List<Outeven> selectByPrimary();

    int updateByPrimaryKeySelective(Outeven record);

    int updateByPrimaryKey(Outeven record);
}