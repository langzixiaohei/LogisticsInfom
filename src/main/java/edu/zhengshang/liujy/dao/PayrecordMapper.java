package edu.zhengshang.liujy.dao;

import edu.zhengshang.liujy.bean.Payrecord;

import java.util.List;

public interface PayrecordMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Payrecord record);

    int insertSelective(Payrecord record);

    Payrecord selectByPrimaryKey(Integer id);

    /**
     * 根据记录查询支付记录
     * @param record
     * @return
     */
    List<Payrecord> selectByPrimary(Payrecord record);

    int updateByPrimaryKeySelective(Payrecord record);

    int updateByPrimaryKey(Payrecord record);
}