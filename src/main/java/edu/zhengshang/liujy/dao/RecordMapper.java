package edu.zhengshang.liujy.dao;

import edu.zhengshang.liujy.bean.Record;

import java.util.List;

public interface RecordMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Record record);

    int insertSelective(Record record);

    Record selectByPrimaryKey(Integer id);

    /**
     * 根据状态查询记录
     * @param stauts
     * @return
     */
    List<Record> selectByPrimary(String stauts);

    int updateByPrimaryKeySelective(Record record);

    int updateByPrimaryKey(Record record);
}