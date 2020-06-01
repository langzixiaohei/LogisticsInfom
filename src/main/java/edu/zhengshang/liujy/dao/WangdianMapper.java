package edu.zhengshang.liujy.dao;

import edu.zhengshang.liujy.bean.Wangdian;

import java.util.List;

public interface WangdianMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Wangdian record);

    int insertSelective(Wangdian record);

    Wangdian selectByPrimaryKey(Integer id);

    /**
     * 查询所有
     * @return
     */
    List<Wangdian> selectByPrimary();

    int updateByPrimaryKeySelective(Wangdian record);

    int updateByPrimaryKey(Wangdian record);
}