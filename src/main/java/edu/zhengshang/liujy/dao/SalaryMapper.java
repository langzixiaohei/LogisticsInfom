package edu.zhengshang.liujy.dao;

import edu.zhengshang.liujy.bean.Salary;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SalaryMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Salary record);

    int insertSelective(Salary record);

    Salary selectByPrimaryKey(Integer id);

    /**
     * 查询所有员工工资
     * @return
     */
    List<Salary> getallgz();

    List<Salary> all();

    /**
     * 根据员工id查询工资
     * @param deId
     * @return
     */
    Salary selectByPrimaryby(@Param("deId")Integer deId);

    int updateByPrimaryKeySelective(Salary record);

    int updateByPrimaryKey(Salary record);
}