package edu.zhengshang.liujy.dao;

import edu.zhengshang.liujy.bean.Truck;

import java.util.List;

public interface TruckMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Truck record);

    int insertSelective(Truck record);

    Truck selectByPrimaryKey(Integer id);

    /**
     * 查询车的状态
     * @param stauts
     * @return
     */
    List<Truck> selectByPrimary(Integer stauts);

    int updateByPrimaryKeySelective(Truck record);

    int updateByPrimaryKey(Truck record);
}