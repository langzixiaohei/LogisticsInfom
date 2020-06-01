package edu.zhengshang.liujy.dao;

import edu.zhengshang.liujy.bean.Driver;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DriverMapper {
    int deleteByPrimaryKey(Integer id);

    /**
     * 查询所有
     * @return
     */
    List<Driver> selectByPrimary();

    /**
     * 根据状态查询位子
     * @param status
     * @return
     */
    List<Driver> selectByPrimarywei(Integer status);

    Driver getbyphone(@Param("phone")String phone);

    int insert(Driver record);

    int insertSelective(Driver record);

    Driver selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Driver record);

    int updateByPrimaryKey(Driver record);
}